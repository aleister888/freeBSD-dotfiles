<img src="https://raw.githubusercontent.com/aleister888/freeBSD-dotfiles/master/freebsd-logo.png" align="left" height="100px">

## FreeBSD Dotfiles

`FreeBSD` dotfiles for my `Thinkpad X270`

<img src="https://raw.githubusercontent.com/aleister888/freeBSD-dotfiles/master/2022_12_09-14_16_13.jpg" hspace="0px" vspace="150px">

## ADD THESE LINES TO THESE FILES

### /etc/crontab

```
# Remove unwanted files
*/1	*	*	*	*	_youruser_    rm -rf ~/.xsession-errors ~/.xsession-errors.old ~/.local/share/fish/fish_history
~/.config/Brave-Browser ~/.cache/BraveSoftware
# Auto suspend laptop
*/1	*	*	*	*	_youruser_	~/.local/scripts/bat
# Mount automatically unmounted drives
*/1	*	*	*	*	root		/home/_youruser_/.local/scripts/automount.sh
```

### /etc/rc.conf

```
powerd_enable="YES"
powerd_flags="-a hiadaptive -b minimum"
```

### /etc/sysctl.conf

```
debug.cpufreq.lowest=300
debug.cpufreq.highest=2100
```

### /usr/local/etc/lightdm/slick-greeter.conf

```
[Greeter]
theme-name = Gruvbox-Material-Dark
icon-theme-name = Gruvbox-Material-Dark
background = /usr/local/share/pixmaps/yourbackground.jpg
hide-user-image = true
draw-grid=false
```

### /usr/local/etc/lightdm/lightdm.conf

```
user-authority-in-system-dir=true
```

### /usr/local/etc/sudoers

```
%wheel ALL=(ALL:ALL) NOPASSWD: /sbin/shutdown,/sbin/poweroff,/sbin/reboot,/sbin/mount,/sbin/umount,/usr/sbin/pkg,/usr/local/bin/xclickroot,/usr/local/bin/networkmgr
```

## GTK gruvbox theme from:

- [GTK theme](https://github.com/jmattheis/gruvbox-dark-icons-gtk)
- [Icon theme](https://github.com/jmattheis/gruvbox-dark-gtk)

## Useful Stuff

### Papirus PNG Icons

Since freeBSD still uses `imlib 1.7` it does not support `svg icon display`
for apps like xmenu, dunst, etc. I converted all Papirus app icons
into png.

### Fix linux browsers

As of now `https://github.com/mrclksr/linux-browser-installer` breaks linux
chroots when upgrading with `./linux-browser-installer chroot upgrade` for a
quick fix (it just relinks correctly a library) run `fix-linux-browser.sh` as root.

## Software used

- [dwm](https://dwm.suckless.org/)
- [st](https://st.suckless.org/)
- [slstatus](https://tools.suckless.org/slstatus/)
- [devour](https://github.com/salman-abedin/devour.git)
- [trash-cli](https://github.com/andreafrancia/trash-cli.git)
- [lsblk](https://www.freshports.org/sysutils/lsblk/)
- [xmenu](https://github.com/phillbush/xmenu)
- [xclickroot](https://github.com/phillbush/xclickroot)
- [dragon-drop](https://github.com/mwh/dragon)
- [nerd-fonts](https://github.com/ryanoasis/nerd-fonts)

## User-specific configs

These dotfiles are just for personal use, so many things are configured for
my own username `aleister` and dont use the `USER` or `HOME` variables.

- `init.vim`: replace `aleister` with your user

```
autocmd BufWritePost ~/.dotfiles/dwmblocks/blocks.h !pkexec sh -c 'cd /home/aleister/dwmblocks/; make install' && killall -q dwmblocks; dwmblocks &
autocmd BufWritePost ~/.dotfiles/dwm/config.h !pkexec sh -c 'cd /home/aleister/.dotfiles/dwm/; make install'
autocmd BufWritePost ~/.dotfiles/dmenu/config.h !pkexec sh -c 'cd /home/aleister/.dotfiles/dmenu/; make install'
autocmd BufWritePost ~/.dotfiles/.config/sxhkd/sxhkdrc !sh -c "pkill sxhkd; st -e devour sxhkd & disown"
```

```
autocmd Filetype markdown map <M-q> :! pandoc % -o $(echo % \| sed 's/md$/pdf/') --pdf-engine=xelatex --lua-filter="/home/aleister/.config/pandoc_filters/columns.lua" --variable mainfont="Linux Biolinum" -V geometry:margin=0.75in -V fontsize=14pt <CR>
```
