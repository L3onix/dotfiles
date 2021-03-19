# dotfiles
Minhas configurações de ambiente de desenvolvimento Linux

## VIM

1. **Criando pasta VIM**
```sh
mkdir -p ~/.vim/bundle
```

2. **Clonar Vundle**
```sh
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

3. **Criar arquivo .vimrc**
```sh
vim ~/.vimrc
```
```sh
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Vundle
Plugin 'VundleVim/Vundle.vim'

" NERDTree
Plugin 'scrooloose/nerdtree'

" vim-airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" ctrlp
Plugin 'ctrlpvim/ctrlp.vim'

" Emmet
Plugin 'mattn/emmet-vim'

" Dracula
Plugin 'dracula/vim', { 'name': 'dracula' }

call vundle#end()            " required
filetype plugin indent on    " required

" set theme
set ts=4 sw=4
set number
syntax on
colorscheme dracula

" NERDTree configs
" nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-m> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

let g:airline_theme='simple'
    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif

    " unicode symbols
    let g:airline_left_sep = '»'
    let g:airline_left_sep = '▶'
    let g:airline_right_sep = '«'
    let g:airline_right_sep = '◀'
    let g:airline_symbols.crypt = '🔒'
    let g:airline_symbols.linenr = '☰'
    let g:airline_symbols.linenr = '␊'
    let g:airline_symbols.linenr = '␤'
    let g:airline_symbols.linenr = '¶'
    let g:airline_symbols.maxlinenr = ''
    let g:airline_symbols.maxlinenr = '㏑'
    let g:airline_symbols.branch = '⎇'
    let g:airline_symbols.paste = 'ρ'
    let g:airline_symbols.paste = 'Þ'
    let g:airline_symbols.paste = '∥'
    let g:airline_symbols.spell = 'Ꞩ'
    let g:airline_symbols.notexists = 'Ɇ'
    let g:airline_symbols.whitespace = 'Ξ'

    " powerline symbols
    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''
    let g:airline_symbols.branch = ''
    let g:airline_symbols.readonly = ''
    let g:airline_symbols.linenr = '☰'
    let g:airline_symbols.maxlinenr = ''
```

4. **Instalar plugins da configuração .vimrc**[
```sh
vim +PluginInstall +qall
```
