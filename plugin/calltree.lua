vim.api.nvim_create_user_command('Call', function(args)
  require('calltree.command').load_command(unpack(args.fargs))
end, {
  range = true,
  nargs = '+',
  complete = function(arg)
    local list = require('calltree.command').command_list()
    return vim.tbl_filter(function(s)
      return string.match(s, '^' .. arg)
    end, list)
  end,
})
