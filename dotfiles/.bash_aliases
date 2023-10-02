alias ls='ls -alh'
alias gs='git reflog | sed -n '"'"'s/.*checkout: moving from .* to \(.*\)/\1/p'"'"' | awk '"'"'!x[$0]++'"'"' | head -20'
