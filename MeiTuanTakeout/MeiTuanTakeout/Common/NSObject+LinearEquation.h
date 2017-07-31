//
//  NSObject+LinearEquation.h
//  MeiTuanTakeout
//
//  Created by 温岱阳 on 2017/7/31.
//  Copyright © 2017年 DaiyangWen. All rights reserved.
//

#import <Foundation/Foundation.h>


struct WDYValue {
    CGFloat consult;
    CGFloat result;
};
typedef struct WDYValue WDYValue;

//
CG_INLINE WDYValue WDYValueMake(CGFloat consult, CGFloat result)
{
    WDYValue value;
    value.consult = consult;
    value.result = result;
    
    return value;
}


@interface NSObject (LinearEquation)


// 计算二元一次方程组
//- (CGFloat)resultWithConsult:(CGFloat)consult andConsult1:(CGFloat)consult1 andResult1:(CGFloat)result1 andConsult2:(CGFloat)consult2 andresult2:(CGFloat)result2;


/**
 使用参考值计算线形方程的结果，self调用

 @param consult 指定的x值
 @param value1 第一组参考值（参考值，结果）
 @param value2 第二组参考值（参考值，结果）
 @return 返回计算结果y
 */
- (CGFloat)resultWithConsult:(CGFloat)consult andValue1:(WDYValue)value1 andValue2:(WDYValue)value2;


/**
 使用参考值计算线性方程的结果，指定的x值对象本身调用，如果x为基本数据类型，要转换成NSNumber对象

 @param value1 第一组参考值（参考值，结果）
 @param value2 第二组参考值（参考值，结果）
 @return 返回计算结果y
 */
- (CGFloat)resultWithValue1:(WDYValue)value1 andValue2:(WDYValue)value2;




@end
