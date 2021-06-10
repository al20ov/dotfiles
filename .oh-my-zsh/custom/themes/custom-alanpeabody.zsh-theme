local user='%{$fg[magenta]%}%n@%{$fg[magenta]%}debian%{$reset_color%}'
local pwd='%{$fg[blue]%}%~%{$reset_color%}'
local return_code='%(?..%{$fg[red]%}%? ↵%{$reset_color%})'

ZSH_THEME_RVM_PROMPT_OPTIONS="i v g"

ZSH_THEME_RUBY_PROMPT_PREFIX="%{$fg[green]%}‹"
ZSH_THEME_RUBY_PROMPT_SUFFIX="›%{$reset_color%}"

PROMPT="${user} ${pwd}$ "
RPROMPT="${return_code}"
