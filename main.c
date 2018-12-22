#include <stdio.h>
#include <stdlib.h>

int main() {
    FILE *file = fopen("test.jpg", "r");

    if (file == NULL) {
        printf("ERROR: Unable to open file\n");
        exit(0);
    }

    for (int i = 0; i < 4; i++) {
        printf("%x", (unsigned char)fgetc(file));
    }
    printf("\n");

    fclose(file);
    return 0;
}