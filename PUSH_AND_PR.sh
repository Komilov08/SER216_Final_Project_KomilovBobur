#!/usr/bin/env bash
# Run this AFTER you have signed in to GitHub CLI as the `Komilov08` account
# (or any account with write access to the repository).
#
# To sign in as Komilov08:
#   gh auth login --web
# Then make sure that account is the active one:
#   gh auth switch -u Komilov08

set -e

cd "$(dirname "$0")"

echo "==> Confirming we are on feature/parking-permit-system"
git checkout feature/parking-permit-system

echo "==> Pushing feature branch to origin"
git push -u origin feature/parking-permit-system

echo "==> Creating pull request"
gh pr create \
  --base main \
  --head feature/parking-permit-system \
  --title "Add SER216 final project deliverables (parking permit system)" \
  --body "$(cat <<'EOF'
## Summary
This PR adds every deliverable required by the SER216 final project:

- **Task 1 — Requirements:** 4 functional + 2 non-functional requirements (`notes/requirements.md`)
- **Task 2 — Workflow diagram:** Vehicle Registration → Permit Request → Zone Check → Permit Approval → Parking Verification (`diagrams/workflow_diagram.png`, `diagrams/workflow_diagram.md`)
- **Task 3 — Test cases:** 6 cases — 2 system, 2 acceptance, 2 regression (`tables/test_cases.csv`, `tables/test_cases.md`)
- **Task 4 — Defect analysis:** for the "valid permit shown as expired" issue (`notes/defect_analysis.md`)
- **Final report:** compiled into `final_report.pdf`
- **README.md** updated with project overview, tools, repository layout, and workflow

## Commits
1. `docs: update README with full project description and structure`
2. `feat: add functional and non-functional requirements (Task 1)`
3. `feat: add workflow diagram for permit lifecycle (Task 2)`
4. `feat: add test case table covering system, acceptance, regression (Task 3)`
5. `feat: add defect analysis for expired-permit issue (Task 4)`
6. `docs: add final report PDF and generator script`

## How to verify
- Open `final_report.pdf` for the consolidated report.
- View `diagrams/workflow_diagram.md` on GitHub — Mermaid renders inline.
- Open `tables/test_cases.csv` in Google Sheets / Excel for the test plan.
EOF
)"

echo "==> Merging pull request"
gh pr merge feature/parking-permit-system \
  --merge \
  --delete-branch=false

echo "==> Done. Now take screenshots for the final PDF (see screenshots/README.md)."
