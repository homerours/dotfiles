# Notes

## Git
- Password cache
`git config --global credential.helper "cache --timeout=3600"`
- Show remotes
`git remote -v`
- Add remote
`git remote add <shortname> <url>`
- Push/pull
`git push <shortname> master` and `git pull <shortname> master`

- Apply .gitignore rules:
	1. Commit all pending changes, then run this command:
	`git rm -r --cached .`
	1. This removes everything from the index, then just run:
	`git add .`
	1. Commit it:
	`git commit -m ".gitignore is now working"`


## PDF
- cut pdf pages
`pdftk full-pdf.pdf cat 12-15 output outfile.pdf`
- rotate entire document
`pdftk in.pdf cat 1-endwest output out.pdf`

## Archives
- zip
```sh
zip archive.zip [file list]
zip -r archive.zip [dir]
zip -r archive.zip *
```

## VIM

- _NEW_
	* `'.`  -> to the last editded line
	* `gi`  -> go to last edited location, in insert mode
	* `g;`, `g,` or `<CTRL>-I`, `<CTRL>-O` -> go forward, backwards in the last edition locations
	* `:set spell spelllang=fr` -> french spellcheck
	* `gv` -> reselct previous visual selection

- Visual mode:
	* `o`   -> go to the other end of the area
	* `O`   -> in block selection, go to the oposite corner

## Pdf
- `pdftk <input-file> <operator> output <file>`
- `pdftk <input-file> output <file> <operator>`
- `pdftk in.pdf cat 1-endwest output out.pdf` (rotate 90 trigo)
- `pdftk in.pdf cat 1-10 12-end output out.pdf` (remove page 11)
_ `convert -density 400 -quality 95 xxx.pdf xxx.jpg`
