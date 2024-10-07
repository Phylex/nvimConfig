-- Set up keys for stuff

-- See `:help mapleader`
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true

-- Make line numbers default
vim.opt.relativenumber = true
vim.opt.number = true

-- Enable mouse mode
vim.opt.mouse = 'a'

-- show mode under the status line (we don't need that)
vim.opt.showmode = false

-- enable clipboard integration
-- :help 'clipboard'
vim.opt.clipboard = 'unnamedplus'

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Set highlight on search
vim.opt.hlsearch = true

-- Case insensitive searching UNLESS /C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Decrease update time
vim.opt.updatetime = 250
vim.opt.signcolumn = 'yes'
vim.opt.timeoutlen = 300

-- control how splits are handled
vim.opt.splitright = true
vim.opt.splitbelow = true

-- preview substitutions as you type
vim.opt.inccommand = 'split'

-- characters to make whitespace visible
vim.opt.list = true
vim.opt.listchars = { tab = '| ', trail = '·', nbsp = '␣' }

-- show the line of the cursor
vim.opt.cursorline = false

-- number of lines to keep below/above the cursor
vim.opt.scrolloff = 8

vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Set colorscheme
vim.opt.termguicolors = true
require('nabla').load()


-- Keymaps for better default experience ---------------------------------------------------
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- filetypes
-- set filetypes that are not auto detected
vim.filetype.add({
  extension = {
    wgsl = 'wgsl'
}})


-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

------------------------------PLUGIN SECTION ------------------------------------------
-- Configure and set
require('lazy').setup({
  -- detect tabstop and shift width automatically
  'tpope/vim-sleuth',

  -- "gc" to comment visual regions/lines
  {
    'numToStr/Comment.nvim',
    opts = {},
  },

  {
    -- adds signs on the left hand side of the buffer that show the
    -- status of the git repository that the file is part of
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },

  {
    -- telescope is a fuzzy finder that has lots of useful features around
    -- finding files and symbols/text within files (among other things)
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },
    config = function() 
      require('telescope').setup {
        defaults = {
          mappings = {
            i = {
              ['<C-u>'] = false,
              ['<C-d>'] = false,
            },
          },
        },
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          }
        },
      }
      -- Enable telescope fzf native, if installed
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')

      -- See `:help telescope.builtin`
      local builtin = require 'telescope.builtin'
      vim.keymap.set('n', '<leader>?', builtin.oldfiles, { desc = '[?] Find recently opened files' })
      vim.keymap.set('n', '<leader><space>', builtin.buffers, { desc = '[ ] Find existing buffers' })
      vim.keymap.set('n', '<leader>/', function() -- You can pass additional configuration to telescope to change theme, layout, etc.
        require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = '[/] Fuzzily search in current buffer]' })
      vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
      vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
      vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
      vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]search [K]eymap' })
      -- It's also possible to pass additional configuration options.
      --  See `:help telescope.builtin.live_grep()` for information about particular keys
      vim.keymap.set('n', '<leader>s/', function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end, { desc = '[S]earch [/] in Open Files' })

      -- Shortcut for searching your Neovim configuration files
      vim.keymap.set('n', '<leader>sn', function()
        builtin.find_files { cwd = vim.fn.stdpath 'config' }
      end, { desc = '[S]earch [N]eovim files' })
    end,
  },

  -- LSP setup
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'williamboman/mason.nvim', config=true },
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      { 'j-hui/fidget.nvim', opts = {} },
      { 'folke/neodev.nvim', opts = {} },
    },
    config = function()
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc)
            vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end
          map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
          map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
          map('<leader>ha', vim.lsp.buf.hover, '[H]over [A]ction')
          map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

          map('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
          map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
          map('gi', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
          map('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
          map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
          map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

          -- See `:help K` for why this keymap
          map('K', vim.lsp.buf.hover, 'Hover Documentation')
          map('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

          -- Lesser used LSP functionality
          map('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
          map('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
          map('<leader>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          end, '[W]orkspace [L]ist Folders')

          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client.server_capabilities.documentHighlightProvider then
            local highlight_augroup = vim.api.nvim_create_augroup('lsp-highlight', { clear = false })
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.document_highlight,
            })

            vim .api.create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd('LspDetach', {
              group = vim.api.nvim_create_augroup('lsp-detach', { clear = true }),
              callback = function(event2)
                vim.lsp.buf.clear_references()
                vim.api.nvim_clear_autocmds { group = 'lsp-highlight', buffer = event2.buf }
              end,
            })
          end

          if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
            map('<leader>th', function()
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
            end, '[T]oggle Inlay [H]ints')
          end
        end
      })

      -- update the capabilities sent to the server
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

      local servers = {
        -- clangd = {},
        -- rust_analyzer = {},
        -- pyright = {},
        pylsp = { 
          pylsp = {
            plugins = {
              -- enable mypy hints and jedi completion
              pylsp_mypy = { enabled = true },
              jedi_completion = { enabled = true },

              yapf = { enabled = true },
              -- disable linting except for black
              autopep8 = { enabled = true },
              pycodestyle = { enabled = true, maxLineLength = 100, ignore = {'W219', 'E261'}},
              mccabe = { enabled = true},
              flake8 = { enabled = false},
              pyflakes = {enabled = true },
              pylint = { enabled = true, executable = "pylint" },
              black = { enabled = true, line_length = 100},
            }
          }
        },
      }

      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, {
        'stylua'
      })

      require('mason-tool-installer').setup { ensure_installed = ensure_installed }

      require('mason-lspconfig').setup {
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
            require('lspconfig')[server_name].setup(server)
          end,
        },
      }
    end,
  },

  -- Autocompletion
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      {
        'L3MON4D3/LuaSnip',
        build = (function()
          if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
            return
          end
          return 'make install_jsregexp'
        end)(),
        dependencies = {}
      },
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
    },
    config = function()
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'

      cmp.setup {
        -- This makes the expansions of snippets
        -- work with the other completion formats
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        completion = { completeopt = 'menu,menuone,noinsert' },
        mapping = cmp.mapping.preset.insert {
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          ['<C-n>'] = cmp.mapping.select_next_item(),
          ['<C-d>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-e>'] = cmp.mapping.close(),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-y>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace, -- also can be .Insert
            select = true,
          },
        },
        sources = {
          -- interesting properties to modify the behaviour of the completion source
          -- keyword_length
          -- max_item_count
          -- priority
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'path', max_item_count = 5},
          { name = 'buffer', max_item_count = 5, keyword_length = 5, },
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        }
      }
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    opts = {
      ensure_installed = { 'c', 'wgsl', 'cpp', 'html', 'toml', 'lua', 'python', 'rust', 'vim' },

      highlight = { 
        enable = true,
        additional_vim_regex_highlighting=false,
      },
      indent = {
        enable = true,
        disable = { 'python' },
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<c-space>',
          node_incremental = '<c-space>',
          scope_incremental = '<c-s>',
          node_decremental = '<c-backspace>',
        },
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ['aa'] = '@parameter.outer',
            ['ia'] = '@parameter.inner',
            ['af'] = '@function.outer',
            ['if'] = '@function.inner',
            ['ac'] = '@class.outer',
            ['ic'] = '@class.inner',
          },
        },
        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = {
            [']m'] = '@function.outer',
            [']]'] = '@class.outer',
          },
          goto_next_end = {
            [']M'] = '@function.outer',
            [']['] = '@class.outer',
          },
          goto_previous_start = {
            ['[m'] = '@function.outer',
            ['[['] = '@class.outer',
          },
          goto_previous_end = {
            ['[M'] = '@function.outer',
            ['[]'] = '@class.outer',
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ['<leader>a'] = '@parameter.inner',
          },
          swap_previous = {
            ['<leader>A'] = '@parameter.inner',
          },
        },
      },
    }
  },
})

