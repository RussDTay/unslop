#!/usr/bin/env bash
# Builds the corporate Gemini bundle into gemini/dist/unslop
# The method and references come from skills/unslop, so they never drift.
set -euo pipefail
here="$(cd "$(dirname "$0")" && pwd)"
src="$here/../skills/unslop"
out="$here/dist/unslop"
rm -rf "$out"
mkdir -p "$out/skills/unslop"
skill="$out/skills/unslop"
cp -r "$src/references" "$src/scripts" "$skill/"
# strip the frontmatter so only one skill is discoverable
awk 'BEGIN{f=0} /^---$/ && f<2 {f++; next} f>=2 {print}' "$src/SKILL.md" > "$skill/references/method.md"
cp "$here/overlay/SKILL.md" "$skill/SKILL.md"
cp "$here/overlay/GEMINI.md" "$here/gemini-extension.json" "$out/"
cp "$here/../LICENSE" "$out/LICENSE"
# the copied method links to references/x.md relative to SKILL.md; fix to sibling paths
sed -i 's#(references/#(#g; s#(\./references/#(#g' "$skill/references/method.md"
echo "Built $out"
echo "  extension: gemini extensions install $out   (or: gemini extensions link $out)"
echo "  skill only: cp -r $skill ~/.gemini/skills/   or   <project>/.gemini/skills/"
