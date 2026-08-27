# CLAUDE.md — Yoga Farm Website

@STATUS.md

## Project Overview
Yoga Farm is Anna Rimmer's wellbeing business on a 32-acre property in Mount Duneed, Victoria, Australia (yogafarm.com.au). Anna is the owner and sole teacher. The business offers yin yoga classes, equine-assisted therapy, retreats, workshops, and practitioner room rentals.

**Important constraint:** the property's farm zoning prohibits membership models. All class revenue comes from casual drop-in bookings. This is why the site only ever uses two CTAs (Book / Enquire) — never anything membership- or subscription-shaped.

This file holds locked-in rules only. For current build progress, open items, and anything still in flux, see STATUS.md — don't add status notes here.

**This project intentionally uses two files: CLAUDE.md for stable rules, STATUS.md for living status. Do not consolidate these into one file, including via any CLAUDE.md-management tooling or skill.**

## Always Do First
- **Invoke the `frontend-design` skill** before writing any frontend code, every session, no exceptions.

## Reference Images
- If a reference image is provided: match layout, spacing, typography, and color exactly. Swap in placeholder content (images via `https://placehold.co/`, generic copy). Do not improve or add to the design.
- If no reference image: design from scratch with high craft (see guardrails below).
- Screenshot your output, compare against reference, fix mismatches, re-screenshot. Do at least 2 comparison rounds. Stop only when no visible differences remain or user says so.

## Local Server
- **Always serve on localhost** — never screenshot a `file:///` URL.
- Start the dev server: `node serve.mjs` (serves the project root at `http://localhost:3000`). **On this dev machine (user `rimmeh`), Node.js itself cannot be installed — it's blocked by org/device policy (winget install fails with "Organization policies are preventing installation," MSI error 1625).** `deno run --allow-net --allow-read serve.mjs` runs the identical script and works — Deno is already installed and unaffected by that policy. Prefer real Node if it's ever available; fall back to this Deno invocation otherwise.
- `serve.mjs` lives in the project root. Start it in the background before taking any screenshots.
- If the server is already running, do not start a second instance.

