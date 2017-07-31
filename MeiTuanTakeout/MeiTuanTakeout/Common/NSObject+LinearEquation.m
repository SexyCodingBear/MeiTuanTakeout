//
//  NSObject+LinearEquation.m
//  MeiTuanTakeout
//
//  Created by 温岱阳 on 2017/7/31.
//  Copyright © 2017年 DaiyangWen. All rights reserved.
//

#import "NSObject+LinearEquation.h"

@implementation NSObject (LinearEquation)

// 计算二元一次方程组
//- (CGFloat)resultWithConsult:(CGFloat)consult andConsult1:(CGFloat)consult1 andResult1:(CGFloat)result1 andConsult2:(CGFloat)consult2 andresult2:(CGFloat)result2{
//    
//    CGFloat a = (result2 - result1) / (consult2 - consult1);
//    
//    CGFloat b = result1 - (consult1 * ((result2 - result1) / (consult2 - consult1)));
//    
//    return consult * a + b;
//    
//}



- (CGFloat)resultWithConsult:(CGFloat)consult andValue1:(WDYValue)value1 andValue2:(WDYValue)value2{

    CGFloat a = (value2.result - value1.result) / (value2.consult - value1.consult);
    
    CGFloat b = value1.result - (value1.consult * ((value2.result - value1.result) / (value2.consult - value1.consult)));
    
    return consult * a + b;

}


- (CGFloat)resultWithValue1:(WDYValue)value1 andValue2:(WDYValue)value2{
    
    CGFloat a = (value2.result - value1.result) / (value2.consult - value1.consult);
    
    CGFloat b = value1.result - (value1.consult * ((value2.result - value1.result) / (value2.consult - value1.consult)));
    
    return [(NSNumber *)self floatValue]  * a + b;
    
}





@end
