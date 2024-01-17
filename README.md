# Fix Article Metadata, fam

Manage your scientific article library using PDF metadata, Unix-style.

Most PDF articles found online have useless metadata.
To manage a library you will have to rely on
- the filesystem, which is limited
- or an external database = additional state to maintain + can lock you into an "ecosystem" :‑###..

However, PDF metadata is stored alongside the content and can contain a list of authors and a journal for easier searching.

## Advantages
- interoperability: files stay where they were and their metadata is open to other programs (pro-tip: look into `fzf`),
- freedom: no proprietary databases with special tools enforcing their workflow,
- hackability: the scripts are short, POSIX-compliant, pipe-able and accept wildcards, where applicable.

## Installation
```shell
git clone https://github.com/ivan-boikov/fam && cd fam && make install
```
By default it will install symlinks in `$HOME/.local/bin`.
Change to whatever inside the Makefile, but be sure it's in `$PATH`.
Run `make uninstall` to uninstall.

## How to use
1. Interactively find a correct DOI of a PDF with `doi-repair`.
No automatic internet searches and fancy algorithms -- you are way more reliable in finding a correct DOI anyway.
Then, data from CrossRef is used to populate *standard* PDF metadata with a list of authors, a title, and an *ISO-690*-like reference with a DOI.
2. Enjoy the profits: use `doi-rename` to unify your filenames or chain `doi-infer` with `doi-to-bibtex` to generate a BibTeX file
```shell
doi-infer *.pdf | doi-to-bibtex > literature.bib
```
(don't ask too much too quickly, don't anger CrossRef) or be extra fancy and search recursively with a bit cleaner output
```shell
find <library path> -name '*.pdf' | doi-infer | doi-to-bibtex | sed 's/\}, /\},\n\t/g' > literature.bib
```
or whatever else you have, the data is open, so use it!

## Dependencies
The things you already have most likely:
- `pdftk`, an excellent PDF editing utility, highly useful on its own
- `pdfinfo` from the `poppler` package (a dependency of `pdftk`)
- a PDF viewer callable by `xdg-open`
- standard Linux utilities: `grep`, `curl` and others

## Disclaimer
No guarantees, things might crash and burn, so be careful.
*Works on my machine*™.

## TODO
- embedding keywords
