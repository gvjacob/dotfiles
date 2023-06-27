-- Get cursor row and column.
local function cursor_location()
  local row, column = unpack(vim.api.nvim_win_get_cursor(0))
  local total_rows = vim.fn.line('$')

  return row .. ':' .. total_rows .. ' ' .. column
end

require('lualine').setup {
  options = {
    icons_enabled = true,
    component_separators = '',
    section_separators = '',
  },

  sections = {
    lualine_a = { 'mode' },
    lualine_b = { { 'filename', path = 1 } },
    lualine_c = { 'diagnostics' },
    lualine_x = { 'filetype', 'branch' },
    lualine_y = { cursor_location },
    lualine_z = {},
  },
}