-- this is the startup function of the package manager that gets
-- executed at the start of every invocation of vim
-- require('packer').startup(function(use)
--   use 'chrisbra/Colorizer'
-- 
--   use { -- LSP Configuration & Plugins
--     'neovim/nvim-lspconfig',
--     requires = {
--       -- Automatically install LSPs to stdpath for neovim
--       'williamboman/mason.nvim',
--       'williamboman/mason-lspconfig.nvim',
-- 
-- 
--       -- look at nvim-tree/nvim-tree.lua repository if I want a 
--       -- tui file browser even though the telescope one is already pretty neat
--       -- Additional lua configuration, makes nvim stuff amazing
--       'folke/neodev.nvim',
--     },
--   }
--   -- Useful status updates for LSP
--   use {
--     'j-hui/fidget.nvim',
--     tag = 'legacy',
--   }
--   use { 'simrat39/rust-tools.nvim', requires = {'nvim-lua/plenary.nvim' } }
-- 
--   -- debugging
--   use { 'rcarriga/nvim-dap-ui', requires = {'mfussenegger/nvim-dap'} }
-- 
--   use { -- Autocompletion
--     'hrsh7th/nvim-cmp',
--     requires = {
--       'hrsh7th/cmp-nvim-lsp',
--       'hrsh7th/cmp-path',
--       'hrsh7th/cmp-buffer',
--       'hrsh7th/cmp-nvim-lua',
--       'hrsh7th/cmp-nvim-lsp-signature-help',
--       'onsails/lspkind.nvim',
--       'L3MON4D3/LuaSnip',
--       'saadparwaiz1/cmp_luasnip' },
--   }
-- 
--   use { -- Highlight, edit, and navigate code
--     'nvim-treesitter/nvim-treesitter',
--     run = function()
--       pcall(require('nvim-treesitter.install').update { with_sync = true })
--     end,
--   }
-- 
--   use { -- Additional text objects via treesitter
--     'nvim-treesitter/nvim-treesitter-textobjects',
--     after = 'nvim-treesitter',
--   }
-- 
--   -- Git related plugins
--   use 'tpope/vim-fugitive'
--   use 'tpope/vim-rhubarb'
-- 
--   use 'nvim-lualine/lualine.nvim' -- Fancier statusline
--   -- use 'lukas-reineke/indent-blankline.nvim' -- Add indentation guides even on blank lines
--   use 'tpope/vim-sleuth' -- Detect tabstop and shiftwidth automatically
-- 
--   -- Fuzzy Finder (files, lsp, etc)
--   use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { 'nvim-lua/plenary.nvim' } }
-- 
--   -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
--   use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }
-- 
--   use{ "stevearc/aerial.nvim", config = function() require("aerial").setup() end, }
-- 
--   -- Add custom plugins to packer from ~/.config/nvim/lua/custom/plugins.lua
--   local has_plugins, plugins = pcall(require, 'custom.plugins')
--   if has_plugins then
--     plugins(use)
--   end
-- 
--   if is_bootstrap then
--     require('packer').sync()
--   end
-- end)

