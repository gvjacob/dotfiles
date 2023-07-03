utils = {}

function utils.map(mode, shortcut, command, desc)
  desc = desc or ''
  vim.keymap.set(mode, shortcut, command, { noremap = true, silent = true, desc = desc })
end

function utils.nmap(shortcut, command, desc)
  utils.map('n', shortcut, command, desc)
end

function utils.imap(shortcut, command, desc)
  utils.map('i', shortcut, command, desc)
end

function utils.vmap(shortcut, command, desc)
  utils.map('v', shortcut, command, desc)
end

return utils
