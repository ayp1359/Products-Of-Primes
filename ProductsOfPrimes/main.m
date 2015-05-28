#import <Foundation/Foundation.h>

void printProductsRecursive(NSArray *numberArray, NSUInteger idx, NSUInteger prod){
  
  if (idx==numberArray.count) {
    if(prod != 1){
      NSLog(@"Recursive:%lu",(unsigned long)prod);
    }
    return;
  }
  
  printProductsRecursive(numberArray, idx+1, prod);
  printProductsRecursive(numberArray, idx+1, [numberArray[idx] integerValue]*prod);
  
  return;
}

void printProductsIterative(NSArray *numberArray){
  
  for (int i=1; i<=(1<<numberArray.count)-1; i++) {
    
    NSMutableSet *subset = [[NSMutableSet alloc] init];
    
    for (int j=0; j<=numberArray.count-1; j++) {
      if((1<<j)& i){
        [subset addObject:[numberArray objectAtIndex:j]];
      }
    }
    
    double prod = 1;
    for (NSNumber *num in subset) {
      prod = prod*[num integerValue];
    }
    NSLog(@"Iterative:%.0f",prod);
  }
  
  return;
}

int main(int argc, const char *argv[]) {
  @autoreleasepool {
    
    NSArray *numberArray = @[@2,@11,@3,@5,@7,@13];
    printProductsRecursive(numberArray,0,1);
    printProductsIterative(numberArray);
    
  }
  
  return 0;
}
