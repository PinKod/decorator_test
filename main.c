//
// Created by Calamari Yeste on 2024-10-09.
//
#include <sys/mman.h>
#include <fcntl.h>
#include <unistd.h>
#include <stdio.h>
#include <string.h>



int main() {
    char input[20];
    while(1) {
        scanf("%s", input);
        if(strcmp(input, "exit") == 0) {
            break;
        }
        else if (strcmp(input, "hot_printf") == 0) {
            int fd = open("hot_file.o", O_RDONLY);

            off_t size = lseek(fd, 0, SEEK_END);
            void *addr = mmap(NULL, size, PROT_READ | PROT_EXEC, MAP_PRIVATE, fd, 0);

            void (*hot_printf)(void) = addr;

            hot_printf();

            close(fd);
            munmap(addr, size);
        }
    }
    return 0;
}