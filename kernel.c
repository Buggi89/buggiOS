#include <stdint.h>

uint16_t* buffer;

void kernel_main(void) {

    buffer = (uint16_t*) 0xB8000;
    buffer[0] = 15 | 'A' << 8;
    buffer[1] = 15;

}
