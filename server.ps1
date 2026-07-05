$root = "c:\Users\rimmeh\OneDrive - Kardinia International College\Documents\YogaFarmWebsite"

$listener = New-Object System.Net.HttpListener
$listener.Prefixes.Add('http://localhost:3000/')
$listener.Start()
Write-Host "Server running at http://localhost:3000/"

$pool = [runspacefactory]::CreateRunspacePool(1, 20)
$pool.Open()

$handler = {
    param($ctx, $root)
    $req = $ctx.Request
    $res = $ctx.Response
    try {
        $path = [System.Uri]::UnescapeDataString($req.Url.LocalPath)
        if ($path -eq '/' -or $path -eq '') { $path = '/index.html' }
        $file = Join-Path $root ($path.TrimStart('/').Replace('/', '\'))
        if (Test-Path $file -PathType Leaf) {
            $ext = [System.IO.Path]::GetExtension($file).ToLower()
            $mime = switch ($ext) {
                '.html' { 'text/html; charset=utf-8' }
                '.css'  { 'text/css' }
                '.js'   { 'application/javascript' }
                '.png'  { 'image/png' }
                '.jpg'  { 'image/jpeg' }
                '.jpeg' { 'image/jpeg' }
                '.mov'  { 'video/mp4' }
                '.mp4'  { 'video/mp4' }
                '.svg'  { 'image/svg+xml' }
                default { 'text/plain' }
            }
            $fs = [System.IO.File]::OpenRead($file)
            $total = $fs.Length
            $rangeHeader = $req.Headers['Range']
            if ($rangeHeader -and $rangeHeader -match 'bytes=(\d*)-(\d*)') {
                $s = if ($matches[1] -ne '') { [long]$matches[1] } else { $total - [long]$matches[2] }
                $e = if ($matches[2] -ne '') { [long]$matches[2] } else { $total - 1 }
                if ($e -ge $total) { $e = $total - 1 }
                $len = $e - $s + 1
                $res.StatusCode = 206
                $res.ContentType = $mime
                $res.ContentLength64 = $len
                $res.AddHeader('Content-Range', "bytes $s-$e/$total")
                $res.AddHeader('Accept-Ranges', 'bytes')
                $fs.Seek($s, [System.IO.SeekOrigin]::Begin) | Out-Null
                $remaining = $len
            } else {
                $res.StatusCode = 200
                $res.ContentType = $mime
                $res.ContentLength64 = $total
                $res.AddHeader('Accept-Ranges', 'bytes')
                $remaining = $total
            }
            $buf = New-Object byte[] 65536
            $out = $res.OutputStream
            while ($remaining -gt 0) {
                $toRead = [Math]::Min($buf.Length, $remaining)
                $read = $fs.Read($buf, 0, [int]$toRead)
                if ($read -le 0) { break }
                $out.Write($buf, 0, $read)
                $remaining -= $read
            }
            $fs.Close()
        } else {
            $res.StatusCode = 404
            $msg = [System.Text.Encoding]::UTF8.GetBytes('Not found')
            $res.OutputStream.Write($msg, 0, $msg.Length)
        }
    } catch { }
    finally { try { $res.Close() } catch { } }
}

while ($listener.IsListening) {
    $ctx = $listener.GetContext()
    $ps = [powershell]::Create()
    $ps.RunspacePool = $pool
    $ps.AddScript($handler).AddArgument($ctx).AddArgument($root) | Out-Null
    $ps.BeginInvoke() | Out-Null
}
