# FileSearch
function f() { find . -iname "*$1*" ${@:2} }
function r() { grep "$1" ${@:2} -r . }

# mkdir and cd
function mkcd() { mkdir -p "$@" && cd "$_"; }

function unmount_all {
    diskutil list |
    grep external |
    cut -d ' ' -f 1 |
    while read file
    do
        diskutil unmountDisk "$file"
    done
}
