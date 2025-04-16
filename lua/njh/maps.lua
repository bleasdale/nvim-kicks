------------------
-- Key Mappings --
------------------

-- Leaders set in /nvim/init.lua
-- vim.g.mapleader = " "
-- vim.g.maplocalleader = "\\" or " "

-- convenience variable
local map = vim.keymap.set

-- Swap ; and : for faster command mode
map('n', ';', ':', { desc = 'Swap ; for :' })
map('n', ':', ';', { desc = 'Swap ; for :' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Centre the cursor after page up & down.
map('n', '<C-u>', '<C-u>zz', { desc = 'Centre the cursor after page up.' })
map('n', '<C-d>', '<C-d>zz', { desc = 'Centre the cursor after page down.' })

-- open init.lua in a new buffer, vertical split
map('n', '<leader>ev', ':vsplit ~/.config/nvim/init.lua<CR>', { silent = true, desc = 'Edit config shortcut.' })

-- 'cd' to the dir in which the current buffer is, but only for the current window
map('n', '<leader>cd', ':lcd %:h<CR>', { desc = 'Change the cwd to the location of the current buffer, but only for the current buffer.' })

map({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Using ten3roberts/qf.nvim plugin instead. See mappings in plugin setup
-- -- Location list
-- -- map('n', '<leader>qc', '<CMD>cclose<CR>', { desc = 'Close the quickfix list.' })
-- map('n', '<leader>ql', function()
--   local win = vim.api.nvim_get_current_win()
--   local qf_winid = vim.fn.getloclist(win, { winid = 0 }).winid
--   local action = qf_winid > 0 and 'lclose' or 'lopen'
--   vim.cmd(action)
-- end, { noremap = true, silent = true, desc = 'Toggle location list.' })
--
-- -- Quickfix list
-- map('n', '<leader>qq', function()
--   local qf_winid = vim.fn.getqflist({ winid = 0 }).winid
--   local action = qf_winid > 0 and 'cclose' or 'copen'
--   vim.cmd('botright ' .. action)
-- end, { noremap = true, silent = true, desc = 'Toggle quickfix list.' })

-- Diagnostic keymaps
map('n', '[d', vim.lsp.diagnostic.jump { count = 1, float = true }, { desc = 'Go to previous diagnostic message' })
map('n', ']d', vim.lsp.diagnostic.jump { count = -1, float = true }, { desc = 'Go to next diagnostic message' })
map('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- resize window
map('n', '<leader><UP>', ':resize +5<CR>', { silent = true, desc = 'Increase vertical window size.' })
map('n', '<leader><DOWN>', ':resize -5<CR>', { silent = true, desc = 'Decrease vertical window size.' })
map('n', '<leader><RIGHT>', ':vertical resize +5<CR>', { silent = true, desc = 'Increase window width.' })
map('n', '<leader><LEFT>', ':vertical resize -5<CR>', { silent = true, desc = 'Decrease window width.' })

-- movement between windows
map('n', '<C-h>', ':wincmd h<CR>', { desc = 'Move focus to window on the left.' })
map('n', '<C-j>', ':wincmd j<CR>', { desc = 'Move focus to window below' })
map('n', '<C-l>', ':wincmd l<CR>', { desc = 'Move focus to window on the right.' })
map('n', '<C-k>', ':wincmd k<CR>', { desc = 'Move focus to window above.' })

-- move windows
map('n', '<C-S-h>', '<C-w>H', { desc = 'Move window to the left' })
map('n', '<C-S-l>', '<C-w>L', { desc = 'Move window to the right' })
map('n', '<C-S-j>', '<C-w>J', { desc = 'Move window to the lower' })
map('n', '<C-S-k>', '<C-w>K', { desc = 'Move window to the upper' })

-- movement while in insert and command modes
-- better to <C-O> then [number]CTRL-O h  move cursor left
--   CTRL-O h  move cursor left
--   CTRL-O l  move cursor right
--   CTRL-O j  move cursor down
--   CTRL-O k  move cursor up
--
-- Other very useful control keys in insert mode:
--
--   CTRL-W    delete word to the left of cursor
--   CTRL-O D  delete everything to the right of cursor
--   CTRL-U    delete everything to the left of cursor
--   CTRL-H    backspace/delete
--   CTRL-J    insert newline (easier than reaching for the return key)
--   CTRL-T    indent current line
--   CTRL-D    un-indent current linemovement key

-- map('i', '<C-h>', '<LEFT>', { desc = 'Move left in insert mode.' })
-- map('i', '<C-j>', '<DOWN>', { desc = 'Move down in insert mode.' })
-- map('i', '<C-l>', '<RIGHT>', { desc = 'Move right in insert mode.' })
-- map('i', '<C-k>', '<UP>', { desc = 'Move up in insert mode.' })
map('c', '<C-h>', '<LEFT>', { desc = 'Move left in command mode.' })
map('c', '<C-j>', '<DOWN>', { desc = 'Move down in command mode.' })
map('c', '<C-l>', '<RIGHT>', { desc = 'Move right in command mode.' })
map('c', '<C-k>', '<UP>', { desc = 'Move up in command mode.' })

-- buffers
map('n', '<leader>bn', '<cmd>enew<CR>', { desc = 'New buffer.' })
map('n', '<leader>n', ':bn<CR>', { desc = 'Show the next buffer.' })
map('n', '<leader>p', ':bp<CR>', { desc = 'Show the previous buffer.' })

-- move lines around
map('n', '<A-j>', ':m .+1<CR>==', { silent = true, desc = 'Bubble line down' })
map('n', '<A-k>', ':m .-2<CR>==', { silent = true, desc = 'Bubble line up' })
map('v', '<A-j>', ":m '>+1<CR>==gv=gv", { silent = true, desc = 'Bubble line down' })
map('v', '<A-k>', ":m '<-2<CR>==gv=gv", { silent = true, desc = 'Bubble line up' })
map('i', '<A-j>', '<esc><cmd>m .+1<cr>==gi', { desc = 'Move down' })
map('i', '<A-k>', '<esc><cmd>m .-2<cr>==gi', { desc = 'Move up' })
-- alternative visual mode bubble mapping
-- map('v', '<A-k>', [[@='"zxk"zP`[V`]'<CR>]], { silent = true, desc = 'Bubble line up' })
-- vim.keymap.set('v', '<A-j>', [[@='"zx"zp`[V`]'<CR>]], { silent = true, desc = 'Bubble line down' })

-- Better indenting
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')
vim.keymap.set('n', '>', '>>_')
vim.keymap.set('n', '<', '<<_')

-- clear search highlighting
map('n', '<leader><CR>', ':nohlsearch<CR>', { silent = true, desc = 'Remove search highlighting' })

-- tabs
map('n', '<leader>tN', ':tabnew<CR>', { desc = 'Open new tab.' })
map('n', '<leader>tc', ':tabclose<CR>', { desc = 'Close tab.' })
map('n', '<leader>tn', ':tabnext<CR>', { desc = 'Move focus to next tab.' })
map('n', '<leader>tp', ':tabprevious<CR>', { desc = 'Move focus to previous tab.' })
map('n', '<leader>1', '1gt', { desc = 'Go to tab number 1.' })
map('n', '<leader>2', '2gt', { desc = 'Go to tab number 2.' })
map('n', '<leader>3', '3gt', { desc = 'Go to tab number 3.' })
map('n', '<leader>4', '4gt', { desc = 'Go to tab number 4.' })
map('n', '<leader>5', '5gt', { desc = 'Go to tab number 5.' })
map('n', '<leader>6', '6gt', { desc = 'Go to tab number 6.' })
map('n', '<leader>7', '7gt', { desc = 'Go to tab number 7.' })
map('n', '<leader>8', '8gt', { desc = 'Go to tab number 8.' })
map('n', '<leader>9', '9gt', { desc = 'Go to tab number 9.' })

-- Make visual yanks place the cursor back where it started
map('v', 'y', 'ygv<ESC>', { desc = 'Yank and put cursor back.' })

-- Luasnip
vim.cmd [[
" Use Tab to expand and jump through snippets
imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
smap <silent><expr> <Tab> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<Tab>'

" Use Shift-Tab to jump backwards through snippets
imap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
smap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'

" Cycle forward through choice nodes with Control-f (for example)
imap <silent><expr> <C-f> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-f>'
smap <silent><expr> <C-f> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-f>'
]]

-- Insert mode map to escape out of insert mode, type undo and reenter insert mode
map('i', '<C-U>', '<ESC>ui', { desc = 'From insert mode, exit to normal, undo, reenter insert mode.' })

-- -- window-picker
-- map("n", "<leader>g", function()
--     local picked_window_id = require('window-picker').pick_window() or vim.api.nvim_get_current_win()
--     vim.api.nvim_set_current_win(picked_window_id)
-- end, { desc = "Pick a window" })
