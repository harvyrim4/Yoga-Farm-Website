# STATUS.md — Yoga Farm Website: Current Status

Update this file after every work session or big iteration. Do NOT edit CLAUDE.md for status updates — only touch CLAUDE.md when something below becomes a genuinely final, locked-in decision (then move it there and delete it from here).

Keep this file short. It's a snapshot of "where things stand," not a history of how they got there — long narrative/decision-log content should live in your own separate notes, not here.

**Last updated:** 2026-07-23

## Target launch
August 1, 2026

## Build status
- [x] Homepage — hero, about section, offering cards, testimonials, newsletter, contact form, footer
- [x] Navigation + Retreats dropdown (now includes Sacred Soil. Sacred Soul.)
- [x] /offerings page
- [x] October Retreat page
- [x] March Retreat page
- [x] Corporate Retreats page
- [ ] About page — no `about.html` exists; nav "About" still links to `#about` anchor on homepage
- [ ] Equine Therapy page — `healing-with-horses.html` exists but missing "why horses, specifically" section and FAQ block (per CLAUDE.md spec)
- [x] Our Practitioners page — rebuilt with real directory of 7 named practitioners

## Open items / blockers
- Logo green hex locked as **#57835E** (confirmed by Anna 2026-07-23) — updated across all 9 pages
- Booking platform decision — Setmore URL needed for Book button on hero; Book buttons currently link to offerings.html#book
- Enquire button strategy: all Enquire buttons on homepage now link to `#contact` form; other pages use `mailto:` with subject lines — need to confirm Anna's preferred pattern site-wide
- Which placecard "Explore" pages does Anna think are missing? (all 4 cards already link to existing pages)
- Colour scheme: Anna flagged this needs a decision — awaiting her input
- Mailchimp integration details
- Testimonials "Read all reviews" link is a dead `#` placeholder — no testimonials page exists
- Footer social links and Privacy Policy link are dead `#` placeholders on all pages
- About page: standalone `about.html` not yet built
- Video autoplay: needs testing on Anna's device after serve.mjs fix

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

## Notes
Short, dated one-liners only — a sentence or two per entry, not paragraphs.

- 2026-07-13: Full content pass on homepage — logo resized, headings updated, about copy finalised, offering card lists updated with real practitioner names and new offerings.
- 2026-07-13: Practitioners page rebuilt from scratch as a proper 7-person directory with direct contact details.
- 2026-07-13: Mojibake fixed site-wide; copyright year now auto-updates; scroll animations confirmed intentional.
- 2026-07-13: Sacred Soil. Sacred Soul. added everywhere; Monthly Fire Horse Sessions canonicalised; Anna's phone display fixed.
- 2026-07-23: Logo green confirmed as #57835E; all 9 pages updated. Headings site-wide set to YF green, font-weight 600, not italic. Nav logo → white on dark pill. Homepage dot-point features removed. Footer logo → white PNG no circle. Contact form: phone field added, "Get in Touch" label removed, Enquire buttons link to #contact. Btn hover colours updated.
