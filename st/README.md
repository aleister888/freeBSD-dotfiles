# DWM - FreeBSD

## Keybindings

- Alt + c : Copy
- Alt + v : Paste
- Alt + u/i : Decrease/Increase font size
- Alt + o : Copy last command output

## Patches

- Alpha
- Externalpipe
- Ligatures
- Scrollback

## Deps

Needed for Luke smith copyout funcionallity
(https://github.com/LukeSmithxyz/st/blob/master/st-copyout):

- xclip
- gawk
- gsed
- gnugrep

Right now the script works partially, it can't copy
outputs with more lines than the ones displayed by st.
