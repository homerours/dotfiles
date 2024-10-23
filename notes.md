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

## Arch

solve vm-linuz not found at boot
1. Boot to a arch live usb
2. Run `fdisk -l`
```
Device        Start       End   Sectors  Size Type
/dev/sda1      2048   1050623   1048576  512M EFI System
/dev/sda2   1050624  17827839  16777216    8G Linux swap
/dev/sda3  17827840  91228159  73400320   35G Linux filesystem
/dev/sda4  91228160 500118158 408889999  195G Linux filesystem
```
3. Run
```bash
mount /dev/sda3 /mnt
mount /dev/sda1 /mnt/boot
```
4. Chroot: `arch-chroot`
5. reinstall `pacman -S mkinitcpio systemd linux`
