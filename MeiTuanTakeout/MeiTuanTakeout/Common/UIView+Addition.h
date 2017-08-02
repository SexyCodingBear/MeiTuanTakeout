//
//  UIView+Addition.h
//  MeiTuanTakeout
//
//  Created by 温岱阳 on 2017/8/2.
//  Copyright © 2017年 DaiyangWen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Addition)


/**
 对象方法获取对象的控制器

 @return 返回对象控制器，如果没有找到返回nil。
 */
- (UIViewController *)viewController;

@end
