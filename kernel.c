void kernelMain(void) {
  const char *string = "Basic kernel";
  char *videomemptr = (char*)0xb8000;
  unsigned int i = 0;
  unsigned int j = 0;

  while (j < 80 * 25 * 2) {
    videomemptr[j] = ' ';
    videomemptr[j+1] = 0x02;
    j = j+2;
  }
  j = 0;

  while(string[j] != '\0') {
    videomemptr[i] = string[j];
    videomemptr[i+1] = 0x02;
    ++j;
    i = i+2;
  }

  return ;
}
