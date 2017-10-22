void kmain(void) {
    const char *str = "my first kernel";
    char *videomem = (char*)0xb8000;
    unsigned int i = 0;
    unsigned int j = 0;

    while(j < 80 * 25 * 2) {
        videomem[j] = ' ';
        videomem[j + 1] = 0x07;
        j = j + 2;
    }

    j = 0;

    while(str[j] != '\0') {
        videomem[i] = str[j];
        videomem[i + 1] = 0x07;
        ++j;
        i = i + 2;
    }
    return;
}
