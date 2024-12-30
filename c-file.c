#include <stdio.h>


//extern "C" void __stdcall asmfunc(void);

#ifdef __cplusplus
extern "C" {
#endif

void __stdcall asmfunc(int array[],int length );

#ifdef __cplusplus
}
#endif


int main() {
    system("cls");
    int abc;
    printf("assembly proc calling from  from C! \n");
getch();
    int array[8] = {-1,-2,-3,1,2,3,4,5};
    
    
     asmfunc(array,8); //assembly proc calling
   
   getch();
    
    
    printf("back to  C! \n"); // printing in c
    
  
    
    return 0;
}