#import <Foundation/Foundation.h>

void printProducts(NSArray *numberArray, NSUInteger idx, NSUInteger prod){
  
  if (idx==numberArray.count) {
    if(prod != 1){
      NSLog(@"%lu",(unsigned long)prod);
    }
    return;
  }
  
  printProducts(numberArray, idx+1, prod);
  printProducts(numberArray, idx+1, [numberArray[idx] integerValue]*prod);
  
  return;
}

int main(int argc, const char *argv[]){
  @autoreleasepool {
    
    NSArray *numberArray = @[@2,@3,@5];
    printProducts(numberArray,0,1);
    
  }
  
  return 0;
}