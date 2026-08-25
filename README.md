# Modern Technical Writing

This repository contains the source files and build scripts for [Modern Technical Writing](https://www.amazon.com/dp/B01A2QL9SS).

## License

I've licensed this repository under [CC BY-NC-ND 4.0](https://creativecommons.org/licenses/by-nc-nd/4.0/). You are free to:

- Share — copy and redistribute the material in any medium or format.

Under the following terms:

- Attribution — You must give appropriate credit, provide a link to the license, and indicate if changes were made. You may do so in any reasonable manner, but not in any way that suggests the licensor endorses you or your use.
- NonCommercial — You may not use the material for commercial purposes.
- NoDerivatives — If you remix, transform, or build upon the material, you may not distribute the modified material.

Examples:

- Build the book yourself and, y'know, read it.
- Send the copy you built to friends, or distribute it to students in an educational setting.

See [LICENSE](LICENSE) for the full text.

## Build

The build scripts both require [Pandoc](https://pandoc.org). To build an EPUB, run `sh epub-build.sh`.

Building to a PDF requires a LaTeX distribution like [MacTex](https://www.tug.org/mactex/). Then run `pandoc mtw.rst -o mtw.pdf`.
