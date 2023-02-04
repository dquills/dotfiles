local custom_powerline = require'lualine.themes.powerline'

custom_powerline.normal.c.bg = '#000000'

-- Custom location func
local function location()
  local line = vim.fn.line('.')
  local last_line = vim.fn.line('$')
  local col = vim.fn.virtcol('.')
  return string.format(' %d/%d  %d', line, last_line, col)
end

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = custom_powerline,
    -- component_separators = { left = '', right = ''},
    component_separators = { left = '|', right = '|'},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = true,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'diagnostics'},
    lualine_c = {{
        'filename',
        path = 1,
    }},
    lualine_x = {{
        'filetype',
        colored = false,
    }},
    -- lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = { 'encoding', 'fileformat' },
    lualine_z = {{
        location,
        padding = 1,
    },
    'progress'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
