let mapleader = " " 

set relativenumber
set number
set scrolloff=8
set ignorecase
set incsearch

nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k >:m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

nnoremap <leader>; mzA;<Esc>`z

vnoremap <leader>y "+y

inoremap jj <Esc>

noremap <leader>f :vsc Manobit.CodeBeautifier.CurrentDocument<CR>
"map <leader>pf :vsc VAssistX.OpenFileInSolutionDialog<CR>
map <leader>pf :vsc Edit.GoToAll<CR>
map <leader>pv :vsc View.SolutionExplorer<CR>
map <leader>po :vsc View.Output<CR>

vmap <leader>c :vsc VAssistX.SelectionLineComment<CR>
vmap <leader>u :vsc VAssistX.SelectionLineUncomment<CR>
nmap <leader>q :vsc VAssistX.RefactorContextMenu<CR>
nmap gd :vsc VAssistX.GoToImplementation<CR>
nmap <leader>pd :vsc Edit.PeekDefinition<CR>

"nmap <leader>v :vsc Window.NewVerticalTabGroup<CR>

"xnoremap J :vsc Edit.MoveSelectedLinesDown<CR>=gv
"xnoremap K :vsc Edit.MoveSelectedLinesUp<CR>=gv

"xnoremap J :'<,'>m .+1<CR>=gv
"xnoremap K :'<,'>m .-2<CR>=gv


" vsvim windows specific settings
" copied from Vim 7.3's mswin.vim:

" CTRL-X and SHIFT-Del are Cut
vnoremap <C-X> "+x
vnoremap <S-Del> "+x

" CTRL-C and CTRL-Insert are Copy
vnoremap <C-C> "+y
vnoremap <C-Insert> "+y

" CTRL-V and SHIFT-Insert are Paste
map <C-V>		"+gP
map <S-Insert>		"+gP
imap <C-V>		<Esc>"+gpa

cmap <C-V>		<C-R>+
cmap <S-Insert>		<C-R>+


imap <S-Insert>		<C-V>
vmap <S-Insert>		<C-V>

" Use CTRL-Q to do what CTRL-V used to do
noremap <C-Q>		<C-V>

behave xterm

" backspace in Visual mode deletes selection
vnoremap <BS> d

" Use CTRL-S for saving, also in Insert mode
noremap <C-S>		:update<CR>
vnoremap <C-S>		<C-C>:update<CR>
inoremap <C-S>		<C-O>:update<CR>

" CTRL-Z is Undo; not in cmdline though
noremap <C-Z> u
inoremap <C-Z> <C-O>u

" CTRL-Y is Redo (although not repeat); not in cmdline though
noremap <C-Y> <C-R>
inoremap <C-Y> <C-O><C-R>

" CTRL-A is Select all
noremap <C-A> gggH<C-O>G
inoremap <C-A> <C-O>gg<C-O>gH<C-O>G
cnoremap <C-A> <C-C>gggH<C-O>G
onoremap <C-A> <C-C>gggH<C-O>G
snoremap <C-A> <C-C>gggH<C-O>G
xnoremap <C-A> <C-C>ggVG

map <C-Left> <C-W>h
map <C-Right> <C-W>l
map <C-Up> <C-W>k
map <C-Down> <C-W>j
map <C-h> <C-W>h
map <C-l> <C-W>l

noremap <leader>v :vsplit<CR>
noremap <leader>h :split<CR>

map <leader>so :so C:\Users\jeanl\.vimrc<CR>