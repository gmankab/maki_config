maki.api.register_command({
  name = 'export',
  handler = function()
    local messages = assert(maki.session.messages())
    local output = {}
    for _, message in ipairs(messages) do
      if not message.kind or message.kind == 'turn' then
        local parts = {}
        for _, block in ipairs(message.content or {}) do
          if block.type == 'text' then
            parts[#parts + 1] = block.text
          end
        end
        local text = message.display_text
          or table.concat(parts, '\n\n')
        if text ~= '' then
          output[#output + 1] =
            '## ' .. message.role .. '\n\n' .. text
        end
      end
    end
    maki.fn.jobstart(
      {
        'wl-copy', '--', table.concat(output, '\n\n')
      }, {
        scope = 'plugin',
      }
    )
    maki.notify('copied to clipboard')
  end,
})
