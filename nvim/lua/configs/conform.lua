-- Функция для обеспечения пустой строки в конце файла
local function ensure_trailing_newline()
  local bufnr = vim.api.nvim_get_current_buf()
  local line_count = vim.api.nvim_buf_line_count(bufnr)
  local last_line = vim.api.nvim_buf_get_lines(bufnr, line_count - 1, line_count, false)[1]
  if last_line ~= "" then
    vim.api.nvim_buf_set_lines(bufnr, line_count, line_count, false, { "" })
  end
end

-- Определяем параметры для форматеров и форматирования при сохранении
local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    typescript = { { "prettierd", "prettier" } },
    typescriptreact = { { "prettierd", "prettier" } },
    javascript = { { "prettierd", "prettier" } },
    javascriptreact = { { "prettierd", "prettier" } },
    json = { { "prettierd", "prettier" } },
    html = { { "prettierd", "prettier" } },
    css = { { "prettierd", "prettier" } },
  },

  format_on_save = {
    -- Эти параметры будут переданы в conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

-- Применяем настройки форматирования
require("conform").setup(options)

-- Create an autocmd that runs before writing a buffer
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = ensure_trailing_newline,
})