-- When we are bootstrapping a configuration, it doesn't
-- make sense to execute the rest of the init.lua.
--

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

------------------------ Plugin configuration --------------------------------

-- require("aerial").setup({
--   -- optionally use on_attach to set keymaps when aerial has attached to a buffer
--   on_attach = function(bufnr)
--     -- Jump forwards/backwards with '{' and '}'
--     vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
--     vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
--   end,
-- })
-- -- You probably also want to set a keymap to toggle aerial
-- vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>")
-- 
-- -- Set lualine as statusline
-- -- See `:help lualine.txt`
-- require('lualine').setup {
--   options = {
--     icons_enabled = false,
--     theme = 'nabla',
--     component_separators = '|',
--     section_separators = '>',
--   },
-- }

-- Enable `lukas-reineke/indent-blankline.nvim`
-- See `:help indent_blankline.txt`
-- require'ibl'.setup()


-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.


-- RUST setup -------------------------------------------------

-- So a note on configuration here There are two options (that are 'easy to use')
-- The first option is to :

-- require('lspconfig').rust_analyzer.setup {
--   capabilities = capabilities,
--   on_attach = on_attach,
--   cmd = {"rust-analyzer"},
-- }

-- I don't actually want the lsp highlight groups to show
-- for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
--   vim.api.nvim_set_hl(0, group, {})
-- end

-- Set the priority of the treesitter highlights over the semantic_tokens
vim.highlight.priorities.treesitter = 100
vim.highlight.priorities.semantic_tokens = 99

-- rt = require('rust-tools')
-- rt.setup({
--   server = {
--     on_attach = on_attach
--   },
-- })
-- rt.setup({
--   tools = {
--     inlay_hints = {
--       parameter_hints_prefix = "<-- ",
--     }
--   },
--   server = {
--     standalone = true,
--     on_attach = function (_, bufnr)
--         -- Hover actions
--       vim.keymap.set("n", "<leader>ha", rt.hover_actions.hover_actions, { buffer = bufnr })
--       -- Code action groups
--       vim.keymap.set("n", "<leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
--       -- configure inlay hoints
--       vim.keymap.set('n', '<leader>he', rt.inlay_hints.enable)
--       vim.keymap.set('n', '<leader>hd', rt.inlay_hints.disable)
--       on_attach(_, bufnr)
--     end
--   },
-- })

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
