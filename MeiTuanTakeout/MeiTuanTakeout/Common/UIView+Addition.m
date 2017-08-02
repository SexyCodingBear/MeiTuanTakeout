//
//  UIView+Addition.m
//  MeiTuanTakeout
//
//  Created by 温岱阳 on 2017/8/2.
//  Copyright © 2017年 DaiyangWen. All rights reserved.
//

#import "UIView+Addition.h"

@implementation UIView (Addition)

- (UIViewController *)viewController {
    
    // 获取下一个响应者对象
    UIResponder * responder = [self nextResponder];
    
    
    
    while (responder) {
        
        // 如果当前响应者是控制器
        if ([responder isKindOfClass:[UIViewController class]]) {
            
            // 返回当前响应者
            return (UIViewController *)responder;
            
        }
        
        // 如果当前响应者不是控制器，就继续找下一个响应者
        responder = [responder nextResponder];
    }
    
    
    return nil;
    
}


@end
