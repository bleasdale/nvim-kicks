-- NJH options.lua
-- ------------------
--
-- In ~/.config/nvim/lua/custom/
-- Called from ~/.config/nvim/init.lua
-- Dec 2023

-- convenience vim-related local vars
local cmd = vim.api.nvim_command
local diagnostic = vim.diagnostic
local vo = vim.opt

-- variables
local indent = 2

-- Set Python executable locations
-- vim.g.python3_host_prog = 'C:/Python312/python'
-- vim.g.python_host_prog = 'C:/Python27/python'

-- Set Options
cmd 'syntax on'

-- Diagnostic Config. See :help vim.diagnostic.Opts
diagnostic.config {
  severity_sort = true,
  float = {
    border = 'rounded',
    source = 'if_many',
  },
  underline = { severity = diagnostic.severity.ERROR },
  signs = vim.g.have_nerd_font and {
    text = {
      [vim.diagnostic.severity.ERROR] = '󰅚 ',
      [vim.diagnostic.severity.WARN] = '󰀪 ',
      [vim.diagnostic.severity.INFO] = '󰋽 ',
      [vim.diagnostic.severity.HINT] = '󰌶 ',
    },
  } or {},
  update_in_insert = true,
  virtual_text = {
    source = 'if_many',
    spacing = 2,
    format = function(diagnostic)
      local diagnostic_message = {
        [vim.diagnostic.severity.ERROR] = diagnostic.message,
        [vim.diagnostic.severity.WARN] = diagnostic.message,
        [vim.diagnostic.severity.INFO] = diagnostic.message,
        [vim.diagnostic.severity.HINT] = diagnostic.message,
      }
      return diagnostic_message[diagnostic.severity]
    end,
  },
  -- virtual_lines = {
  --   severity = { min = diagnostic.severity.WARN },
  -- },
}

