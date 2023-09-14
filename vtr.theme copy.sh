#! bash oh-my-bash.module

# Example 
# (myenv) user@host ~/.../example/test (master ✗) $ 

SCM_NONE_CHAR=''
SCM_THEME_PROMPT_DIRTY=" ${_omb_prompt_red}✗"
SCM_THEME_PROMPT_CLEAN=" ${_omb_prompt_green}✓"
SCM_THEME_PROMPT_PREFIX="${_omb_prompt_white}("
SCM_THEME_PROMPT_SUFFIX="${_omb_prompt_white}) "
SCM_GIT_SHOW_MINIMAL_INFO=true

OMB_PROMPT_VIRTUALENV_FORMAT='(%s) '
OMB_PROMPT_SHOW_PYTHON_VENV=${OMB_PROMPT_SHOW_PYTHON_VENV:=true}


function _omb_theme_PROMPT_COMMAND() {
    # This needs to be first to save last command return code
    local RC="$?"

    local hostname="${_omb_prompt_bold_green}\u@\h"
    local python_venv; _omb_prompt_get_python_venv
    python_venv=$_omb_prompt_white$python_venv

    # Set return status color
    if [[ ${RC} == 0 ]]; then
        ret_status="${_omb_prompt_bold_green}"
    else
        ret_status="${_omb_prompt_bold_red}"
    fi

    # Append new history lines to history file
    history -a

    PS1="$python_venv${hostname} ${_omb_prompt_bold_navy}\w $(scm_prompt_info)${ret_status}${_omb_prompt_white}\$ ${_omb_prompt_normal}"
}

_omb_util_add_prompt_command _omb_theme_PROMPT_COMMAND
@vitorfg8
