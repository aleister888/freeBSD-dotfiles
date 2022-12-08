// Modify this file to change what commands output to your statusbar, and
// recompile using the make command.
// the ^c#*^ are fg colors form https://dwm.suckless.org/patches/status2d/ 
static const Block blocks[] = {
    /*Icon*/ /*Command*/ /*Update Interval*/ /*Update Signal*/
    {" ^d^", "~/.local/scripts/sb/sb-rhythmbox",					1,	 10},
    {"^d^ ^b#d65d0e^^c#1d2021^  ^b#fe8019^ ", "df -h | grep zroot/ROOT/default | awk '{print $4}'",					60,	 0},
    {"^d^ ^b#b16286^^c#1d2021^  ^b#d3869b^ ", "uname -r | cut -c 1-4",							0,	 0},
    {"^d^ ^b#98971a^^c#1d2021^  ^b#b8bb26^ ", "pamixer --get-volume",    						1,	 0},
    {"^d^ ^b#d79921^^c#1d2021^  ^b#fabd2f^ ", "~/.local/scripts/sb/sb-battery",  					10,	 0},
    {"^d^ ^b#689d6a^^c#1d2021^  ^b#8ec07c^ ", "~/.local/scripts/sb/sb-mem",    						5,	 0},
    {"^d^ ^b#cc241d^^c#1d2021^  ^b#fb4934^ ", "date +'%H:%M'",					5,	 0},
    {"^d^   ", "",					0,	 0},

};

// sets delimeter between status commands. NULL character ('\0') means no
// delimeter.
static char delim[] =" ";
static unsigned int delimLen = 1;
