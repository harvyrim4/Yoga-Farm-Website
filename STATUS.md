# STATUS.md — Yoga Farm Website: Current Status

Update this file after every work session or big iteration. Do NOT edit CLAUDE.md for status updates — only touch CLAUDE.md when something below becomes a genuinely final, locked-in decision (then move it there and delete it from here).

Keep this file short. It's a snapshot of "where things stand," not a history of how they got there — long narrative/decision-log content should live in your own separate notes, not here.

**Last updated:** 2026-08-13

## Target launch
August 1, 2026

## Build status
- [x] Homepage — hero, about section, offering cards, testimonials, newsletter, contact form, footer
- [x] Navigation + Retreats dropdown (Sacred Soil. Sacred Soul. / March Retreat / Corporate Retreats)
- [x] /offerings page
- [x] Sacred Soil. Sacred Soul. retreat page (`retreat-october.html`, formerly "October Retreat")
- [x] March Retreat page
- [x] Corporate Retreats page
- [ ] About page — no `about.html` exists; nav "About" still links to `#about` anchor on homepage
- [ ] Equine Therapy page — `healing-with-horses.html` exists but missing "why horses, specifically" section and FAQ block (per CLAUDE.md spec)
- [x] Our Practitioners page — rebuilt with real directory of 7 named practitioners

## Open items / blockers
- **Setmore booking links** — done for Yin Yoga & Meditation, Fire Horse Sessions, Seasonal Healing Sounds with Yin, and Sacred Soil (Book buttons open the real Setmore page in a new tab). Still missing for March Retreat (dates TBC anyway) and Summer Solstice Fire Horse Session — both still fall back to the pre-filled Enquire form; paste their URLs into the `SETMORE_LINKS` object in `retreat-march.html` / `offerings.html` when ready.
- **Formspree endpoint wired** (`https://formspree.io/f/xwlebyjb`) in `index.html` and `corporate-retreats.html` — both forms now POST silently, no more mailto/Outlook popup. First real submission needs a one-time confirmation click from whoever's Formspree account this is (signed up under yogafarm3217@gmail.com). Free tier caps at 50 submissions/month.
- Formspree spam filter (reCAPTCHA/honeypot toggle) not yet turned on in the Formspree dashboard — recommended before launch since it's a public form.
- Hosting decision: recommended GitHub Pages (site is fully static) over Hostinger; still need to confirm who currently manages yogafarm.com.au's DNS to plan the domain cutover.
- Which placecard "Explore" pages does Anna think are missing? (all 4 cards already link to existing pages)
- Mailchimp integration details
- Testimonials "Read all reviews" link is a dead `#` placeholder — no testimonials page exists
- Footer social links and Privacy Policy link are dead `#` placeholders on all pages
- About page: standalone `about.html` not yet built
- Video autoplay: needs testing on Anna's device after serve.mjs fix
- `retreat-october.html`'s "What's Included" list was carried over from the old generic October Retreat copy — reads consistent with the Sacred Soil description but Anna should confirm/rewrite it specifically for the 2-night glamping retreat
- **Visual QA still not run** — confirmed two separate blockers this session: no Node.js on this machine (rules out `serve.mjs`/`screenshot.mjs`), and the PowerShell tool available to Claude Code here runs in Constrained Language Mode, which also blocks the Node-free `server.ps1` fallback (`New-Object System.Net.HttpListener` fails outright). Chrome itself is installed and would work fine — it's specifically the sandboxed automation that can't start a local server. Someone running `server.ps1` directly in their own terminal (not through Claude Code) should still work fine. A real screenshot pass is still owed before launch.
- **Two doc/code discrepancies found during 2026-08-13 cleanup, not fixed (flagging for a decision rather than guessing):**
  1. CLAUDE.md's Hard Rules say "No scroll-triggered animation, parallax, or crossfading sections anywhere on the site," but `index.html`'s hero has a scroll-linked parallax effect on the background video (`heroBg.style.transform` tied to `scrollY`) that predates this session. Either the rule needs loosening to explicitly exempt hero parallax, or the parallax script should come out — worth a call given the NDIS/accessibility context (motion sensitivity).
  2. CLAUDE.md's Screenshot Workflow section still references `C:/Users/nateh/AppData/Local/Temp/puppeteer-test/` for Puppeteer — this dev machine is logged in as a different user and has no Node.js at all, so this path is stale/unverifiable from here. Needs updating once someone confirms which machine/user this workflow actually runs on.

