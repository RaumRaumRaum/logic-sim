# Compiler and flags
CC = gcc
CFLAGS = -I./include -I/opt/homebrew/include -D_THREAD_SAFE
LDFLAGS = -L/opt/homebrew/lib -lSDL2

# Output binary
TARGET = build/logic-sim

# Source files
SRCS = src/main.c src/gates.c src/ui.c

# Object files
OBJS = $(SRCS:.c=.o)

# Default target
all: $(TARGET)

# Build target
$(TARGET): $(OBJS)
	$(CC) -o $(TARGET) $(OBJS) $(LDFLAGS)

# Compile source files to object files
%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

# Clean up build files
clean:
	rm -f $(OBJS) $(TARGET)
	