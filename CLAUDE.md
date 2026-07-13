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
- Start the dev server: `node serve.mjs` (serves the project root at `http://localhost:3000`)
- `serve.mjs` lives in the project root. Start it in the background before taking any screenshots.
- If the server is already running, do not start a second instance.

## Screenshot Workflow
- Puppeteer is installed at `C:/Users/nateh/AppData/Local/Temp/puppeteer-test/`. Chrome cache is at `C:/Users/nateh/.cache/puppeteer/`.
- **Always screenshot from localhost:** `node screenshot.mjs http://localhost:3000`
- Screenshots are saved automatically to `./temporary screenshots/screenshot-N.png` (auto-incremented, never overwritten).
- Optional label suffix: `node screenshot.mjs http://localhost:3000 label` → saves as `screenshot-N-label.png`
- `screenshot.mjs` lives in the project root. Use it as-is.
- After screenshotting, read the PNG from `temporary screenshots/` with the Read tool — Claude can see and analyze the image directly.
- When comparing, be specific: "heading is 32px but reference shows ~24px", "card gap is 16px but should be 24px"
- Check: spacing/padding, font size/weight/line-height, colors (exact hex), alignment, border-radius, shadows, image sizing
- **Use this `screenshot.mjs` / Puppeteer workflow for all visual QA on this project. Do not substitute the Playwright skill for this** — it's reserved for other testing needs, not the reference-image comparison loop.

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
- Primary accent colour: the green from the Yoga Farm logo — check `brand_assets/` for the exact file/hex; do not invent a green (unconfirmed — see STATUS.md)
- Logo: check `brand_assets/`
- Homepage hero tagline, directly under the logo: "Land. Breathe. Belong." — use letter-spacing between the three words

## Navigation bar
Six items only, in this order:
1. About
2. Healing with Horses
3. Yoga & Events
4. Retreats (dropdown: October Retreat / March Retreat / Corporate Retreats)
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
| Healing with Horses | Equine Assisted Therapy, Reiki with the Herd, Private Equine Assisted Therapy + Yin with Reiki | Enquire |
| Yoga & Events | Yin Yoga & Meditation, Fire Horse Sessions, Seasonal Healing Sounds with Yin, Summer Solstice Fire Horse Session, Monthly Equine Meditation | Book |
| Retreats | October Retreat, March Retreat (deposit secures spot, balance invoiced manually). Include small text link: "Also available: corporate retreats →" | Book |
| Our Practitioners | Simple bonus listing of room-rental practitioners — name, specialty, one line each — plus Reiki with Anna | Enquire |

**4. Testimonials strip**
- 3–4 hard-coded 5-star review cards (not a live widget) — star rating + "— Google review" attribution
- Include a "Read all reviews" link to the existing full testimonials page
- Do not embed the live Google reviews widget on the homepage — that stays only on the dedicated testimonials page

**5. Newsletter signup**
- Email field + "Sign up" button. Mailchimp integration TBD — build the form so it's easy to wire up later.

**6. Footer**
- Address, contact email (yogafarm3217@gmail.com), social links, "Reviews" link

## /offerings page
Single flat list of all 11 offerings, each with name + CTA button. No separate photo required per row.

| Offering | CTA |
|---|---|
| Equine Assisted Therapy | Enquire |
| Reiki with the Herd | Enquire |
| Private Equine Assisted Therapy + Yin with Reiki | Enquire |
| Yin Yoga & Meditation | Book |
| Fire Horse Sessions | Book |
| Seasonal Healing Sounds with Yin | Book |
| Summer Solstice Fire Horse Session | Book |
| Monthly Equine Meditation | Book |
| October Retreat | Book |
| March Retreat | Book |
| Corporate Retreats | Enquire |
| Our Practitioners (room rentals) | Enquire |
| Reiki with Anna | Enquire |

- Homepage hero's "Book" button links to this page filtered/scrolled to Book items
- Homepage hero's "Enquire" button links to this page filtered/scrolled to Enquire items
- If filtering isn't simple to build, link both buttons to the top of this page instead

## CTA rules — site-wide
- Only ever use two CTA labels: **Book** and **Enquire**
- Book = payment required now, full or deposit
- Enquire = conversation first, no payment upfront
- Do not introduce any other CTA wording anywhere on the site

## Booking & payment
- Current system is Setmore, under review for replacement — do not deeply integrate Setmore-specific code
- Build the "Book" flow as an isolated, clearly separated button/embed section so it can be redirected to a different platform later without rebuilding
- "Enquire" flows (including Corporate Retreats) submit to a simple contact form that emails **yogafarm3217@gmail.com**
- Each Enquire form must set a specific email subject line naming the offering, e.g. "Website Enquiry: Equine Assisted Therapy", "Website Enquiry: Corporate Retreats"

## Retreat pages (October Retreat, March Retreat)
- Hero photo, dates, short paragraph, what's included
- Book button for deposit payment
- Text near the button: "Deposit secures your spot; balance invoiced separately closer to the date"

## Corporate Retreats page
- Enquire form fields: Name, Company Name, Phone Number, Email, Number of Guests
- Tick boxes: Full Day / Half Day
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
