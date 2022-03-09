#! /bin/bash

set -eo pipefail

echo "Setup Vimified"
curl -L https://raw.github.com/saileshmittal/vimified/master/install.sh | sh

# Copy dotfiles to home dir
cp dotfiles/* ~/

# Source the local bashrc
cat <<EOF >> ~/.bashrc
if [ -f ~/.local_bashrc ]; then
  . ~/.local_bashrc
fi
EOF

