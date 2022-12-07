.POSIX:

NAME    = devour
VERSION = 11.0

X11INC = /usr/local/include
X11LIB = /usr/local/lib

CC     = cc
#CFLAGS = -std=c11 -D_POSIX_C_SOURCE=200809L -Wall -Wextra -pedantic -O2
CFLAGS = -std=c99 ${INCS} ${CPPFLAGS} -std=c11 -D_POSIX_C_SOURCE=200809L -Wextra -O2
#LDLIBS = -s -lX11
LDLIBS = -L${X11LIB} -lX11 ${XINERAMALIBS} ${FREETYPELIBS} -lX11-xcb -lxcb -lxcb-res
FREETYPEINC = ${X11INC}/freetype2
INCS = -I${X11INC} -I${FREETYPEINC}

BIN_DIR = /usr/local/bin

SRC = devour.c
OBJ = devour.o

all: $(NAME)
install: all
	mkdir -p $(BIN_DIR)
	mv $(NAME) $(BIN_DIR)
	rm -f $(OBJ)
	echo Done moving the binary to ${DESTDIR}${BIN_DIR}
uninstall:
	rm -f $(BIN_DIR)/$(NAME)
	echo Done removing the binary from $(BIN_DIR)

.PHONY: all install uninstall