## Screenshot Workflow
- Puppeteer's Chrome is cached at `C:/Users/rimmeh/.cache/puppeteer/chrome/` (version folder name will drift as Puppeteer updates — `screenshot.mjs` scans that directory for whatever version is present rather than hardcoding one).
- **Always screenshot from localhost:** `node screenshot.mjs http://localhost:3000` — or, on this machine where Node can't be installed (see Local Server above): `deno run --allow-net --allow-read --allow-write --allow-env --allow-run --allow-sys screenshot.mjs http://localhost:3000`. `screenshot.mjs`'s `puppeteer` import is written as `npm:puppeteer` specifically so Deno can resolve it (Deno also understands a plain `'puppeteer'` specifier under Node, so this doesn't break a real-Node run).
- Screenshots are saved automatically to `./temporary screenshots/screenshot-N.png` (auto-incremented, never overwritten).
- Optional label suffix: `... screenshot.mjs http://localhost:3000 label` → saves as `screenshot-N-label.png`
- `screenshot.mjs` lives in the project root. Use it as-is (it's already been adapted for Deno per above — don't revert the `npm:puppeteer` import or the version-scanning Chrome lookup).
- This site uses scroll-triggered reveal animations (`.rev` → `.vis` via a one-shot `IntersectionObserver`, see the homepage's `obs` in its inline `<script>`). A screenshot taken immediately on page load only shows whatever was already in the initial viewport — everything below the fold will appear blank (`opacity:0`) unless the page is actually scrolled through first. For a full-page capture, scroll down the page in several steps (with a short pause after each) before taking the shot, then scroll back to top.
- After screenshotting, read the PNG from `temporary screenshots/` with the Read tool — Claude can see and analyze the image directly.
- When comparing, be specific: "heading is 32px but reference shows ~24px", "card gap is 16px but should be 24px"
- Check: spacing/padding, font size/weight/line-height, colors (exact hex), alignment, border-radius, shadows, image sizing
- **Use this `screenshot.mjs` / Puppeteer workflow for all visual QA on this project. Do not substitute the Playwright skill for this** — it's reserved for other testing needs, not the reference-image comparison loop. Running the same sanctioned script through Deno (because Node can't be installed here) is not a substitution of this rule — it's the same tool, same Puppeteer, same Chrome binary, just a different JS runtime executing it.

## Output Defaults
- Single `index.html` file, all styles inline, unless user says otherwise
- Tailwind CSS via CDN: `<script src="https://cdn.tailwindcss.com"></script>`
- Placeholder images: `https://placehold.co/WIDTHxHEIGHT`
- Mobile-first responsive

## Brand Assets
- Always check the `brand_assets/` folder before designing. It may contain logos, color guides, style guides, or images.
- If assets exist there, use them. Do not use placeholders where real assets are available.
- If a logo is present, use it. If a color palette is defined, use those exact values — do not invent brand colors.

## Anti-Generic Guardrails
- **Colors:** Never use default Tailwind palette (indigo-500, blue-600, etc.). Pick a custom brand color and derive from it.
- **Shadows:** Never use flat `shadow-md`. Use layered, color-tinted shadows with low opacity.
- **Typography:** Never use the same font for headings and body. Pair a display/serif with a clean sans. Apply tight tracking (`-0.03em`) on large headings, generous line-height (`1.7`) on body. **Exception: on the Yoga Farm project, use Quicksand for both headings and body — do not add a second font.**
- **Gradients:** Layer multiple radial gradients. Add grain/texture via SVG noise filter for depth.
- **Animations:** Only animate `transform` and `opacity`. Never `transition-all`. Use spring-style easing.
- **Interactive states:** Every clickable element needs hover, focus-visible, and active states. No exceptions.
- **Images:** Add a gradient overlay (`bg-gradient-to-t from-black/60`) and a color treatment layer with `mix-blend-multiply`.
- **Spacing:** Use intentional, consistent spacing tokens — not random Tailwind steps.
- **Depth:** Surfaces should have a layering system (base → elevated → floating), not all sit at the same z-plane.

## Hard Rules
- Do not add sections, features, or content not in the reference
- Do not "improve" a reference design — match it
- Do not stop after one screenshot pass
- Do not use `transition-all`
- Do not use default Tailwind blue/indigo as primary color
- No scroll-triggered animation, parallax, or crossfading sections anywhere on the Yoga Farm site
- No carousels or sliders anywhere on the Yoga Farm site — everything sits static on the page

---

# Yoga Farm — Brand & Content Rules

## Branding
- Font: Quicksand, for both headings and body text
- **Colour palette: "Monochrome Green"** (locked) — one hue in five tonal steps plus one cream neutral, no second colour anywhere on the site. Full token values and usage table live in `Yoga-Farm-Style-Guide-Monochrome-Green.md`:
  - `--yf-green-100: #EAF0E6` (palest — subtle washes) · `--yf-green-300: #A9C0A6` (borders/dividers) · `--yf-green-500: #57835E` (base — logo colour, buttons, links) · `--yf-green-700: #3C5B42` (headings) · `--yf-green-900: #23361F` (body text) · `--yf-cream: #F6F1E7` (page background)
  - Headings: two-tone treatment on section-level h1/h2 (`.sec-title`), the `.offering-title` (healing-with-horses.html) and `.event-title` (yoga-events.html) card titles, and `h1` on solid-colour page heroes — the lighter portion wraps in `<em>`, rendered lighter in both shade (`--yf-green-500` on light backgrounds, `--yf-green-300` on dark) and weight (400) than the rest of the heading, which stays `--yf-green-700`/cream at font-weight 600. The split point is per-heading (usually but not always just the first word — e.g. "Welcome to *Yoga Farm*" light/bold splits after two words, not one; Anna's 2026-08-27 annotated heading list is the source of truth for every current split, see STATUS.md 2026-08-27 note for the full mapping). Skip two-tone entirely on: the homepage hero tagline ("Land. Breathe. Belong."), any h1 sitting over a photo/video hero (contrast risk — keep flat cream; the CSS neutralises `<em>` on these via `color/font-weight: inherit`, so word order there doesn't visually matter but should still match Anna's list for consistency), and other card-level titles not listed above (retreat/corporate-title, practitioner names, homepage offer-card titles).
  - Buttons: **Book** = filled `--yf-green-500` with cream text; **Enquire** = outline `--yf-green-500`/transparent fill (cream outline instead of green when sitting over a dark photo/video background, for legibility)
- Logo: `brand_assets/yoga farm 3217 logo white@3x.png`. Nav and footer both use the white PNG (never the green or old JPEG logo files) — nav sits inside a translucent dark pill (`rgba(15,22,15,0.4)`, `border-radius:10px`) for contrast against both the video hero and solid cream nav bars; footer logo sits plain, no circle.
- Homepage hero tagline, directly under the logo: "Land. Breathe. Belong." — use letter-spacing between the three words

## Navigation bar
Six items only, in this order:
1. About
2. Healing with Horses
3. Yoga & Events
4. Retreats (dropdown: Sacred Soil. Sacred Soul. / Corporate Retreats — March Retreat is currently unpublished, see STATUS.md)
5. Our Practitioners
6. Contact

- No "Home" item — logo links home
- No "Reviews" item in the nav — reviews go on the homepage and in the footer instead

## Homepage — build in this order

**1. Hero**
- Full-width looping background video from `brand_assets/`. Muted, autoplay, loop, no controls. Include a static fallback image.
- Logo + tagline ("Land. Breathe. Belong.")
- Two buttons side by side: **Book** (solid/filled) and **Enquire** (outline)

**2. Intro paragraph**
- 2–3 sentences under the hero. Use placeholder copy until real copy is supplied — do not invent final marketing copy.

**3. Four offering cards** — grid, 2×2 on desktop, stacked on mobile. Each card: one photo from `brand_assets/`, 2–3 sentence description, one CTA button.

| Card | Offerings inside | CTA button |
|---|---|---|
| Healing with Horses | Equine Assisted Therapy, Equine Assisted Reiki + Somatic Healing, plus a small link: "Enquire to create your own experience with the herd" | Enquire |
| Yoga & Events | Yin Yoga & Meditation, Monthly Fire Horse Sessions, Seasonal Healing Sounds with Yin | Book |
| Retreats | Sacred Soil. Sacred Soul. — 2 Night Women's Glamping Retreat (Oct 16–18, 2026). Small link: "Private Groups & Corporate Bookings Available" | Book |
| Our Practitioners | One-paragraph summary of modalities on offer (Naturopathy, Osteopathy/Somatic Experiencing, Psychotherapy/Hypnotherapy, Energy Healing, Psychology/EMDR, Women's Health Massage + more) | Enquire |

**4. Testimonials strip**
- 3–4 hard-coded 5-star review cards (not a live widget) — star rating + "— Google review" attribution
- Include a "Read all reviews" link to the existing full testimonials page
- Do not embed the live Google reviews widget on the homepage — that stays only on the dedicated testimonials page

**5. Newsletter signup**
- Email field + "Sign up" button, POSTs directly to Anna's real Mailchimp embedded-form endpoint (opens in a new tab, per Mailchimp's own pattern) — includes the required hidden honeypot field Mailchimp generates alongside the real one.

**6. Footer**
- Address, contact email (yogafarm3217@gmail.com), social links, "Reviews" link

## /offerings page
Single flat list of offerings, each with name + CTA button. No separate photo required per row.

| Offering | CTA |
|---|---|
| Equine Assisted Therapy — $150 (60 min, one-on-one) | Enquire |
| Equine Assisted Reiki + Somatic Healing — $250 (75 min, one-on-one) | Enquire |
| Equine Assisted Therapy + Yin Yoga — $300 (2¼ hrs) | Enquire |
| Private Yin Yoga with Reiki — $200 (90 min, one-on-one) | Enquire |
| Reiki with Anna — $80 (45 min, Wellbeing Room) | Enquire |
| Gift Cards — digital, any amount, via Square | Book |
| Sacred Soil. Sacred Soul. (Oct 16–18, 2026) | Book |
| Monthly Fire Horse Sessions — $80 (2.5 hrs, group, last Sunday of the month) | Book |
| Seasonal Healing Sounds with Yin — $40 (1.5 hrs, group, quarterly) | Book |
| Yin Yoga & Meditation — $22 (75 min) | Book |
| Corporate Retreats | Enquire |
| Room Rental Enquiries (Our Practitioners) | Enquire |

Equine Meditation Group is currently pulled from every listing (offerings page, homepage dropdown) — Anna's site notes said it and Summer Solstice Fire Horse Session "will be added closer to the events." Not deleted from history, just not listed as a live offering right now — see STATUS.md.

- Homepage hero's "Book" button links to this page filtered/scrolled to Book items
- Homepage hero's "Enquire" button links to this page filtered/scrolled to Enquire items
- If filtering isn't simple to build, link both buttons to the top of this page instead

## CTA rules — site-wide
- Only ever use two CTA labels: **Book** and **Enquire**
- Book = payment required now, full or deposit
- Enquire = conversation first, no payment upfront
- Do not introduce any other CTA wording anywhere on the site
- Styling is consistent everywhere: **Book** = filled `--yf-green-500` button; **Enquire** = outline button, never filled. Keep the two visually distinct by fill vs. outline, not by colour.
- Every Enquire button/link site-wide deep-links into the homepage contact form with its offering pre-selected in the "I'm interested in" dropdown — same-page links (homepage cards) set it via the `setInterest()` JS helper, cross-page links use `index.html?interest=<offering name>#contact`. When adding a new Enquire CTA anywhere, follow this pattern rather than a plain `#contact` link.

## Booking & payment
- **Setmore confirmed** as the booking system (decision made 2026-08-13; may be revisited for Supabase/Hostinger-based alternatives down the road, but not an active project right now).
- The "Book" flow stays isolated and clearly separated per page: each page with Setmore-eligible items defines its own `SETMORE_LINKS` JS object (e.g. in `offerings.html`, `retreat-october.html`, `retreat-march.html`) mapping an item key to its Setmore class URL. A `bookNow(key, event)` helper opens the Setmore link in a new tab if one is set, otherwise falls through to the item's Enquire-flow href. This keeps swapping booking platforms later a one-object edit, not a rebuild.
- Items not yet on Setmore (e.g. Equine Meditation Group) route to Enquire instead of Book until they're added.
- **Gift Cards** are the one exception to the Setmore pattern: the Book button links straight out to Anna's Square gift card purchase page (`https://app.squareup.com/gift/MLJRMY16WEQ72/order`, opens in a new tab) rather than Setmore or the Formspree enquiry flow, since Square handles the payment directly.
- "Enquire" flows (including Corporate Retreats) submit via **Formspree** (no `mailto:`/email-client popup) — see STATUS.md for the live endpoint. Falls back to `mailto:` automatically if `FORMSPREE_ENDPOINT` is ever unset.
- Each Enquire form must set a specific email subject line naming the offering, e.g. "Website Enquiry: Equine Assisted Therapy", "Website Enquiry: Corporate Retreats"

## Retreat pages (Sacred Soil. Sacred Soul. at `retreat-october.html`)
- Hero photo, dates, short paragraph, what's included
- Book button for deposit payment, wired to Setmore per the Booking & payment rules above
- Text near the button: "Deposit secures your spot; balance invoiced separately closer to the date"
- Sacred Soil. Sacred Soul. pricing: Early Bird $1,850, $500 deposit secures a spot — display this near the Book button
- `retreat-march.html` still exists on disk with a March Retreat page built out, but is currently unpublished (unlinked from nav/offerings, `noindex` meta tag added) — see STATUS.md for why and how to bring it back

## Corporate Retreats page
- Enquire form fields: Name, Company Name, Phone Number, Email, Number of Guests
- Tick boxes: Full Day / Half Day / Overnight
- Tick boxes: Offerings wanted — Yoga, Equine, Sound
- Checkboxes: Presenting Space, Accommodation, Catering
- Submits to yogafarm3217@gmail.com with subject "Website Enquiry: Corporate Retreats"

## SEO
- Use these terms naturally in page titles, headings, meta descriptions, and image alt text — do not stuff them: Equine Therapy, Yin Yoga, Yoga, Meditation, Yoga Retreats, Wellbeing, Wellbeing Destination, Yoga Retreat Victoria, Torquay Yoga, Geelong Wellness Retreat, Equine Therapy Victoria, Wellness Retreat near Geelong, Mt Duneed Yoga

## Accessibility
- Sufficient colour contrast
- Descriptive alt text on all images
- Full keyboard navigability
- (Equine Assisted Therapy includes an NDIS-related funded stream — treat accessibility as a genuine requirement, not optional polish)

## Legal
- Link to the owner's existing privacy policy from the footer (placeholder link until copy is supplied)
