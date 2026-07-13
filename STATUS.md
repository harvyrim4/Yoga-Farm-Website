# STATUS.md — Yoga Farm Website: Current Status

Update this file after every work session or big iteration. Do NOT edit CLAUDE.md for status updates — only touch CLAUDE.md when something below becomes a genuinely final, locked-in decision (then move it there and delete it from here).

Keep this file short. It's a snapshot of "where things stand," not a history of how they got there — long narrative/decision-log content should live in your own separate notes, not here.

**Last updated:** 2026-07-13

## Target launch
August 1, 2026

## Build status
- [x] Homepage — hero, about section, offering cards, testimonials, newsletter, contact form, footer
- [x] Navigation + Retreats dropdown
- [x] /offerings page
- [x] October Retreat page
- [x] March Retreat page
- [x] Corporate Retreats page
- [ ] About page — no `about.html` exists; nav "About" still links to `#about` anchor on homepage
- [ ] Equine Therapy page — `healing-with-horses.html` exists but missing "why horses, specifically" section and FAQ block (per CLAUDE.md spec)
- [x] Our Practitioners page — rebuilt with real directory of 7 named practitioners

## Open items / blockers
- Anna Rimmer's phone on practitioners page shows 11 digits (0414 283 2985) — verify correct number
- Confirm logo green hex — currently using #509652, unverified against physical logo
- Booking platform decision — Setmore still in place, under review
- Finalize Book CTA flow isolation so it can be swapped to a new platform without a rebuild
- Mailchimp integration details
- **Decision needed:** homepage has a full contact form section between newsletter and footer — not in the CLAUDE.md section order spec; keep or remove?
- **Decision needed:** scroll-triggered animations (.rev / IntersectionObserver) used site-wide — this directly violates the CLAUDE.md hard rule "No scroll-triggered animation anywhere on the Yoga Farm site"; keep or remove?
- Testimonials "Read all reviews" link is a dead `#` placeholder — no testimonials page exists
- Footer social links and Privacy Policy link are dead `#` placeholders on all pages
- About page: standalone `about.html` not yet built

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

## Notes
Short, dated one-liners only — a sentence or two per entry, not paragraphs.

- 2026-07-13: Full content pass on homepage — logo resized, headings updated, about copy finalised, offering card lists updated with real practitioner names and new offerings.
- 2026-07-13: Practitioners page rebuilt from scratch as a proper 7-person directory with direct contact details.
- 2026-07-13: Two decisions flagged in Open items above (contact section, scroll animations) — need user decision before resolving.
