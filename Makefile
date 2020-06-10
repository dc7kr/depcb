DEBUG		= -g
#DEBUG		= -O2
GTK_CFLAGS	:= $(shell pkg-config --cflags gtk+-3.0 goocanvas-2.0)
GTK_LDFLAGS	:= $(shell pkg-config --libs gtk+-3.0 goocanvas-2.0)
CFLAGS		+= $(DEBUG) -Wall -Wextra -Werror $(GTK_CFLAGS)
LDFLAGS		+= $(DEBUG) $(GTK_LDFLAGS)
SRCS		= main.c event.c display.c
OBJS		= $(SRCS:.c=.o)
HDRS		= pcb.h
PROG		= depcb

all: $(PROG)

$(OBJS): $(HDRS)

$(PROG): $(OBJS)
	$(CC) $(OBJS) $(LDFLAGS) -o $(PROG)

clean:
	-rm -rf $(PROG) $(OBJS)

scope:
	cscope -bq $(SRCS) $(HDRS)
