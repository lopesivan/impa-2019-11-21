" local.vimrc - Local
" Maintainer: Mr. Ivan

"map <F5> :A<CR>:BufOnly<CR>

let g:surround_{char2nr('c')} = "\\\1command\1{\r}"
map <F9> ysiwc


" vim: fdm=marker:sw=4:sts=4:et
