import puppeteer from 'puppeteer';
import { existsSync, mkdirSync, readdirSync } from 'fs';
import { join } from 'path';
import { fileURLToPath } from 'url';

const __dirname = fileURLToPath(new URL('.', import.meta.url));
const url = process.argv[2] || 'http://localhost:3000';
const label = process.argv[3] ? `-${process.argv[3]}` : '';
const outDir = join(__dirname, 'temporary screenshots');

if (!existsSync(outDir)) mkdirSync(outDir, { recursive: true });

const existing = readdirSync(outDir).filter(f => f.startsWith('screenshot-') && f.endsWith('.png'));
const nums = existing.map(f => parseInt(f.match(/screenshot-(\d+)/)?.[1] || '0', 10)).filter(Boolean);
const n = nums.length ? Math.max(...nums) + 1 : 1;
const filename = join(outDir, `screenshot-${n}${label}.png`);

// Try to find puppeteer executable
const possibleExecs = [
  'C:/Users/rimmeh/.cache/puppeteer/chrome/win64-131.0.6778.264/chrome-win64/chrome.exe',
  'C:/Users/nateh/.cache/puppeteer/chrome/win64-131.0.6778.264/chrome-win64/chrome.exe',
];

const execPath = possibleExecs.find(p => existsSync(p));

const browser = await puppeteer.launch({
  headless: true,
  ...(execPath ? { executablePath: execPath } : {}),
  args: ['--no-sandbox', '--disable-setuid-sandbox'],
});

const page = await browser.newPage();
await page.setViewport({ width: 1440, height: 900 });
await page.goto(url, { waitUntil: 'networkidle2', timeout: 30000 });
await new Promise(r => setTimeout(r, 800));
await page.screenshot({ path: filename, fullPage: false });
await browser.close();

console.log(`Saved: ${filename}`);
