# "nvim at"
function nat {
    cd $1
    tmux new -d -s $1
    tmux send -t $1 "nvim ." C-m
    tmux a -t $1
    popd
}
