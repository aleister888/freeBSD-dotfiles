"        _      _     _            ___   ___   ___               _                              __ _
"   __ _| | ___(_)___| |_ ___ _ __( _ ) ( _ ) ( _ )   _ ____   _(_)_ __ ___     ___ ___  _ __  / _(_) __ _
"  / _` | |/ _ \ / __| __/ _ \ '__/ _ \ / _ \ / _ \  | '_ \ \ / / | '_ ` _ \   / __/ _ \| '_ \| |_| |/ _` |
" | (_| | |  __/ \__ \ ||  __/ | | (_) | (_) | (_) | | | | \ V /| | | | | | | | (_| (_) | | | |  _| | (_| |
"  \__,_|_|\___|_|___/\__\___|_|  \___/ \___/ \___/  |_| |_|\_/ |_|_| |_| |_|  \___\___/|_| |_|_| |_|\__, |
"                                                                                                    |___/

" --- Plugins ---
call plug#begin('~/.local/share/nvim/plugged')
Plug 'junegunn/goyo.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'frazrepo/vim-rainbow'
Plug 'Gavinok/vim-troff'
Plug 'xarthurx/taskwarrior.vim'
Plug 'kovetskiy/sxhkd-vim'
Plug 'Shougo/unite.vim'
Plug 'itchyny/lightline.vim'
Plug 'lervag/vimtex'
Plug 'godlygeek/tabular'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'junegunn/limelight.vim'
Plug 'bronson/vim-trailing-whitespace'
" Plug 'projekt0n/github-nvim-theme'
Plug 'NLKNguyen/papercolor-theme'
Plug 'norcalli/nvim-colorizer.lua'
" Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'tribela/vim-transparent'
Plug 'preservim/nerdtree'
" Package 'yarn' needed for compiling, and nodejs for autocompiling
" Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'} 
" Plug 'neoclide/coc-vimtex'
"Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'ctrlpvim/ctrlp.vim'
" Plug 'jiangmiao/auto-pairs'
call plug#end()
let g:Hexokinase_highlighters = ['backgroundfull']
let g:Hexokinase_optInPatterns = 'full_hex,rgb,rgba,hsl,hsla,colour_names'

" --- Ctrlpvim options ---
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
  \ 'file': '\v\.(wav|pdf|exe|so|dll|flac
  \ |png|eps|mid|gp5|gp4|gp3|gp|tg
  \ |mp3|reapeaks|mp3)$',
  \ }

" --- Limelight ---

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'
" Default: 0.5
let g:limelight_default_coefficient = 0.7
let g:limelight_paragraph_span = 1
let g:limelight_bop = '^\s'
let g:limelight_eop = '\ze\n^\s'
let g:limelight_priority = -1

" --- Spellchecking ---
map <M-<> :set spell!<CR>
map <M-z> :setlocal spell! spelllang=es_es<CR>
map <C-z> :e ~/.config/nvim/spell/es.utf-8.add
map <M-x> :setlocal spell! spelllang=en_us<CR>
map <C-x> :e ~/.config/nvim/spell/en.utf-8.add

" --- Function for toggling coc.nvim ---
"nnoremap <M-1> :call CocToggle()<cr>

"let g:coc = 0

"function! CocToggle()
"    if g:coc
"        CocEnable
"        let g:coc = 0
"    else
"        CocDisable
"        let g:coc = 1
"    endif
"endfunction

" coc.nvim config

"inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
"                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction" --- Toggle Goyo ---
nnoremap <M-2> :call GoyoToggle()<cr>

let g:goyo = 0

function! GoyoToggle()
    if g:goyo
        Goyo!
        let g:goyo = 0
    else
        Goyo 130
        let g:goyo = 1
    endif
endfunction

" --- Nerdtree ---
map <M-,> :NERDTreeToggle<CR>
nnoremap <C-M-ñ> :call NERDTreeToggleInCurDir()<cr>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
if has('nvim')
        let NERDTreeBookmarksFile = stdpath('data') . '/NERDTreeBookmarks'
else
        let NERDTreeBookmarksFile = '~/.vim' . '/NERDTreeBookmarks'
endif
function! NERDTreeToggleInCurDir()
  " If NERDTree is open in the current buffer
  if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
    exe ":NERDTreeClose"
  else
    if (expand("%:t") != '')
      exe ":NERDTreeFind"
    else
      exe ":NERDTreeToggle"
    endif
  endif
endfunction


" --- AUTOCOMPILE/RESTART ---
autocmd BufWritePost ~/.dotfiles/dwmblocks/blocks.h !pkexec sh -c 'cd /home/aleister/dwmblocks/; make install' && killall -q dwmblocks; dwmblocks &
autocmd BufWritePost ~/.dotfiles/dwm/config.h !pkexec sh -c 'cd /home/aleister/.dotfiles/dwm/; make install'
autocmd BufWritePost ~/.dotfiles/dmenu/config.h !pkexec sh -c 'cd /home/aleister/.dotfiles/dmenu/; make install'
autocmd BufWritePost ~/.dotfiles/.config/sxhkd/sxhkdrc !sh -c "pkill sxhkd; st -e devour sxhkd & disown"

