# git-practice: the merge conflict lab

Run `./setup_conflict.sh` (Mac, Linux, or Git Bash on Windows). It builds `conflict-lab/` with two branches that edit the same line.

1. `cd conflict-lab && git log --oneline --all --graph`
2. `git merge ira-tighten` (this one merges cleanly)
3. `git merge analyst-loosen` (this one conflicts)
4. `git status` shows `config.py` as both modified. Open it and find the markers.
5. Decide the value. Both people have a reason; do not pick one silently. Write the reason in the commit message.
6. `git add config.py` then `git commit` (accept the default merge message and add one line of reason).
7. `git log --oneline --graph` to see the merge.

Never leave `<<<<<<<`, `=======` or `>>>>>>>` in a file. Run `grep -n "<<<<" config.py` before you commit.
