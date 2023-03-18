utils = {}

function utils.map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function utils.nmap(shortcut, command)
  utils.map('n', shortcut, command)
end

function utils.imap(shortcut, command)
  utils.map('i', shortcut, command)
end

function utils.vmap(shortcut, command)
  utils.map('v', shortcut, command)
end

return utils
