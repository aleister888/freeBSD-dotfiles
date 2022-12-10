# $FreeBSD$
#
# .profile - Bourne Shell startup script for login shells
#

# These are normally set through /etc/login.conf.  You may override them here
# if wanted.
# PATH=/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin:$HOME/bin; export PATH

# Setting TERM is normally done through /etc/ttys.  Do only override
# if you're sure that you'll never log in via telnet or xterm or a
# serial line.
# TERM=xterm; 	export TERM

EDITOR=nvim;   	export EDITOR
PAGER=less;  	export PAGER

# set ENV to a file invoked each time sh is started for interactive use.
#ENV=$HOME/.shrc; export ENV

# Let sh(1) know it's at home, despite /home being a symlink.
if [ "$PWD" != "$HOME" ] && [ "$PWD" -ef "$HOME" ] ; then cd ; fi

# Query terminal size; useful for serial lines.
if [ -x /usr/bin/resizewin ] ; then /usr/bin/resizewin -z ; fi

# Display a random cookie on each login.
if [ -x /usr/bin/fortune ] ; then /usr/bin/fortune freebsd-tips ; fi

# Set default locale
CHARSET=UTF-8; 		export CHARSET
LANG=es_ES.UTF-8;	export LANG

export TERMINAL="st"
export EDITOR="nvim"
export BROWSER="firefox"
export _JAVA_AWT_WM_NONREPARENTING=1

# Make qt themes follow qt5ct settings
export QT_QPA_PLATFORMTHEME=qt5ct

# Cleanup $HOME directory of dotfiles
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

export ICEAUTHORITY="$XDG_CACHE_HOME"/ICEauthority
export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export XCURSOR_PATH=/usr/share/icons:${XDG_DATA_HOME}/icons
export GTK2_RC_FILES="${XDG_CONFIG_HOME:-$HOME/.config}/gtk-2.0/gtkrc"
alias wget='wget --hsts-file="$XDG_CONFIG_HOME"/wget-hsts'
alias gpg2='gpg2 --homedir "$XDG_DATA_HOME"/gnupg'

# lf Icons
export LF_ICONS="di=:\
fi=:\
tw=:\
ow=:\
ex=:\
ln=:\
or=:\
*.dll=:\
*.vst3=:\
*.exe=:\
*.txt=:\
*.ms=:\
*.tex=:\
*.markdown=:\
*.vim=:\
*.png=::\
*.webp=::\
*.ico=::\
*.jpg=:\
*.jpe=:\
*.jpeg=:\
*.JPG=:\
*.gif=:\
*.svg=:\
*.tif=:\
*.tiff=:\
*.xcf=:\
*.eps=:\
*.html=爵:\
*.xml=:\
*.gpg=:\
*.css=:\
*.kra=:\
*.pdf=:\
*.docx=:\
*.djvu=:\
*.epub=:\
*.cbr=:\
*.cbz=:\
*.csv=:\
*.xlsx=:\
*.md=:\
*README=:\
*LICENSE=:\
*.r=:\
*.R=:\
*.rmd=:\
*.Rmd=:\
*.m=:\
*.mp3=:\
*.opus=:\
*.ogg=:\
*.m4a=:\
*.flac=:\
*.ape=:\
*.wav=:\
*.cue=:\
*cover.jpg=:\
*cover.jpeg=:\
*cover.png=:\
*.tg=:\
*.gp=:\
*.gp3=:\
*.gp4=:\
*.gp5=:\
*.gpx=:\
*Missing-Tabs=:\
*.vst3=:\
*.so=:\
*.mid=:\
*.mkv=:\
*.mp4=:\
*.m4v=:\
*.webm=:\
*.mpeg=:\
*.avi=:\
*.mov=:\
*.mpg=:\
*.wmv=:\
*.m4b=:\
*.flv=:\
*.MOV=:\
*.kdenlive=:\
*.zip=:\
*.rar=:\
*.7z=:\
*.gz=:\
*.xz=:\
*.xnb=:\
*.z64=:\
*.v64=:\
*.n64=:\
*.gba=:\
*.nes=:\
*.gdi=:\
*.log=:\
*.reg=:\
*.aux=:\
*.toc=:\
*.iso=﫭:\
*.img=﫭:\
*.bib=:\
*.ged=:\
*.part=ﯜ:\
*.torrent=﮾:\
*.kdbx=:\
*.jar=:\
*.java=:\
*.js=:\
*.RPP=:\
*.RPP-bak=:\
*.rpp=:\
*.rpp-bak=:\
*.rpp-PROX=:\
*.reapeaks=:\
*other.wav=:\
*.psarc=:\
*vocals.wav=:\
*bass.wav=:\
*drums.wav=:\
*.vtt=:\
*.srt=:\
*.desktop=ﭯ:\
*.lnk=ﭯ:\
*.conf=:\
*.cfg=:\
*.vdf=:\
*.dmx=:\
*.toml=:\
*config.h=:\
*config.def.h=:\
*.json=:\
*.ini=:\
*.yml=:\
*PKGBUILD=殮:\
*Makefile=殮:\
*Makefile.inc=殮:\
*.mk=殮:\
*.c=:\
*.o=:\
*.h=:\
*.go=:\
*.cache=羽:\
*.tmp=羽:\
*.history=羽:\
*.mask=ﴣ:\
*Dockerfile=:\
*.vader=:\
*.sh=:\
*.git=:\
*.py=:\
*.blend=:\
"

# lf colors
export LF_COLORS="~/.config/=01;32:\
~/.local/=01;32:\
~/.local/share=33:\
~/.local/src=33:\
~/.local/scripts=33:\
~/.config/lf/lfrc=31:\
.git/=33:.git*=32:\
.github/=33:.git*=32:\
ln=01;36:\
or=31;01:\
tw=01;34:\
ow=01;34:\
st=01;34:\
di=01;34:\
pi=33:\
so=01;35:\
bd=33;01:\
cd=33;01:\
su=01;32:\
sg=01;32:\
ex=01;32:\
fi=00:\
"

#Start applications:
# Sets background
feh --no-fehbg --bg-fill /usr/local/share/pixmaps/background.jpg
# App Launcher
sxhkd &
# Compositor
xcompmgr &
# Network Manager
sudo networkmgr &
# Status bar
dwmblocks &
# Polkit
/usr/local/libexec/polkit-gnome-authentication-agent-1 &
# Keyring
gnome-keyring &
# Reads Xresources file
xrdb ~/.config/Xresources &
# Starts Syncthing
syncthing --no-browser &
# Clicking the root window opens up xmenu
sudo xclickroot sudo -u aleister /home/aleister/.local/scripts/xmenu.sh &
# Blue light filter
redshift -l $(curl -s "https://location.services.mozilla.com/v1/geolocate?key=geoclue" | jq -r '"\(.location.lat):\(.location.lng)"') &
# Disable screensaving
xset -dpms ; xset s off
