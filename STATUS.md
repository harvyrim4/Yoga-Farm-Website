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
- [x] October Retreat page
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
- **Visual QA not run this session** — this dev machine has no Node.js installed, so `serve.mjs`/`screenshot.mjs` couldn't be run to visually verify the 2026-08-13 changes. All changes were verified by re-reading the edited HTML and a tag-balance check, but a real browser screenshot pass (per CLAUDE.md workflow) is still owed before this goes live.

## Recently locked in
(Already reflected in CLAUDE.md)
- Tagline: "Land. Breathe. Belong."
- Font: Quicksand, headings + body
- 6-item nav structure
- Two CTA labels only: Book / Enquire
- Homepage section order: hero → Welcome to Yoga Farm → 2×2 cards → testimonials → newsletter → contact form → footer
- Scroll-triggered animations (.rev/IntersectionObserver) are intentional and permitted site-wide
- Homepage about section heading: "Welcome to Yoga Farm" with final body copy (locked)
- All four offering card contents updated (see CLAUDE.md table)
- Practitioners page: full real directory — Anna Rimmer, Robyn Thompson, Caroline Chee, Steve Tibbits, Steph Sanzaro, Kimina Lyall, Josephine Lange
- Mojibake fixed across all 9 HTML files (session 2026-07-13)
- Copyright year auto-updates in all 9 footers (session 2026-07-13)
- Offering name: **Monthly Fire Horse Sessions** (not "Fire Horse Sessions") — canonical, updated everywhere
- **Sacred Soil. Sacred Soul.** confirmed as a live offering — added to offerings.html (enquire), yoga-events.html (card + anchor `#sacred-soil`), and all 9 nav Retreats dropdowns
- Anna Rimmer phone display corrected: 0414 283 985 (href and display now match)
- Hero CTA anchors on offerings.html (id="book", id="enquire") exist and work — handoff note was incorrect
- **Colour scheme decided**: "Monochrome Green" palette per `Yoga-Farm-Style-Guide-Monochrome-Green.md` — single green hue (5 tonal steps) + one cream neutral, applied across all 9 pages (2026-08-13)
- **Sacred Soil. Sacred Soul.** is now the October retreat (Oct 16&ndash;18, 2027) — the old generic "October Retreat" naming/copy was retired in favour of it, site-wide (nav, cards, offerings.html, retreats.html). March Retreat's date is now "TBC" (was "March 2027")
- Enquire buttons site-wide now link into the homepage contact form with the specific offering pre-selected in the dropdown (`?interest=` param cross-page, direct JS same-page) — no more plain generic `#contact` links
- Book/Enquire button styling is now consistently fill-vs-outline (Book = filled green, Enquire = outline) everywhere, per the style guide's CTA rule
- New offerings added to the Enquire dropdown/offerings.html: **Gift Cards**; pricing added to Equine Assisted Therapy ($150), Reiki with the Herd ($180), Reiki with Anna ($80, Wellbeing Room)
- Nav/footer logo standardised to the white PNG in a translucent dark pill (no circle) on all 9 pages — 5 pages were previously using an old JPEG logo in a cream circle

## Notes
Short, dated one-liners only — a sentence or two per entry, not paragraphs.

- 2026-07-13: Full content pass on homepage — logo resized, headings updated, about copy finalised, offering card lists updated with real practitioner names and new offerings.
- 2026-07-13: Practitioners page rebuilt from scratch as a proper 7-person directory with direct contact details.
- 2026-07-13: Mojibake fixed site-wide; copyright year now auto-updates; scroll animations confirmed intentional.
- 2026-07-13: Sacred Soil. Sacred Soul. added everywhere; Monthly Fire Horse Sessions canonicalised; Anna's phone display fixed.
- 2026-07-23: Logo green confirmed as #57835E; all 9 pages updated. Headings site-wide set to YF green, font-weight 600, not italic. Nav logo → white on dark pill. Homepage dot-point features removed. Footer logo → white PNG no circle. Contact form: phone field added, "Get in Touch" label removed, Enquire buttons link to #contact. Btn hover colours updated.
- 2026-08-13: Monochrome Green style guide rolled out to all 9 pages (colour vars + heading weight/no-two-tone + fill/outline button system). Nav/footer logo fixed on the 5 pages still using the old circle logo. Sacred Soil. Sacred Soul. retired the old "October Retreat" naming everywhere; March Retreat date set to TBC. Homepage: removed leftover 280×280 placeholder image, fixed a pre-existing curly-quote attribute bug that had silently broken the About heading/paragraph and Practitioners card styling, rewrote all 4 offer cards' copy, removed Studio Hours from the contact form, added Gift Cards + pricing to the Enquire dropdown, wired the contact form and Corporate Retreats form to Formspree (falls back to mailto until a real endpoint is pasted in). Built a sitewide `?interest=` pre-fill mechanism so every Enquire button deep-links to the right dropdown option. Book buttons for Setmore-eligible items wired with a placeholder `SETMORE_LINKS` object per page, ready for real URLs. Could not run the local screenshot QA workflow this session — no Node.js on this machine.
- 2026-08-13 (later same session): Harvey provided real Setmore class links for Yin & Meditation with Anna, Fire Horse Sessions, Seasonal (Spring) Healing Sounds & Yin, and Sacred Soil — all wired into `offerings.html` / `retreat-october.html`. Added Sacred Soil pricing (Early Bird $1,850, $500 deposit) to the retreat page and offerings list. Formspree endpoint (`https://formspree.io/f/xwlebyjb`) wired into `index.html` and `corporate-retreats.html`, replacing the mailto fallback. Discussed hosting: recommended GitHub Pages over Hostinger since the site is fully static; domain cutover for yogafarm.com.au still pending confirmation of who manages its DNS.
