#!/usr/bin/env bash
# Builds a small repo with two branches that change the same line.
set -e
rm -rf conflict-lab && mkdir conflict-lab && cd conflict-lab
git init -q -b main
git config user.name "Practice"; git config user.email "practice@example.com"
cat > config.py <<'PY'
# Dhruva triage settings
CRITERIA = 6
ADVANCE_AT = 7.0      # fit score out of 10 needed to advance to a call
MIN_EVIDENCE = 3      # more missing criteria than this: no recommendation
COST_CEILING_INR = 20
PY
cat > README.md <<'MD'
# conflict-lab
Two people edited ADVANCE_AT. Merge their work.
MD
git add . && git commit -qm "Start: Dhruva settings"

git checkout -q -b ira-tighten
sed -i.bak 's/^ADVANCE_AT = 7.0 .*/ADVANCE_AT = 8.0      # Ira: calls were thin last quarter, only the strongest/' config.py && rm config.py.bak
git commit -qam "Raise ADVANCE_AT to 8.0: fewer, stronger calls"

git checkout -q main
git checkout -q -b analyst-loosen
sed -i.bak 's/^ADVANCE_AT = 7.0 .*/ADVANCE_AT = 6.5      # analyst: we are missing good seed-stage deals/' config.py && rm config.py.bak
git commit -qam "Lower ADVANCE_AT to 6.5: do not miss seed-stage deals"

git checkout -q main
echo "Done. Now run: cd conflict-lab && git merge ira-tighten && git merge analyst-loosen"
