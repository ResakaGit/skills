#!/bin/sh
# Fork layer: upstream skills stay in English, this sets the language the agent replies in.
# Override with SKILLS_LANG, e.g. SKILLS_LANG="Spanish (Rioplatense, voseo)".
lang="${SKILLS_LANG:-Spanish}"

if [ "$1" = "short" ]; then
  echo "Reply in $lang, whatever language the loaded skill is written in."
  exit 0
fi

cat <<RULE
Reply language: $lang.
- Everything written for the user to read (chat replies, questions, reports, HTML explainers, questionnaires) is in $lang, whatever language the loaded skills are written in.
- Documents that live in the repo (specs, tickets, ADRs, GLOSSARY.md, PR descriptions, commit messages) follow the language the repo already uses. If it has none yet, use $lang.
- Keep code, identifiers, commands, paths, skill names and GLOSSARY.md terms verbatim. Keep the /codebase-design vocabulary (module, interface, depth, seam, adapter, leverage, locality) in English inside $lang prose: the skills forbid substitutes for those words.
RULE
