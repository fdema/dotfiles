"============== Custom Mappings ===============

" make space additional leader
map <space> \

" Make up and down act as "move line" in normal mode and visual mode
" Make left and right act as indentation tools
nn <down> ddp
nn <left> <<
nn <right> >>
nn <up> ddkP

vm <left> <
vm <right> >

" Make Y behave like C or D
map Y y$

" general mapping
nmap <C-Tab> :tabnext<CR>
nmap <C-S-Tab> :tabprevious<CR>
map <C-S-Tab> :tabprevious<CR>
map <C-Tab> :tabnext<CR>
imap <C-S-Tab> <ESC>:tabprevious<CR>
imap <C-Tab> <ESC>:tabnext<CR>
noremap <F7> :set expandtab!<CR>
nmap <Leader>h :tabnew %:h<CR>
map <F2> :nohls<CR>

"custom comma motion mapping
nnoremap di, f,dT,
nnoremap ci, f,cT,
nnoremap da, f,ld2T, "delete argument
nnoremap ca, f,ld2T,i "delete arg and insert

" diff
noremap ]c ]czz
noremap [c [czz

" <leader> + o to create a new line below cursor in normal mode
noremap <leader>o o<ESC>k
" <leader> + o to create a new line above cursor in normal mode
noremap <leader>O O<ESC>j

" Auto-center navigation commands
noremap G Gzz
noremap n nzz
noremap N Nzz
noremap } }zz
noremap { {zz

" Shortcut to quickly toggle 'set list'
nmap <leader>l :set list!<CR>

" use ctrl+s to save
inoremap <C-S> <C-O>:update<CR>
nnoremap <C-S> :update<CR>

" Easier indenting of codeblocks in visual mode
vnoremap > >gv
vnoremap < <gv
