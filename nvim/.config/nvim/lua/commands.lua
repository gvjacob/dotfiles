-- Reveal current file in Finder
vim.api.nvim_create_user_command('FinderReveal',
    function()
        local path = vim.api.nvim_buf_get_name(0)
        os.execute('open -R ' .. path)
    end,
    {}
)
