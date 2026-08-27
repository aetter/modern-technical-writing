# Cover upload is a separate portion of the Kindle process; don't add it here.
# The Lua filter is for processing footnotes in a Kindle-friendly way,
# unnecessary on most other reader apps.
pandoc mtw.rst --epub-metadata=meta.xml \
  --css=min.css \
  -t epub3  \
  --toc  \
  --toc-depth=2  \
  --lua-filter=epub3-footnote-backlinks.lua \
  -o mtw-kindle.epub