## Recently locked in
Everything previously listed here (palette, nav structure, CTA rules, Sacred Soil naming, logo treatment, offering tables, Setmore/Formspree integration pattern) has been folded into CLAUDE.md as of 2026-08-13 and removed from this list — check there for the current locked rules. New decisions get logged here temporarily and moved over once genuinely final.
- Practitioners page directory (names/specialties/contact) is real content, not a "rule" — see `practitioners.html` directly rather than duplicating it here.

## Notes
Short, dated one-liners only — a sentence or two per entry, not paragraphs.

- 2026-07-13: Full content pass on homepage — logo resized, headings updated, about copy finalised, offering card lists updated with real practitioner names and new offerings.
- 2026-07-13: Practitioners page rebuilt from scratch as a proper 7-person directory with direct contact details.
- 2026-07-13: Mojibake fixed site-wide; copyright year now auto-updates; scroll animations confirmed intentional.
- 2026-07-13: Sacred Soil. Sacred Soul. added everywhere; Monthly Fire Horse Sessions canonicalised; Anna's phone display fixed.
- 2026-07-23: Logo green confirmed as #57835E; all 9 pages updated. Headings site-wide set to YF green, font-weight 600, not italic. Nav logo → white on dark pill. Homepage dot-point features removed. Footer logo → white PNG no circle. Contact form: phone field added, "Get in Touch" label removed, Enquire buttons link to #contact. Btn hover colours updated.
- 2026-08-13: Monochrome Green style guide rolled out to all 9 pages (colour vars + heading weight/no-two-tone + fill/outline button system). Nav/footer logo fixed on the 5 pages still using the old circle logo. Sacred Soil. Sacred Soul. retired the old "October Retreat" naming everywhere; March Retreat date set to TBC. Homepage: removed leftover 280×280 placeholder image, fixed a pre-existing curly-quote attribute bug that had silently broken the About heading/paragraph and Practitioners card styling, rewrote all 4 offer cards' copy, removed Studio Hours from the contact form, added Gift Cards + pricing to the Enquire dropdown, wired the contact form and Corporate Retreats form to Formspree (falls back to mailto until a real endpoint is pasted in). Built a sitewide `?interest=` pre-fill mechanism so every Enquire button deep-links to the right dropdown option. Book buttons for Setmore-eligible items wired with a placeholder `SETMORE_LINKS` object per page, ready for real URLs. Could not run the local screenshot QA workflow this session — no Node.js on this machine.
- 2026-08-13 (later same session): Harvey provided real Setmore class links for Yin & Meditation with Anna, Fire Horse Sessions, Seasonal (Spring) Healing Sounds & Yin, and Sacred Soil — all wired into `offerings.html` / `retreat-october.html`. Added Sacred Soil pricing (Early Bird $1,850, $500 deposit) to the retreat page and offerings list. Formspree endpoint (`https://formspree.io/f/xwlebyjb`) wired into `index.html` and `corporate-retreats.html`, replacing the mailto fallback. Discussed hosting: recommended GitHub Pages over Hostinger since the site is fully static; domain cutover for yogafarm.com.au still pending confirmation of who manages its DNS.
- 2026-08-13 (repo cleanup pass): Deleted stale untracked files — `CLAUDE-old-2.md`, `CLAUDE-old-3.md` (superseded CLAUDE.md drafts), `.playwright-cli/` (leftover session logs/screenshots from 2026-07-13). Moved everything genuinely locked-in from this file into CLAUDE.md (palette tokens, nav/logo rules, offering tables, CTA/Setmore/Formspree patterns) and trimmed the duplicated list here. Updated project memory to match. Attempted local visual QA via the Node-free `server.ps1` path found in memory — blocked by Constrained Language Mode in this session's PowerShell tool (see open item above); memory corrected to stop recommending that path from inside Claude Code. Per a follow-up request, dialled every page heading down from font-weight 700 to 600 (kept 700 only on non-heading elements like the footer wordmark and decorative numbers).
