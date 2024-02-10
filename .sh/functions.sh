# FileSearch
function f() { find . -iname "*$1*" ${@:2}; }
function r() { grep "$1" ${@:2} -r .; }

# mkdir and cd
function mkcd() { mkdir -p "$@" && cd "$_"; }
