<img src="https://raw.githubusercontent.com/aleister888/freeBSD-dotfiles/master/img/st.png" align="left" height="100px" hspace="30px">

## st - freeBSD

st build for freeBSD

## Keybindings

- `Alt + c` Copy
- `Alt + v` Paste
- `Alt + u/i` Decrease/Increase font size
- `Alt + o` Copy last command output

## Patches

- [Alpha](https://st.suckless.org/patches/alpha/st-alpha-20220206-0.8.5.diff)
- [Externalpipe](https://st.suckless.org/patches/externalpipe/st-externalpipe-0.8.4.diff)
- [Gruvbox](https://st.suckless.org/patches/gruvbox/st-gruvbox-light-0.8.5.diff)
- [Ligatures](https://st.suckless.org/patches/ligatures/0.8.4/st-ligatures-alpha-scrollback-20210824-0.8.4.diff)
- [Scrollback](https://st.suckless.org/patches/scrollback/st-scrollback-0.8.5.diff)

## Deps

Needed for Luke Smith [copyout funcionallity](https://github.com/LukeSmithxyz/st/blob/master/st-copyout):

- [xclip](https://www.freshports.org/x11/xclip/)
- [gawk](https://www.freshports.org/japanese/gawk/)
- [gsed](https://www.freshports.org/textproc/gsed/)
- [gnugrep](https://www.freshports.org/textproc/gnugrep/)

Right now the script works partially, it can't copy
outputs with more lines than the ones currently displayed by st.
