return {
  "nvimdev/dashboard-nvim",
  lazy = false, -- As https://github.com/nvimdev/dashboard-nvim/pull/450, dashboard-nvim shouldn't be lazy-loaded to properly handle stdin.
  opts = function()
    local logo = [[
    ▗▖  ▗▖▗▞▀▚▖ ▄▄▄  ▄   ▄ ▄ ▄▄▄▄  
    ▐▛▚▖▐▌▐▛▀▀▘█   █ █   █ ▄ █ █ █ 
    ▐▌ ▝▜▌▝▚▄▄▖▀▄▄▄▀  ▀▄▀  █ █   █ 
    ▐▌  ▐▌                 █       
    Config by Tori
    ]]

    local quotes = {
        "Failure is not an option -- it comes bundled with Windows.",
        "rm -rf --no-preserve-root /",
        "There are 10 types of people in the world: Those who understand Binary, and those who don't.",
        "Any fool can use a computer. Many do.",
        "Nothing is as permanent as a temporary solution that works.",
        "Programming is the art of adding bugs to an empty text file.",
        "Man saw nature and invented JavaScript.",
        "There are 2 hard problems in computer science: cache invalidation, naming things, and off-by-1 errors."
    }

    logo = string.rep("\n", 8) .. logo .. "\n\n"

    math.randomseed( os.time() )
    math.random(); math.random(); math.random() -- Eliminate any consistency
    local opts = {
      theme = "doom",
      hide = {
        -- this is taken care of by lualine
        -- enabling this messes up the actual laststatus setting after loading a file
        statusline = false,
      },
      config = {
        header = vim.split(logo, "\n"),
        -- stylua: ignore
        center = {
          { action = "Oil .",                                           desc = " Browse Files",    icon = " ", key = "f" },
          { action = "ene | startinsert",                              desc = " New File",        icon = " ", key = "n" },
          { action = 'Oil ~/dotfiles/nvim',                             desc = " Config",          icon = " ", key = "c" },
          { action = function() vim.api.nvim_input("<cmd>qa<cr>") end, desc = " Quit",            icon = " ", key = "q" },
        },
        footer = function()
            return { quotes[ math.random( 1, #quotes ) ] }
        end,
      },
    }

    for _, button in ipairs(opts.config.center) do
      button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
      button.key_format = "  %s"
    end

    -- open dashboard after closing lazy
    if vim.o.filetype == "lazy" then
      vim.api.nvim_create_autocmd("WinClosed", {
        pattern = tostring(vim.api.nvim_get_current_win()),
        once = true,
        callback = function()
          vim.schedule(function()
            vim.api.nvim_exec_autocmds("UIEnter", { group = "dashboard" })
          end)
        end,
      })
    end

    return opts
  end,
}
