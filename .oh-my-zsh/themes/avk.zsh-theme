# user, host, full path, and time/date
# on two lines for easier vgrepping
# entry in a nice long thread on the Arch Linux forums: https://bbs.archlinux.org/viewtopic.php?pid=521888#p521888

function retcode() {}
local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ %s)"

# Show all 256 colors with color number
function spectrum_ls() {
  for code in {000..255}; do
    print -P -- "$code: %{$FG[$code]%}$ZSH_SPECTRUM_TEXT%{$reset_color%}"
  done
}

if [[ $TERM = *256color* || $TERM = *rxvt* ]]; then
    turquoise="%F{81}"
    orange="%F{166}"
    purple="%F{135}"
    hotpink="%F{161}"
    limegreen="%F{118}"
else
    turquoise="$fg[cyan]"
    orange="$fg[yellow]"
    purple="$fg[magenta]"
    hotpink="$fg[red]"
    limegreen="$fg[green]"
fi

# PROMPT=$'%{\e[0;34m%}%B[%b%{\e[0;33m%}'%D{"%m/%d %I:%M:%S"}%b$'%{\e[0;34m%}%B]%b%{\e[0m%} %{\e[0;34m%}%B%b%{\e[0;34m%}%B%b%{\e[1;37m%}%~%b%{\e[0m%} %{$(git_prompt_info)%} ${ret_status} '
PROMPT=$'%b%{\e[0m%} %{\e[0;34m%}%B%b%{\e[0;34m%}%B%b%{\e[1;37m%}%~%b%{\e[0m%}%{$fg[red]%}|%{$(git_prompt_info)%} ${ret_status} '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}%{$fg_bold[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}⚡%{$reset_color%}"

