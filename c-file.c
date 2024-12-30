
#include <stdio.h>


//extern "C" void __stdcall asmfunc(void);

#ifdef __cplusplus
extern "C" {
#endif

int __stdcall asmfunc(void);

#ifdef __cplusplus
}
#endif




int main() {
    system("cls");
    printf("assembly proc calling from  from C! \n");
getch();
    asmfunc();
    int result=asmfunc();
    if(result!=0){
        printf("total positive number in array is: ",result);
    }else{
        printf("no even number");
    }
   
   getch();
    
    
    printf("back to  C! \n"); // printing in c
    
  
    return 0;
}