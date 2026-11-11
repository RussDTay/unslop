---
name: unslop
description: Turns vibecoded, AI-looking UI into a designed interface with its own character, using only local files and the organization's approved tools. Audits the screen, sets a direction from the product and any existing design system, then fixes spacing, color, icons, copy, type, layout, details, visuals and motion in that order. Use when the user asks to unslop, polish, clean up or redesign a screen so it stops looking AI-generated, or when a UI shows the usual tells like purple gradients, glows, gradient text, emoji labels, "New ✨" badges, glossy blobs, uppercase tracked labels, pulsing elements or uneven spacing.
license: CC-BY-4.0
metadata:
  author: Damir Sokolovsky
  x: https://x.com/heydamir
  variant: corporate-gemini
---

# Unslop (corporate edition for Gemini)

unslop was created by Damir Sokolovsky ([@heydamir](https://x.com/heydamir)), who started the Unslopping series on X. It is licensed under CC BY 4.0 (https://github.com/heydamir/unslop), so keep this credit in any copy or adaptation.

This edition is the same method as the original skill, adapted for company-managed environments. The method itself lives in [references/method.md](references/method.md), the full original instructions with the nine passes, the direction, the checklist and the story video. Read it first and follow it, with the overrides below taking priority wherever they conflict.

## Corporate overrides

### Company rules and design system come first

- Before choosing any direction, look for the organization's design system, tokens, component library, brand guidelines or a `GEMINI.md` / `AGENTS.md` in the project. If one exists, it IS the brand. Keep its colors, type, spacing scale, radii and components, and use unslop only to fix how they are applied and to remove the signs in [references/signs.md](references/signs.md).
- The starting values in [references/tokens.md](references/tokens.md) are only a fallback for projects with no system. Never replace an approved brand token with one of them.
- Use the project's existing components and icon set. Do not add a new UI library, icon package or font family without asking, since each needs approval in most companies.
- The step in the method that says to swap a default font, or to pick a partner mono or display face, applies only when the project has no approved typography. Otherwise keep the approved fonts and fix size, weight, case and tracking.

### Data stays inside

- Work on local files only. Do not paste source code, screenshots, customer data, internal URLs or copy into any external website, chat, paste service or third-party API.
- Mock data in the redesigned screen must be invented. Never copy real customer names, figures or internal identifiers from the code into prompts, reports or story files you share outside the repo.
- Do not load anything from the internet in the output. No CDN scripts, Google Fonts links, remote images or tracking. Fonts are the project's own or system fonts. Icons are inlined SVG or from the installed package.

### No external services without approval

- The method's visual pass mentions image generation through services like fal, Replicate, OpenAI images or Higgsfield. Do not connect, install or call any of them. Use only an image or design tool that the user says the organization has approved and that is already available.
- If none is available, build what can be built in code (charts, cards, objects, SVG), leave an empty slot of the exact size for the rest, and put the image prompt in the report so the user can run it in an approved tool. Never put the prompt text on the page.
- Never add a package, run `npm install`, `npx playwright install` or install ffmpeg yourself. If a step needs one, tell the user the exact command and that it may need IT approval, then continue with what works without it.

### Live sites

- Only snapshot a URL the user gave you and owns or is allowed to copy, using `scripts/snapshot.mjs`. For authenticated, internal or customer-facing pages, ask for the saved HTML file or a screenshot from the user instead of logging in on their behalf. Never enter or store credentials.
- If Playwright is not installed, do not install it. Ask the user for a saved page or work from a screenshot.

### Story video

- The story video is optional and needs Playwright and ffmpeg. Offer it only when the user asks, and check both are already installed before starting. The `unslop by @heydamir` credit stays in every video, as the license asks.

### Change control

- Do not touch files unrelated to the screen. Keep diffs small and reviewable, one pass per logical commit if the user asks for commits, and never commit, push or open pull requests unless asked.
- Respect accessibility and legal requirements the company states, such as WCAG level, localization and required legal text. Never remove or reword legal, compliance, cookie or privacy copy. List it in the report instead if it looks like slop.
- Do not remove claims, badges or logos that look like marketing slop if they are compliance or contractual ("SOC 2", "Certified", partner marks). Ask first, as the method already says for unverifiable claims.

## Run it with Gemini

1. Follow the "Run it" steps in [references/method.md](references/method.md): audit, decide how much to change, set the direction and stop for the user's answer, nine passes, check, report.
2. Ask the user questions in plain text and stop, unless a question tool is available. Do not continue past the direction step without an answer unless the user said to just do it.
3. Render and check at most three times, and only with tools already installed.
4. In the report, add a short "Corporate notes" section: which design-system tokens you kept, anything you did not install or call, and any prompt left for an approved image tool.
