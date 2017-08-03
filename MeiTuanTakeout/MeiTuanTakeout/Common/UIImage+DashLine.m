//
//  UIImage+DashLine.m
//  MeiTuanTakeout
//
//  Created by 温岱阳 on 2017/8/2.
//  Copyright © 2017年 DaiyangWen. All rights reserved.
//

#import "UIImage+DashLine.h"

@implementation UIImage (DashLine)

+ (instancetype)dashLineViewWithColor:(UIColor *)color{
    
    // 开启图片类型上下文
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(4, 1), NO, 0);
    
    // 获取当前上下文
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    
    // 设置长度间隔数组
    CGFloat lengths[] = {2,2};
    
    // 设置虚线参数，2代表使用长度间隔数组中的几个间隔
    CGContextSetLineDash(contextRef, 0, lengths, 2);
    
    // 绘制起点
    CGContextMoveToPoint(contextRef, 0, 0);
    
    // 绘制终点，终点不算在内
    CGContextAddLineToPoint(contextRef, 4, 0);
    
    // 设置填充和描边的颜色(默认颜色为黑色)
    [color set];
    
    // 按上下文路径描边渲染
    CGContextStrokePath(contextRef);
    
    // 获取当前上下文中的图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    // 关闭图片类型上下文
    UIGraphicsEndImageContext();
    
    // 返回虚线样式图片
    return image;
    
}

@end
