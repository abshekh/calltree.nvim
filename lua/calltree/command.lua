local command = {}

local subcommands = {
  incoming_calls = function()
    require('calltree.callhierarchy'):send_method(2)
  end,
  outgoing_calls = function()
    require('calltree.callhierarchy'):send_method(3)
  end,
}

function command.command_list()
  return vim.tbl_keys(subcommands)
end

function command.load_command(cmd, ...)
  local args = { ... }
  if next(args) ~= nil then
    subcommands[cmd](args[1])
  else
    subcommands[cmd]()
  end
end

return command
