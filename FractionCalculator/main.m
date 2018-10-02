//
//  main.m
//  FractionCalculator
//
//  Created by Simon Lam on 9/23/18.
//  Copyright © 2018 Simon Lam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FractionCalculator.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        FractionCalculator *myCalculator = [[FractionCalculator alloc] init];
        bool isFirstRun = true; bool isOn = true; int c;
       // [myCalculator.nextFraction print];
       // [myCalculator.storedFraction print];
        while (isOn){
            
        if(isFirstRun){
            [myCalculator inputFraction];
            [myCalculator saveFirstFraction];
            isFirstRun = false;
        }
        
            NSLog(@"Input operation (-1: quit, 0: clear, 1: add, 2: subtract, 3: multiply, 4: divide, 5: simplify, 6: decimalize, 7: turn into mixed number): ");
        int operator;
        scanf("%i", &operator);
                switch(operator){
                    case -1:
                        isOn = false;
                        break;
                    case 0:
                        isFirstRun = true;
                        break;
                    case 1:
                        [myCalculator inputFraction];
                        [myCalculator add: false ];
                        break;
                    case 2:
                        [myCalculator inputFraction];
                        [myCalculator add: true];
                        break;
                    case 3:
                        [myCalculator inputFraction];
                        [myCalculator multiply: false];
                        break;
                    case 4:
                        [myCalculator inputFraction];
                        [myCalculator multiply: true];
                        break;
                    case 5:
                        [myCalculator.storedFraction simplify];
                        NSLog(@"The simplified fraction is: %i/%i.", myCalculator.storedFraction.numerator, myCalculator.storedFraction.denominator); //can continue to work off simplified frac.
                        break;
                    case 6:
                        NSLog(@"The decimal form is: %f.", [myCalculator.storedFraction decimalize]);
                        isFirstRun = true;
                        break;
                    case 7:
                        c = [myCalculator.storedFraction turnToMixedNum];
                        [myCalculator.storedFraction simplify];
                        NSLog(@"The mixed number is: %i + %i/%i.", c , myCalculator.storedFraction.numerator, myCalculator.storedFraction.denominator);
                        myCalculator.storedFraction.numerator += c*myCalculator.storedFraction.denominator; //can continue to work off mixed frac.
                        break;
                    default:
                        NSLog(@"Error: Operation out of bounds.");
                        break;
                        
                }
        }
    }
    
    return 0;
}
