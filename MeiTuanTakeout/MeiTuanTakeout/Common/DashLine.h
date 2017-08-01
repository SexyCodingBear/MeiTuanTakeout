//
//  DashLine.h
//  MeiTuanTakeout
//
//  Created by 温岱阳 on 2017/8/2.
//  Copyright © 2017年 DaiyangWen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DashLine : UIImage


/**
 绘制指定颜色的虚线

 @param color 要绘制的虚线的颜色
 @return 返回一UIImage对象
 */
+ (instancetype)dashLineViewWithColor:(UIColor *)color;

@end
