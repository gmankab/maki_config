maki.keymap.set('n', 'i', function() maki.ui.set_mode('i') end, { desc = 'insert mode' })
maki.keymap.set(
  { 'n', 'i' }, '<Esc>',
  function(ev)
    if maki.fn.mode() == 'i' then
      maki.ui.set_mode('n')
      maki.ui.flash('NORMAL')
    else
      ev.fallback()
  end
end, { desc = 'Normal mode / rewind' })
