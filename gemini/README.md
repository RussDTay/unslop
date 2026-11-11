# unslop for Gemini in a corporate environment

A variant of unslop for Gemini CLI (and any Gemini tool that reads Agent Skills or `GEMINI.md`) in company-managed setups. The method is the same. The overlay adds rules for work environments: the company design system wins over the starter tokens, no code or screenshots leave the machine, no external image services, no installs without approval, and nothing loads from the internet in the output.

## Build

```bash
./gemini/build.sh
```

This writes `gemini/dist/unslop`, assembled from `skills/unslop` plus `gemini/overlay`, so it stays in sync with the main skill. Rerun it after updating the repo.

## Install

Pick one. Check with your IT or security team which is allowed.

```bash
# Gemini CLI extension, user wide
gemini extensions install ./gemini/dist/unslop

# Skill only, for one project
mkdir -p .gemini/skills && cp -r gemini/dist/unslop/skills/unslop .gemini/skills/

# Skill only, for you
mkdir -p ~/.gemini/skills && cp -r gemini/dist/unslop/skills/unslop ~/.gemini/skills/
```

The `dist` folder is plain files with no network access or dependencies, so it can also be reviewed and shipped through an internal repository or artifact store. Run `/skills list` in Gemini CLI to confirm it loaded.

## Use

```
Use the unslop skill on this dashboard
Unslop src/pages/Billing.tsx using our design system in docs/tokens.md
```

## Optional pieces

Live site snapshots and story videos need Playwright and ffmpeg. The skill never installs them. If your company allows them, install them yourself as described in the main README.

## What differs from the original

- Design system and brand tokens override the starter tokens and type suggestions.
- No external image generation. Prompts go in the report for an approved tool.
- No packages installed, no CDN, font or image links in the output.
- No login or credentials for snapshots, and no changes to legal or compliance copy.
- A "Corporate notes" section in the report.

Created by Damir Sokolovsky ([@heydamir](https://x.com/heydamir)), CC BY 4.0.
