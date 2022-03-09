#! /bin/bash

set -eo pipefail

echo "==================="
echo "Setup Vimified"
curl -L https://raw.github.com/saileshmittal/vimified/master/install.sh | sh

echo "==================="
echo "Git Completion Bash"
cp .git-completion.bash ~/
cat <<EOF >> ~/.bashrc
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi
EOF

echo "==================="
echo "Git Prompt"
cp .git-prompt.sh ~/
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWCOLORHINTS=1
PROMPT_COMMAND='__git_ps1 "\w" "\\\$ "'

echo "==================="
echo "Case Insensitive auto-complete"
# If ~/.inputrc doesn't exist yet: First include the original /etc/inputrc
# so it won't get overriden
if [ ! -a ~/.inputrc ]; then echo '$include /etc/inputrc' > ~/.inputrc; fi
# Add shell-option to ~/.inputrc to enable case-insensitive tab completion
echo 'set completion-ignore-case On' >> ~/.inputrc

