#! /bin/bash

set -eo pipefail

# Vimified is setup from hom dir.
pushd ~
echo "Setup Vimified"
curl -L https://raw.github.com/saileshmittal/vimified/master/install.sh | sh
popd

# Copy dotfiles to home dir
cp -R dotfiles/. ~/

# Source the local bashrc
cat <<EOF >> ~/.bashrc
if [ -f ~/.local_bashrc ]; then
  . ~/.local_bashrc
fi
EOF