" --- COMPILING DOCUMENTS ---

" Compile Latex and Groff Documents (latexmk,arara,groff,pic,ps2pdf,...)
" Enter file directory (needed for compiling)
autocmd Filetype tex autocmd VimEnter * :cd `dirname %`
autocmd Filetype groff autocmd VimEnter * :cd `dirname %`
map <C-r> :cd `dirname %`

" --- LATEX ---
"compile latex document
autocmd Filetype tex map <M-q> :! arara % <CR>
"open latex document
autocmd Filetype tex map <M-w> :! zathura $(echo % \| sed 's/tex$/pdf/') & 2>/dev/null <CR><CR>

" --- PANDOC ---
" see https://github.com/dialoa/columns for info on lua-filter
"open markdown document
autocmd Filetype markdown map <M-w> :! zathura $(echo % \| sed 's/md$/pdf/') & 2>/dev/null <CR><CR>
"compile markdown into pdf
autocmd Filetype markdown map <M-q> :! pandoc % -o $(echo % \| sed 's/md$/pdf/') --pdf-engine=xelatex --lua-filter="/home/aleister/.config/pandoc_filters/columns.lua" --variable mainfont="Linux Biolinum" -V geometry:margin=0.75in -V fontsize=14pt <CR>

" --- GROFF ---
"open groff document
autocmd Filetype groff map <M-w> :! zathura $(echo % \| sed 's/ms$/pdf/') & 2>/dev/null <CR><CR>
"compile groff document
autocmd Filetype groff map <M-q> :! groff -ms % -T pdf > $(echo % \| sed 's/ms$/pdf/') <CR><CR>
"compile groff document (with images)
autocmd FIletype groff map <M-e> :! groff -ms % -Tps > $(echo % \| sed 's/ms$/ps/'); time ps2pdf $(echo % \| sed 's/ms$/ps/'); rm $(echo % \| sed 's/ms$/ps/') <CR>
"compile groff document with pic
autocmd Filetype groff map <M-a> :! pic % \| groff -ms -Tpdf > $(echo % \| sed 's/ms$/pdf/') <CR>
"compile groff document with pic (with images)
autocmd Filetype groff map <M-s> :! pic % \|  groff -ms -Tps > $(echo % \| sed 's/ms$/ps/'); time ps2pdf $(echo % \| sed 's/ms$/ps/'); rm $(echo % \| sed 's/ms$/ps/') <CR>

" --- Load Templates ---
au BufNewFile * silent! 0r /home/aleister/.config/nvim/templates/%:e.tpl
filetype plugin indent on


" --- Options ---
syntax enable
set title
set clipboard+=unnamedplus
set number relativenumber
set splitbelow splitright
set spelllang=es
set hidden
set ttimeoutlen=0
set ic
set ignorecase
set smartcase
set pastetoggle=<F3>
set mouse=a
set noshowmode
set termguicolors
set clipboard+=unnamedplus
set t_Co=256
set encoding=utf-8
set wildmode=longest,list,full


" --- Colorscheme --- GITHUB THEME
" let g:github_transparent = "true"
" set t_Co=256   " This is may or may not needed.
" colorscheme github_dimmed

" --- Colorscheme --- PAPERCOLOR THEME
set t_Co=256   " This is may or may not needed.
set background=dark
"let g:PaperColor_Theme_Options = {
"  \   'theme': {
"  \     'default.dark': {
"  \       'transparent_background': 1
"  \     }
"  \   }
"  \ }
"colorscheme PaperColor
colorscheme PaperColor
"colorscheme dracula

" --- File syntax ---
	autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown
	autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
	autocmd BufRead,BufNewFile *.tex set filetype=tex
	augroup pandoc_syntax
		au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc_syntax
	augroup END

" --- Lightline Colorscheme ---
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

" --- Vimlatex Options ---
let g:vimtex_compiler_method='latexmk'
let g:vimtex_fold_manual = 1
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_view_method = 'zathura'

" --- Define groff Filetype ---
autocmd BufRead,BufNewFile *.ms,*.me,*.mom set filetype=groff
autocmd BufRead,BufNewFile *.md set filetype=markdown

