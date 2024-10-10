CC = gcc
FLAGS = -Wall -Wextra -Wpedantic -std=c11 -g
LINUX_FLAGS =-lsubunit -lrt -lpthread -lm

OS := $(shell uname -s)

ifeq ($(OS),Linux)
	OPEN_CMD = xdg-open
endif
ifeq ($(OS),Darwin)
	OPEN_CMD = open
endif

all: clean obj_dir main hot_file run

main : main.c
	$(CC) $(FLAGS) main.c -o ./obj/main

hot_file : hot_file.c
	$(CC) $(FLAGS) -c hot_file.c -o ./obj/hot_file -fPIE

obj_dir :
	mkdir -p obj

run :
	./obj/main

clean:
	rm -rf ./obj/*



