#include <stdio.h>
#include <wchar.h>
#include <locale.h>

#define YY_INPUT(buf, result, max_size)             \
  {                                                 \
    wint_t yyc= getwchar();                         \
    result= (WEOF == yyc) ? 0 : wctomb(buf, yyc);   \
    yyprintf((stderr, "<%C>", yyc));                \
  }

int yyparse();

int main() {
    char *locale = setlocale(LC_ALL, "");

    if (yyparse() == 0) {
        fprintf(stderr, "Failed!\n");
        return 1;
    }

    return 0;
}
