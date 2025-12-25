local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- General
map("n", "<leader>w", "<cmd>w<cr>", opts)
map("n", "<leader>q", "<cmd>q<cr>", opts)

-- =====================
-- Insert / Normal basics
-- =====================

-- Insert: Ctrl-j -> ESC
map("i", "<C-j>", "<Esc>", opts)

-- F1 niemals Hilfe öffnen
map({ "n", "i" }, "<F1>", "<Esc>", opts)

-- Line navigation
map("n", "H", "^", opts)
map("n", "L", "$", opts)

-- Alternate buffer
map("n", "<leader><leader>", "<C-^>", opts)

-- Append ; at EOL
map("n", "<leader>;", "A;<Esc>", opts)

-- Insert _ inside word
map("n", "<leader>_", "ebi_<Esc>", opts)

-- =====================
-- Better search UX
-- =====================

map("n", "n", "nzz", opts)
map("n", "N", "Nzz", opts)
map("n", "*", "*zz", opts)
map("n", "#", "#zz", opts)
map("n", "g*", "g*zz", opts)

-- =====================
-- FZF mappings (Plugin!)
-- =====================
-- ⚠️ Nur wenn du fzf.vim nutzt

map("n", "<leader>f", "<cmd>Files<cr>", opts)
map("n", "<leader>s", "<cmd>Rg<cr>", opts)
map("n", "<leader>b", "<cmd>Buffers<cr>", opts)


-- zuletzt genutzter Buffer (wie :b#)
map("n", "<S-Tab>", "<cmd>b#<cr>", opts)

-- j/k bewegen sich bei Wrap nach "display lines"
map("n", "j", "gj", { noremap = true })
map("n", "k", "gk", { noremap = true })

-- Search highlight aus
map("n", "<leader><cr>", "<cmd>noh<cr>", opts)

-- Paste-Mode togglen (heute selten nötig, aber 1:1)
map("n", "<leader>pp", "<cmd>setlocal paste!<cr>", opts)

