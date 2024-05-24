CC = gcc
CFLAGS = -I./Guiao1/mycat -Wall -Wextra -Werror

TARGET = final

SRCS = Menu.c Guiao1/mycat/mycat.c

OBJS = $(SRCS:.c=.o)

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) $(OBJS) -o $(TARGET)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(OBJS) $(TARGET)

run: $(TARGET)
	./$(TARGET)

.PHONY: all clean run
