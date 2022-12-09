#!/usr/local/bin/dash
cat <<EOF | xmenu | dash &
IMG:/home/aleister/.local/xmenu-icons/internet-web-browser.png		Internet
	IMG:/home/aleister/.local/xmenu-icons/firefox.png		Firefox			firefox
	IMG:/home/aleister/.local/xmenu-icons/brave.png			Brave			linux-brave
	IMG:/home/aleister/.local/xmenu-icons/thunderbird.png		Thunderbird		thunderbird
	IMG:/home/aleister/.local/xmenu-icons/syncthing-gtk.png		Syncthing		xdg-open http://127.0.0.1:8384
	IMG:/home/aleister/.local/xmenu-icons/qbittorrent.png		qBittorrent		qbittorrent

IMG:/home/aleister/.local/xmenu-icons/multimedia.png			Sound & Video
	IMG:/home/aleister/.local/xmenu-icons/rhythmbox.png		Rhythmbox		rhythmbox
	IMG:/home/aleister/.local/xmenu-icons/mpv.png			mpv			mpv --player-operation-mode=pseudo-gui
	IMG:/home/aleister/.local/xmenu-icons/vlc.png			VLC			vlc
	IMG:/home/aleister/.local/xmenu-icons/pavucontrol.png		Pavucontrol		pavucontrol
	IMG:/home/aleister/.local/xmenu-icons/easytag.png		EasyTAG			easytag
	IMG:/home/aleister/.local/xmenu-icons/guitarix.png		Guitarix		guitarix
	IMG:/home/aleister/.local/xmenu-icons/qjackctl.png		Qjackctl		qjackctl

IMG:/home/aleister/.local/xmenu-icons/preferences-desktop-color.png	Graphics
	IMG:/home/aleister/.local/xmenu-icons/gimp.png			GIMP			gimp
	IMG:/home/aleister/.local/xmenu-icons/inkscape.png		Inkscape		inkscape
	IMG:/home/aleister/.local/xmenu-icons/fr.handbrake.ghb.png	HandBrake		ghb
	IMG:/home/aleister/.local/xmenu-icons/gcolor2.png		Gcolor2		gcolor2

IMG:/home/aleister/.local/xmenu-icons/applications-office.png		Office
	IMG:/home/aleister/.local/xmenu-icons/libreoffice-base.png		Libre Office		libreoffice --base
	IMG:/home/aleister/.local/xmenu-icons/libreoffice-writer.png		Libre Office Writer	libreoffice --writer
	IMG:/home/aleister/.local/xmenu-icons/libreoffice-calc.png		Libre Office Calc	libreoffice --calc
	IMG:/home/aleister/.local/xmenu-icons/libreoffice-impress.png		Libre Office Impress	libreoffice --impress
	IMG:/home/aleister/.local/xmenu-icons/libreoffice-math.png		Libre Office Math	libreoffice --math
	IMG:/home/aleister/.local/xmenu-icons/zathura.png			Zathura			zathura
	IMG:/home/aleister/.local/xmenu-icons/gnome-calculator.png		Calculator		gnome-calculator
	IMG:/home/aleister/.local/xmenu-icons/accessories-notes.png		Aula Virtual		xdg-open https://aulavirtual.ual.es/
	IMG:/home/aleister/.local/xmenu-icons/system-users.png			Campus Virtual		xdg-open https://campus.ual.es/

IMG:/home/aleister/.local/xmenu-icons/applications-utilities.png		Tools & Utilities
	IMG:/home/aleister/.local/xmenu-icons/htop.png				HTop			st -e htop
	IMG:/home/aleister/.local/xmenu-icons/keepassxc.png		KeePassXC	keepassxc
	IMG:/home/aleister/.local/xmenu-icons/bleachbit.png		Czkawka		czkawka_gui
	IMG:/home/aleister/.local/xmenu-icons/kfontview.png		Font Manager	font-manager
	IMG:/home/aleister/.local/xmenu-icons/configurator.png			Settings
		IMG:/home/aleister/.local/xmenu-icons/cups.png				Cups			xdg-open http://localhost:631/
		IMG:/home/aleister/.local/xmenu-icons/grandr.png			Display Settings	arandr
		IMG:/home/aleister/.local/xmenu-icons/preferences-desktop-theme.png	Ajustes de GTK		lxappearance
		IMG:/home/aleister/.local/xmenu-icons/qt.png				Ajustes de QT		qt5ct
		IMG:/home/aleister/.local/xmenu-icons/terminal.png			Terminal		st

IMG:/home/aleister/.local/xmenu-icons/firefox.png			Firefox			firefox
IMG:/home/aleister/.local/xmenu-icons/system-file-manager.png		File-Manager		st -e lf
IMG:/home/aleister/.local/xmenu-icons/terminal.png			Terminal		st
IMG:/home/aleister/.local/xmenu-icons/system-shutdown.png		Power
	IMG:/home/aleister/.local/xmenu-icons/system-lock-screen.png	Lock			xlock -mode qix
	IMG:/home/aleister/.local/xmenu-icons/system-log-out.png	Logout			killall -u aleister
	IMG:/home/aleister/.local/xmenu-icons/system-suspend.png	Suspend			notify-send "💤 Suspending..." && i3lock-fancy && acpiconf -s 3
	IMG:/home/aleister/.local/xmenu-icons/system-shutdown.png	Shutdown		pkexec poweroff
	IMG:/home/aleister/.local/xmenu-icons/system-reboot.png		Reboot			pkexec reboot
EOF
