-- Each group is one installable plugin; `variants` lists the selectable
-- flavours within it (e.g. catppuccin's latte/frappe/macchiato/mocha).
-- Groups with a single, fixed look (badwolf) omit `variants`.
local theme_groups = {
  {
    name = "badwolf",
    repo = "sebastian-palma/badwolf",
    apply = function()
      vim.cmd.colorscheme("badwolf")
    end,
  },
  {
    name = "black-metal",
    repo = "metalelf0/black-metal-theme-neovim",
    variants = {
      "bathory",
      "burzum",
      "dark-funeral",
      "darkthrone",
      "emperor",
      "gorgoroth",
      "immortal",
      "impaled-nazarene",
      "khold",
      "marduk", -- darker than bathory
      "mayhem",
      "nile",
      "taake",
      "thyrfing",
      "venom",
      "windir",
    },
    apply = function(variant)
      require("black-metal").setup({ theme = variant })
      require("black-metal").load()
    end,
  },
  {
    name = "catppuccin",
    repo = "catppuccin/nvim",
    spec_name = "catppuccin",
    variants = { "latte", "frappe", "macchiato", "mocha" },
    apply = function(variant)
      require("catppuccin").setup({ flavour = variant })
      vim.cmd.colorscheme("catppuccin")
    end,
  },
  {
    name = "gruvbox",
    repo = "ellisonleao/gruvbox.nvim",
    variants = { "light", "dark" },
    apply = function(variant)
      vim.o.background = variant
      vim.cmd.colorscheme("gruvbox")
    end,
  },
}

for _, group in ipairs(theme_groups) do
  -- the plugin name lazy.nvim registers it under, used to force-load it on demand
  group.plugin_name = group.spec_name or group.repo:match("^[^/]+/(.+)$")
end

-- Flatten groups into selectable entries, e.g. "catppuccin-mocha", or just
-- "badwolf" for a group with no variants.
local themes = {}
for _, group in ipairs(theme_groups) do
  if group.variants then
    for _, variant in ipairs(group.variants) do
      table.insert(themes, { name = group.name .. "-" .. variant, group = group, variant = variant })
    end
  else
    table.insert(themes, { name = group.name, group = group })
  end
end

local theme_names = vim.tbl_map(function(theme)
  return theme.name
end, themes)

local function find_theme(name)
  for _, theme in ipairs(themes) do
    if theme.name == name then
      return theme
    end
  end
end

local state_file = vim.fn.stdpath("data") .. "/theme"
local default_theme = "badwolf"

local function read_saved_theme()
  local file = io.open(state_file, "r")
  if not file then
    return nil
  end
  local name = file:read("*l")
  file:close()
  return name ~= "" and name or nil
end

local function save_theme(name)
  local file = io.open(state_file, "w")
  if file then
    file:write(name)
    file:close()
  end
end

local saved_theme = read_saved_theme()
local current_theme = (saved_theme and find_theme(saved_theme)) and saved_theme or default_theme

local function set_colorscheme(name)
  local theme = find_theme(name)
  if not theme then
    vim.notify("Unknown colorscheme: " .. tostring(name), vim.log.levels.ERROR)
    return
  end

  -- Groups other than the one active at startup are `lazy = true`, so force
  -- lazy.nvim to load the plugin before applying it.
  require("lazy").load({ plugins = { theme.group.plugin_name } })
  theme.group.apply(theme.variant)

  current_theme = name
  save_theme(name)
end

vim.api.nvim_create_user_command("Colorscheme", function(opts)
  set_colorscheme(opts.args)
end, {
  nargs = 1,
  complete = function()
    return theme_names
  end,
})

vim.api.nvim_create_user_command("Colorschemes", function()
  local pickers = require("telescope.pickers")
  local finders = require("telescope.finders")
  local conf = require("telescope.config").values
  local actions = require("telescope.actions")
  local action_state = require("telescope.actions.state")

  pickers
    .new({}, {
      prompt_title = "Colorschemes",
      finder = finders.new_table({ results = theme_names }),
      sorter = conf.generic_sorter({}),
      attach_mappings = function(prompt_bufnr)
        actions.select_default:replace(function()
          local selection = action_state.get_selected_entry()
          actions.close(prompt_bufnr)
          set_colorscheme(selection[1])
        end)
        return true
      end,
    })
    :find()
end, {})

vim.api.nvim_set_keymap("n", "<leader>th", ":Colorschemes<cr>", { noremap = true, silent = true })

local current_entry = find_theme(current_theme)

local plugin_specs = {}
for _, group in ipairs(theme_groups) do
  local is_current = current_entry.group == group
  table.insert(plugin_specs, {
    group.repo,
    name = group.spec_name,
    lazy = not is_current,
    priority = is_current and 1000 or nil,
    config = is_current and function()
      group.apply(current_entry.variant)
    end or nil,
  })
end

return plugin_specs
