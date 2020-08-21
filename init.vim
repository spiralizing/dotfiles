set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
if exists('g:vscode')
    " VSCode extension
    source ~/.config/dotfiles/vimrc_VSC
else
    " ordinary neovim
    source ~/.config/dotfiles/vimrc_XIII
endif
