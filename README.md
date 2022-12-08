# FreeBSD Dotfiles

`FreeBSD` dotfiles for my `Thinkpad X270`

![image](https://raw.githubusercontent.com/aleister888/freeBSD-dotfiles/master/2022_12_08-01_52_07.jpg)

## What's missing?

Install script with gnu stow for autoinstalling dotfiles.

## ADD THESE LINES TO THESE FILES

### /etc/crontab

```
# Remove unwanted files
*/1	*	*	*	*	_youruser_	rm ~/.xsession-errors ~/.xsession-errors.old ~/.local/share/fish/fish_history
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

## GTK gruvbox theme from:

- [GTK theme](https://github.com/jmattheis/gruvbox-dark-icons-gtk)
- [Icon theme](https://github.com/jmattheis/gruvbox-dark-gtk)

## Papirus PNG

Since freeBSD still uses `imlib 1.7` it does not support `svg icon display`
for apps like xmenu, dunst, etc. I converted all Papirus app icons
into png.

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
my own username `aleister` and dont use the `$USER` variable or `$HOME`.

- init.vim `(lines 131-134)`: replace aleister

```
autocmd BufWritePost ~/.local/src/freeBSD-dotfiles/slstatus/config.h !pkexec sh -c 'cd /home/aleister/.local/src/freeBSD-dotfiles/slstatus/; make install' && killall -q slstatus; slstatus &
autocmd BufWritePost ~/.local/src/freeBSD-dotfiles/dwm/config.h !pkexec sh -c 'cd /home/aleister/.local/src/freeBSD-dotfiles/dwm/; make install'
autocmd BufWritePost ~/.local/src/freeBSD-dotfiles/dmenu/config.h !pkexec sh -c 'cd /home/aleister/.local/src/freeBSD-dotfiles/dmenu/; make install'
autocmd BufWritePost ~/.config/sxhkd/sxhkdrc !sh -c "pkill sxhkd; st -e devour sxhkd & disown"
```
