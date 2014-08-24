#!/usr/bin/env zsh
setopt promptsubst
autoload -U add-zsh-hook

ruby_info_prompt() {
  if  [ -f "$PWD/.ruby-version" ] ; then
    if [ -e ~/.rvm/bin/rvm-prompt ]; then
      RUBY_VERSION_PROMPT="%{$fg[red]%}‹$(~/.rvm/bin/rvm-prompt i v)› %{$reset_color%}"
    else
      if which rbenv &> /dev/null; then
        RUBY_VERSION_PROMPT="%{$fg[red]%}‹$(rbenv version | sed -e "s/ (set.*$//")› %{$reset_color%}"
      fi
    fi
  fi
  echo $RUBY_VERSION_PROMPT
}



PROMPT_SUCCESS_COLOR=$FG[117]
PROMPT_FAILURE_COLOR=$FG[124]
PROMPT_VCS_INFO_COLOR=$FG[242]
PROMPT_PROMPT=$FG[077]

GIT_DIRTY_COLOR=$FG[140]
GIT_CLEAN_COLOR=$FG[118]
GIT_PROMPT_INFO=$FG[201]

#PROMPT
PROMPT='%{$fg[cyan]%}%n%{$reset_color%}@%{$fg[yellow]%}%m'
PROMPT=$PROMPT'%{$PROMPT_SUCCESS_COLOR%} %~%{$reset_color%} $(ruby_info_prompt)'
PROMPT=$PROMPT'%{$GIT_PROMPT_INFO%}$(git_prompt_info)%{$GIT_DIRTY_COLOR%}$(git_prompt_status) '
#PROMPT=$PROMPT'%{$reset_color%}%{$PROMPT_PROMPT%}$%{$reset_color%} %B%F{red}❯%F{yellow}❯%F{green}❯%f%b'
PROMPT=$PROMPT'%{$reset_color%}% %B%F{red}❯%F{yellow}❯%F{green}❯%f%b'


#GIT BRANCH AND STATUS BRANCH
ZSH_THEME_GIT_PROMPT_PREFIX="( "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$GIT_PROMPT_INFO%})"
ZSH_THEME_GIT_PROMPT_DIRT=" %{$GIT_DIRTY_COLOR%}✘"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$GIT_CLEAN_COLOR%}✔"


#GIT STATUS
ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg[yellow]%}⬆%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_BEHIND="%{$fg[yellow]%}⬇%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_ADDED="%{$FG[082]%}✚%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$FG[166]%}✱%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DELETED="%{$FG[160]%}✖%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_STASHED="%{$FG[160]%}✭%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$FG[220]%}➜%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$FG[082]%}═%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$FG[190]%}◼%{$reset_color%}"
