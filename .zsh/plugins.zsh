source /opt/homebrew/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh

eval 
    fuck () {
        TF_PYTHONIOENCODING=$PYTHONIOENCODING;
        export TF_ALIAS=fuck;
        export TF_SHELL_ALIASES=$(alias);
        export TF_HISTORY="$(fc -ln -10)";
        export PYTHONIOENCODING=utf-8;
        TF_CMD=$(
            thefuck THEFUCK_ARGUMENT_PLACEHOLDER $@
        ) && eval $TF_CMD;
        unset TF_HISTORY;
        export PYTHONIOENCODING=$TF_PYTHONIOENCODING;
        test -n "$TF_CMD" && print -s $TF_CMD
    }
    