vo.clipboard = 'unnamedplus' -- enable system-wide clipboard
vo.updatetime = 250 -- editor update time in ms
--vo.lazyredraw = true
vo.timeoutlen = 500 -- time to wait for a mapped sequence to complete in ms
vo.ttyfast = true -- speeds up scrolling
vo.conceallevel = 1
vo.sessionoptions = { 'blank', 'buffers', 'curdir', 'folds', 'help', 'tabpages', 'winsize', 'winpos', 'terminal', 'localoptions' }
vo.history = 2000
vo.swapfile = false
vo.backup = false
vo.undofile = true -- enable persistent undo
vo.undolevels = 1000
vo.undodir = vim.fn.stdpath 'config' .. '/undo/'
vo.cmdheight = 1
vo.backspace = { 'indent', 'eol', 'start' }
vo.tabstop = indent -- define a TAB to be this many columns wide
vo.softtabstop = indent -- move this many spaces for TAB and BACKSPACE keys
vo.shiftwidth = indent -- number of spaces inserted for each indentation
vo.title = true
vo.showmode = false
vo.errorbells = false
vo.belloff = 'all'
vo.laststatus = 2
vo.expandtab = true -- convert tabs to spaces
vo.autoindent = true
vo.smartindent = true
vo.cindent = true
vo.breakindent = true
vo.breakindentopt = 'shift:0,min:40,sbr'
vo.smartcase = true
vo.linebreak = true
vo.wrap = true
vo.list = false -- if true, shows invisible characters
vo.listchars = {
  tab = '» ',
  trail = '▒',
  extends = '►',
  precedes = '◄',
  space = '·',
  nbsp = '␣',
  lead = '·',
  eol = '↲',
}
vo.magic = true -- grep-like regexp (recall :perldo for pcre)
vo.grepprg = 'rg --vimgrep --smart-case --' -- use rg instead of grep
vo.showmatch = true
vo.matchtime = 3
vo.joinspaces = false -- no double spaces with J join
vo.wildmenu = true
vo.wildoptions = 'pum'
vo.wildmode = 'full'
vo.wildignore:append {
  '*.swp',
  '*.bak',
  '*.log',
  '*.tmp',
  '*.jpg',
  '*.gif',
  '*.png',
  '*.ico',
  '*.a',
  '*.o',
  '*.so',
  '*.docx',
  '*.img',
  '*.xlsx',
  '*.exe',
  '*.flv',
}
-- ignore LaTeX aux files
vo.wildignore:append {
  '*.aux',
  '*.lof',
  '*.lot',
  '*.fls',
  '*.out',
  '*.toc',
  '*.fmt',
  '*.fot',
  '*.cb',
  '*.cb2',
  '.*.lb',
  '__latex*',
  '*.fdb_latexmk',
  '*.synctex',
  '*.synctex(busy)',
  '*.synctex.gz',
  '*.synctex.gz(busy)',
  '*.pdfsync',
  '*.bbl',
  '*.bcf',
  '*.blg',
  '*.run.xml',
  'indent.log',
  '*.pdf',
}
vo.mouse = 'a'
vo.hlsearch = true
vo.incsearch = true
vo.inccommand = 'split'
vo.spelllang = { 'en_gb' }
vo.encoding = 'utf-8'
vo.fileencoding = 'utf-8'
vo.foldenable = true -- prevent folding upon opening file
vo.foldlevel = 99
vo.foldmethod = 'expr'
-- vo.foldmethod = 'marker'
vo.foldexpr = 'nvim_treesitter#foldexpr()'
vo.hidden = true -- hide unloaded buffer
vo.ruler = true
vo.pumheight = 10 -- popup menu height
vo.pumblend = 4
vo.signcolumn = 'yes:1'
vo.scrolloff = 4 -- minimum no. of screen lines to keep above and below the cursorline
vo.sidescrolloff = 8 -- minimum no. of screen columns either side of the cursor, if wrap = false
vo.showtabline = 2
vo.termguicolors = true -- use GUI colours in terminal
vo.splitbelow = true -- horizontal split always on the bottom
vo.splitright = true -- vertical split always on the right
vim.wo.relativenumber = true -- set relative numbered lines
vim.wo.number = true -- set numbered lines
vo.numberwidth = 4 -- set the line number column width. Default is 4
vo.colorcolumn = '81' -- show a column to show mark x characters wide
-- column colour set in colourscheme.lua
vo.cursorline = false -- highlight the current line
vo.confirm = true -- raise a dialog to save current file
vo.completeopt = { 'menuone', 'noselect', 'noinsert', 'preview' }
-- see :help shortmess 'shm' for message control
vo.shortmess = vo.shortmess + { c = true, s = true }
vo.formatoptions = {
  ['1'] = true,
  ['2'] = true,
  a = false,
  -- Automatic formatting of paragraphs.  Every time text is inserted or deleted the paragraph will be reformatted.  See auto-format. When the 'c' flag is present this only happens for recognized comments.
  q = true,
  -- Allow formatting of comments with "gq". Note that formatting will not change blank lines or lines containing only the comment leader.  A new paragraph starts after such a line, or when the comment leader changes.
  c = true,
  -- Auto-wrap comments using 'textwidth', inserting the current comment leader automatically.
  o = false,
  -- Automatically insert the current comment leader after hitting 'o' or 'O' in Normal mode.  In case comment is unwanted in a specific place use CTRL-U to quickly delete it. i_CTRL-U
  r = true,
  -- Automatically insert the current comment leader after hitting <Enter> in Insert mode.
  n = true,
  -- When formatting text, recognize numbered lists.  This actually uses the 'formatlistpat' option, thus any kind of list can be used.  The indent of the text after the number is used for the next line.  The default is to find a number, optionally followed by '.', ':', ')', ']' or '}'.  Note that 'autoindent' must be set too.  Doesn't work well together with "2".
  t = false,
  -- Auto-wrap text using 'textwidth'
  j = true,
  -- Where it makes sense, remove a comment leader when joining lines.  For example, joining:
  --		int i;   // the index
  --  	         // in the list
  --  	Becomes:
  --	  int i;   // the index in the list
  l = true,
  -- Long lines are not broken in insert mode: When a line was longer than 'textwidth' when the insert command started, Vim does not automatically format it.
  v = true,
  -- Vi-compatible auto-wrapping in insert mode: Only break a line at a blank that you have entered during the current insert command.  (Note: this is not 100% Vi compatible.  Vi has some "unexpected features" or bugs in this area.  It uses the screen column instead of the line column.)
}
