highlight = {
  matches = false,
}
return {

  {
    "stevearc/conform.nvim",
    -- event = "BufWritePre", -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "eslint-lsp",
        "lua-language-server",
        "stylua",
        "html-lsp",
        "css-lsp",
        "prettier",
        "prettierd",
        "tailwindcss-language-server",
        "emmet-ls",
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    opts = {
      sync_install = true,
      ensure_installed = {
        -- defaults
        "vim",
        "lua",
        "vimdoc",

        -- web dev
        "html",
        "css",
        "scss",
        "pug",
        "javascript",
        "typescript",
        "tsx",
        "vue",

        -- some
        "toml",
        "yaml",
        "dockerfile",
        "sql",

        -- low level
        "fish",
        "bash",
        "tmux",
      },
      incremental_selection = {
        enable = true,
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
    "ecthelionvi/NeoView.nvim",
    lazy = false,
    config = function()
      require "configs.neoview"
    end,
  },

  {
    "vidocqh/auto-indent.nvim",
    lazy = false,
    config = function()
      require "configs.autoindent"
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require "configs.nvimtree"
    end,
  },

  {
    "kevinhwang91/nvim-ufo",
    dependencies = {
      "kevinhwang91/promise-async",
      {
        "luukvbaal/statuscol.nvim",
        config = function()
          local builtin = require "statuscol.builtin"
          require("statuscol").setup {
            relculright = true,
            segments = {
              { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
              { text = { "%s" }, click = "v:lua.ScSa" },
              { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
            },
          }
        end,
      },
    },
    lazy = false,
    config = function()
      require "configs.ufo"
    end,
  },

  {
    "booperlv/nvim-gomove",
    lazy = false,
    config = function()
      require "configs.nvimgomove"
    end,
  },

  {
    "lewis6991/gitsigns.nvim",
    lazy = false,
    config = function()
      require "configs.gitsigns"
    end,
  },

  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    lazy = false,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    lazy = false,
    main = "ibl",
    config = function()
      -- vim.g.indent_blankline_show_current_context = true
      -- vim.g.indent_blankline_context_patterns = {
      --   "abstract_class_declaration",
      --   "abstract_method_signature",
      --   "accessibility_modifier",
      --   "ambient_declaration",
      --   "arguments",
      --   "array",
      --   "array_pattern",
      --   "array_type",
      --   "arrow_function",
      --   "as_expression",
      --   "asserts",
      --   "assignment_expression",
      --   "assignment_pattern",
      --   "augmented_assignment_expression",
      --   "await_expression",
      --   "binary_expression",
      --   "break_statement",
      --   "call_expression",
      --   "call_signature",
      --   "catch_clause",
      --   "class",
      --   "class_body",
      --   "class_declaration",
      --   "class_heritage",
      --   "computed_property_name",
      --   "conditional_type",
      --   "constraint",
      --   "construct_signature",
      --   "constructor_type",
      --   "continue_statement",
      --   "debugger_statement",
      --   "declaration",
      --   "decorator",
      --   "default_type",
      --   "do_statement",
      --   "else_clause",
      --   "empty_statement",
      --   "enum_assignment",
      --   "enum_body",
      --   "enum_declaration",
      --   "existential_type",
      --   "export_clause",
      --   "export_specifier",
      --   "export_statement",
      --   "expression",
      --   "expression_statement",
      --   "extends_clause",
      --   "finally_clause",
      --   "flow_maybe_type",
      --   "for_in_statement",
      --   "for_statement",
      --   "formal_parameters",
      --   "function",
      --   "function_declaration",
      --   "function_signature",
      --   "function_type",
      --   "generator_function",
      --   "generator_function_declaration",
      --   "generic_type",
      --   "if_statement",
      --   "implements_clause",
      --   "import",
      --   "import_alias",
      --   "import_clause",
      --   "import_require_clause",
      --   "import_specifier",
      --   "import_statement",
      --   "index_signature",
      --   "index_type_query",
      --   "infer_type",
      --   "interface_declaration",
      --   "internal_module",
      --   "intersection_type",
      --   "jsx_attribute",
      --   "jsx_closing_element",
      --   "jsx_element",
      --   "jsx_expression",
      --   "jsx_fragment",
      --   "jsx_namespace_name",
      --   "jsx_opening_element",
      --   "jsx_self_closing_element",
      --   "labeled_statement",
      --   "lexical_declaration",
      --   "literal_type",
      --   "lookup_type",
      --   "mapped_type_clause",
      --   "member_expression",
      --   "meta_property",
      --   "method_definition",
      --   "method_signature",
      --   "module",
      --   "named_imports",
      --   "namespace_import",
      --   "nested_identifier",
      --   "nested_type_identifier",
      --   "new_expression",
      --   "non_null_expression",
      --   "object",
      --   "object_assignment_pattern",
      --   "object_pattern",
      --   "object_type",
      --   "omitting_type_annotation",
      --   "opting_type_annotation",
      --   "optional_parameter",
      --   "optional_type",
      --   "pair",
      --   "pair_pattern",
      --   "parenthesized_expression",
      --   "parenthesized_type",
      --   "pattern",
      --   "predefined_type",
      --   "primary_expression",
      --   "program",
      --   "property_signature",
      --   "public_field_definition",
      --   "readonly_type",
      --   "regex",
      --   "required_parameter",
      --   "rest_pattern",
      --   "rest_type",
      --   "return_statement",
      --   "sequence_expression",
      --   "spread_element",
      --   "statement",
      --   "statement_block",
      --   "string",
      --   "subscript_expression",
      --   "switch_body",
      --   "switch_case",
      --   "switch_default",
      --   "switch_statement",
      --   "template_string",
      --   "template_substitution",
      --   "ternary_expression",
      --   "throw_statement",
      --   "try_statement",
      --   "tuple_type",
      --   "type_alias_declaration",
      --   "type_annotation",
      --   "type_arguments",
      --   "type_parameter",
      --   "type_parameters",
      --   "type_predicate",
      --   "type_predicate_annotation",
      --   "type_query",
      --   "unary_expression",
      --   "union_type",
      --   "update_expression",
      --   "variable_declaration",
      --   "variable_declarator",
      --   "while_statement",
      --   "with_statement",
      --   "yield_expression",
      -- }

      dofile(vim.g.base46_cache .. "blankline")
      local highlight = {
        "RainbowRed",
        "RainbowYellow",
        "RainbowBlue",
        "RainbowOrange",
        "RainbowGreen",
        "RainbowViolet",
        "RainbowCyan",
      }
      local hooks = require "ibl.hooks"

      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
        vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
        vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
        vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
        vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
        vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
        vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
      end)

      vim.g.rainbow_delimiters = { char = "│", highlight = highlight }
      require("ibl").setup {
        scope = { char = "│", highlight = highlight },
        indent = { char = "│", highlight = "IblChar" },
      }

      hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
      dofile(vim.g.base46_cache .. "blankline")
    end,
  },

  {
    "mg979/vim-visual-multi",
    lazy = false,
    init = function()
      vim.g.VM_maps = {
        ["Find Under"] = "<C-d>",
        ["Select l"] = "<C-S-f5>",
        ["Select h"] = "<C-S-f6>",
      }
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    cmd = "Telescope",
    opts = function()
      return require "nvchad.configs.telescope"
    end,
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "telescope")
      local telescope = require "telescope"
      telescope.setup(opts)

      -- load extensions
      for _, ext in ipairs(opts.extensions_list) do
        telescope.load_extension(ext)
      end

      local actions = require "telescope.actions"

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "TelescopeResults",
        callback = function(ctx)
          vim.api.nvim_buf_call(ctx.buf, function()
            vim.fn.matchadd("TelescopeParent", "\t\t.*$")
            vim.api.nvim_set_hl(0, "TelescopeParent", { link = "Comment" })
          end)
        end,
      })

      local function filenameFirst(_, path)
        local tail = vim.fs.basename(path)
        local parent = vim.fs.dirname(path)
        if parent == "." then
          return tail
        end
        return string.format("%s\t\t%s", tail, parent)
      end

      require("telescope").setup {
        pickers = {
          find_files = {
            path_display = filenameFirst,
            hidden = true,
            file_ignore_patterns = { "node_modules", ".git" },
          },
          oldfiles = {
            path_display = filenameFirst,
          },
        },
        defaults = {
          mappings = {
            i = {
              ["<esc>"] = actions.close,
              ["<C-h>"] = { "<c-s-w>", type = "command" },
              ["<C-BS>"] = { "<c-s-w>", type = "command" },
              ["<C-down>"] = actions.cycle_history_next,
              ["<C-up>"] = actions.cycle_history_prev,
            },
          },
        },
      }
    end,
  },

  {
    "gennaro-tedesco/nvim-possession",
    dependencies = {
      "ibhagwan/fzf-lua",
    },
    config = true,
    init = function()
      local possession = require "nvim-possession"
      vim.keymap.set("n", "<leader>sl", function()
        possession.list()
      end)
      vim.keymap.set("n", "<leader>sn", function()
        possession.new()
      end)
      vim.keymap.set("n", "<leader>su", function()
        possession.update()
      end)
      vim.keymap.set("n", "<leader>sd", function()
        possession.delete()
      end)
    end,
  },
  {
    "airblade/vim-rooter",
    lazy = false,
  },
}
