-- Prefix each EPUB3 footnote with a numbered backlink. Only useful on Kindle
-- due to how Amazon stacks footnotes up at the end of every chapter without
-- numbering them. On Apple Books and probably other reader apps, this filter
-- causes duplicate numbers on the footnote pop-ups.
local n = 0

local function prefix(i)
  local link = pandoc.Link(
    pandoc.Str(tostring(i)),
    '#fnref' .. i,
    '',
    pandoc.Attr('', {'footnote-back'}, {role = 'doc-backlink'})
  )
  return pandoc.Inlines{link, pandoc.Str '.', pandoc.Space()}
end

function Pandoc(doc)
  if FORMAT ~= 'epub3' then return nil end
  local chapter = PANDOC_WRITER_OPTIONS.split_level or 1

  return doc:walk{
    traverse = 'topdown',

    Header = function(h)
      if h.level <= chapter then n = 0 end
    end,

    Note = function(note)
      n = n + 1
      local blocks = note.content
      local first = blocks[1]
      if first and (first.t == 'Para' or first.t == 'Plain') then
        first.content = prefix(n) .. first.content
        blocks[1] = first
      else
        blocks:insert(1, pandoc.Plain(prefix(n)))
      end
      return pandoc.Note(blocks)
    end,
  }
end
