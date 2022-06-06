    " Vimrc this is the normal terminal look
        " Don't try to be vi compatible
        set nocompatible
        filetype off

        " Turn on syntax highlighting

        syntax on
        set mouse=a
        set modelines=0
        set number
        set ruler
        set visualbell

        " Whitespace

        set wrap
        set textwidth=79
        set formatoptions=tcqrn1
        set tabstop=4
        set shiftwidth=4
        set expandtab
        set autoindent
        set smartindent

        " Search
        nnoremap / /\v
        vnoremap / /\v

    " Plugins:
        call plug#begin("plugged")

            Plug 'preservim/nerdtree' " NERDTree
            Plug 'vim-airline/vim-airline' " Status bar
            Plug 'neoclide/coc.nvim', {'branch': 'release'} " Len server
            Plug 'glepnir/dashboard-nvim' " Dashboard
            Plug 'nvim-telescope/telescope.nvim' " Telescope
            Plug 'nvim-lua/plenary.nvim' " Dep of telescope
            Plug 'preservim/tagbar' " Tagbar
            Plug 'tpope/vim-fugitive' " Git support

        call plug#end()


    " Plugin shortcuts:

        " Nerdtree cmd shortcuts
        nnoremap <C-f> :NERDTreeFocus<CR>
        nnoremap <C-n> :NERDTree %<CR>
        nnoremap <C-t> :NERDTreeToggle<CR>

        " Coc
        let g:coc_global_extensions = ['coc-snippets', 'coc-clangd']
        inoremap <silent><expr> <c-space> coc#refresh()

        " Dashboard fuzzy finder (telescope) and shortcuts
        let g:dashboard_default_executive ='telescope'
        let g:mapleader="\<Space>"
        nnoremap <C-d> :Dashboard<CR>
        nmap <Leader>ss :<C-u>SessionSave<CR>
        nmap <Leader>sl :<C-u>SessionLoad<CR>
        nnoremap <silent> <Leader>fh :DashboardFindHistory<CR>
        nnoremap <silent> <Leader>ff :DashboardFindFile<CR>
        nnoremap <silent> <Leader>tc :DashboardChangeColorscheme<CR>
        nnoremap <silent> <Leader>fa :DashboardFindWord<CR>
        nnoremap <silent> <Leader>fb :DashboardJumpMark<CR>
        nnoremap <silent> <Leader>cn :DashboardNewFile<CR>

        let g:dashboard_custom_header =<< trim END
        =================     ===============     ===============   ========  ========
        \\ . . . . . . .\\   //. . . . . . .\\   //. . . . . . .\\  \\. . .\\// . . //
        ||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\/ . . .||
        || . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . ||
        ||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .||
        || . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\ . . . . ||
        ||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\_ . .|. .||
        || . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\ `-_/| . ||
        ||_-' ||  .|/    || ||    \|.  || `-_|| ||_-' ||  .|/    || ||   | \  / |-_.||
        ||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \  / |  `||
        ||    `'         || ||         `'    || ||    `'         || ||   | \  / |   ||
        ||            .===' `===.         .==='.`===.         .===' /==. |  \/  |   ||
        ||         .=='   \_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \/  |   ||
        ||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \/  |   ||
        ||   .=='    _-'          '-__\._-'         '-_./__-'         `' |. /|  |   ||
        ||.=='    _-'                                                     `' |  /==.||
        =='    _-'                        N E O V I M                         \/   `==
        \   _-'                                                                `-_   /
         `''                                                                      ``'
        END

        " Find files using Telescope command-line sugar.
        nnoremap <leader>ff <cmd>Telescope find_files<cr>
        nnoremap <leader>fg <cmd>Telescope live_grep<cr>
        nnoremap <leader>fb <cmd>Telescope buffers<cr>
        nnoremap <leader>fh <cmd>Telescope help_tags<cr>

        " Using Lua functions
        nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
        nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
        nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
        nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

        "Tagbar
        nmap <F8> :TagbarToggle<CR>
        nmap <F9> :TagbarOpen f<CR>
