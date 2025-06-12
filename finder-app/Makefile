
TARGET_DIR := .
TARGET := ${TARGET_DIR}/writer

CC := $(CROSS_COMPILE)gcc
CFLAGS := -Wall -Werror -g
SRC := ${TARGET_DIR}/writer.c
OBJ := ${TARGET_DIR}/writer.o

all: $(TARGET)

$(TARGET): $(OBJ)
	$(CC) $(CFLAGS) -o $@ $^

writer.o: $(SRC)
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(TARGET) *.o