" --- Groff auto accents ---
autocmd Filetype groff inoremap á  \['a]
autocmd Filetype groff inoremap Á  \['A]
autocmd Filetype groff inoremap é  \['e]
autocmd Filetype groff inoremap É  \['E]
autocmd Filetype groff inoremap í  \['i]
autocmd Filetype groff inoremap Í  \['I]
autocmd Filetype groff inoremap ó  \['o]
autocmd Filetype groff inoremap ú  \['u]
autocmd Filetype groff inoremap Ú  \['U]
autocmd Filetype groff inoremap ñ  \[~n]
autocmd Filetype groff inoremap Ñ  \[~N]
autocmd Filetype groff inoremap ç  \[,c]
autocmd Filetype groff inoremap Ç  \[,C]
autocmd Filetype groff inoremap ¡  \[r!]
autocmd Filetype groff inoremap ¢  \[ct]
autocmd Filetype groff inoremap Ò  \[`O]
autocmd Filetype groff inoremap £  \[Po]
autocmd Filetype groff inoremap Ó  \['O]
autocmd Filetype groff inoremap ¤  \[Cs]
autocmd Filetype groff inoremap Ô  \[^]O
autocmd Filetype groff inoremap ¥  \[Ye]
autocmd Filetype groff inoremap Õ  \[~O]
autocmd Filetype groff inoremap ¦  \[bb]
autocmd Filetype groff inoremap Ö  \[:O]
autocmd Filetype groff inoremap §  \[sc]
autocmd Filetype groff inoremap ×  \[mu]
autocmd Filetype groff inoremap ¨  \[ad]
autocmd Filetype groff inoremap Ø  \[/O]
autocmd Filetype groff inoremap ©  \[co]
autocmd Filetype groff inoremap Ù  \[`U]
autocmd Filetype groff inoremap ª  \[Of]
autocmd Filetype groff inoremap Ú  \['U]
autocmd Filetype groff inoremap «  \[Fo]
autocmd Filetype groff inoremap Û  \[^U]
autocmd Filetype groff inoremap ¬  \[no]
autocmd Filetype groff inoremap Ü  \[:U]
autocmd Filetype groff inoremap ®  \[rg]
autocmd Filetype groff inoremap Ý  \['Y]
autocmd Filetype groff inoremap ¯  \[a-]
autocmd Filetype groff inoremap Þ  \[TP]
autocmd Filetype groff inoremap °  \[de]
autocmd Filetype groff inoremap ß  \[ss]
autocmd Filetype groff inoremap ±  \[+-]
autocmd Filetype groff inoremap à  \[`a]
autocmd Filetype groff inoremap ²  \[S2]
autocmd Filetype groff inoremap ³  \[S3]
autocmd Filetype groff inoremap â  \[^a]
autocmd Filetype groff inoremap ´  \[aa]
autocmd Filetype groff inoremap ã  \[~a]
autocmd Filetype groff inoremap µ  \[mc]
autocmd Filetype groff inoremap ä  \[:a]
autocmd Filetype groff inoremap ¶  \[ps]
autocmd Filetype groff inoremap å  \[oa]
autocmd Filetype groff inoremap ·  \[pc]
autocmd Filetype groff inoremap æ  \[ae]
autocmd Filetype groff inoremap ¸  \[ac]
autocmd Filetype groff inoremap ¹  \[S1]
autocmd Filetype groff inoremap è  \[`e]
autocmd Filetype groff inoremap º  \[Om]
autocmd Filetype groff inoremap »  \[Fc]
autocmd Filetype groff inoremap ê  \[^e]
autocmd Filetype groff inoremap ¼  \[14]
autocmd Filetype groff inoremap ë  \[:e]
autocmd Filetype groff inoremap ½  \[12]
autocmd Filetype groff inoremap ì  \[`i]
autocmd Filetype groff inoremap ¾  \[34]
autocmd Filetype groff inoremap ¿  \[r?]
autocmd Filetype groff inoremap î  \[^i]
autocmd Filetype groff inoremap À  \[`A]
autocmd Filetype groff inoremap ï  \[:i]
autocmd Filetype groff inoremap ð  \[Sd]
autocmd Filetype groff inoremap Â  \[^A]
autocmd Filetype groff inoremap Ã  \[~A]
autocmd Filetype groff inoremap ò  \[`o]
autocmd Filetype groff inoremap Ä  \[:A]
autocmd Filetype groff inoremap Å  \[oA]
autocmd Filetype groff inoremap ô  \[^o]
autocmd Filetype groff inoremap Æ  \[AE]
autocmd Filetype groff inoremap õ  \[~o]
autocmd Filetype groff inoremap ö  \[:o]
autocmd Filetype groff inoremap È  \[`E]
autocmd Filetype groff inoremap ÷  \[di]
autocmd Filetype groff inoremap ø  \[/o]
autocmd Filetype groff inoremap Ê  \[^E]
autocmd Filetype groff inoremap ù  \[`u]
autocmd Filetype groff inoremap Ë  \[:E]
autocmd Filetype groff inoremap Ì  \[`I]
autocmd Filetype groff inoremap û  \[^u]
autocmd Filetype groff inoremap ü  \[:u]
autocmd Filetype groff inoremap Î  \[^I]
autocmd Filetype groff inoremap ý  \['y]
autocmd Filetype groff inoremap Ï  \[:I]
autocmd Filetype groff inoremap þ  \[Tp]
autocmd Filetype groff inoremap Ð  \[-D]
autocmd Filetype groff inoremap ÿ  \[:y]
