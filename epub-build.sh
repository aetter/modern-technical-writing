pandoc mtw.rst \
  --epub-metadata=meta.xml \
  --css=min.css \
  -t epub3 \
  --toc \
  --toc-depth=2 \
  --epub-cover-image=mtw-final.jpg \
  -o mtw.epub
