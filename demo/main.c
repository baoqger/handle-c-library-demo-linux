#include <stdio.h>
#include <libmy_shared.h>
#include <libmy_static_a.h>
#include <libmy_static_b.h>

int main(){

    printf("Press Enter to repeat\n\n");
    do{
        int n = getRandInt();
        n = negateIfOdd(n);
        printInteger(&n);

    } while (getchar() == '\n');
   
    return 0;
}
