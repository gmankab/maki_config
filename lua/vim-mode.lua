maki.pack.add({
  'https://github.com/gmankab/maki-vim-mode',
}, {
  load = function()
    require('vim-mode').setup({
      -- n/e bound to down/up because i am on colemak
      langmap = {
        n = 'down',
        e = 'up',
      },
    })
  end,
})

