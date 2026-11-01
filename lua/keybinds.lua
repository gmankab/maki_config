local scroll = require('maki.scroll')

maki.keymap.set('n', 'n', function() scroll(1)  end, { desc = 'scroll down' })
maki.keymap.set('n', 'e', function() scroll(-1) end, { desc = 'scroll up' })
