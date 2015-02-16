" ============== Syntax Settings ==============

filetype plugin indent on

" For all text files set 'textwidth' to 78 characters.
autocmd FileType text setlocal textwidth=78

" Set indentation for specific filetypes
autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType vim setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType javascript setlocal ts=4 sts=4 sw=4 expandtab

" Set Autocomment for specific filetypes

autocmd FileType vim noremap <F5> :s/^/"/<CR>
autocmd FileType vim noremap <F6> :s/^"//<CR>

autocmd FileType bash noremap <F5> :s/^/#/<CR>
autocmd FileType bash noremap <F5> :s/^#//<CR>

autocmd FileType python noremap <F5> :s/^#//<CR>
autocmd FileType python noremap <F5> :s/^#//<CR>

" When saving, strip trailing space, remember cursorposition
fun! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun

autocmd FileType c,cpp,java,php,ruby,python autocmd BufWritePre :call <SID>StripTrailingWhitespaces()
