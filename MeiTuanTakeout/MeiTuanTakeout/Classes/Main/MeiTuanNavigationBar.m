//
//  MeiTuanNavigationBar.m
//  MeiTuanTakeout
//
//  Created by 温岱阳 on 2017/7/31.
//  Copyright © 2017年 DaiyangWen. All rights reserved.
//

#import "MeiTuanNavigationBar.h"

@implementation MeiTuanNavigationBar

#pragma mark - 重写初始化方法
// 重写初始化方法
- (instancetype)initWithFrame:(CGRect)frame{

    // 初始化父类属性
    if (self = [super initWithFrame:frame]) {
        
        // 去掉导航条阴影线
        [self setShadowImage:[UIImage new]];
        [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        
        
        /**
         
         typedef NS_ENUM(NSInteger, UIBarMetrics) {
         UIBarMetricsDefault,
         UIBarMetricsCompact,
         UIBarMetricsDefaultPrompt = 101, // Applicable only in bars with the prompt property, such as UINavigationBar and UISearchBar
         UIBarMetricsCompactPrompt,
         
         UIBarMetricsLandscapePhone NS_ENUM_DEPRECATED_IOS(5_0, 8_0, "Use UIBarMetricsCompact instead") = UIBarMetricsCompact,
         UIBarMetricsLandscapePhonePrompt NS_ENUM_DEPRECATED_IOS(7_0, 8_0, "Use UIBarMetricsCompactPrompt") = UIBarMetricsCompactPrompt,
         };
         
         */
        
        
        // 创建导航条背景视图
        UIImageView * backgroundImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_navigationBar_white"]];
        
        // 添加到父视图
        [self addSubview:backgroundImageView];
        
        // 添加约束
        [backgroundImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.edges.offset(0);
            
        }];
        
        // 给属性赋值
        _backgroundImageView = backgroundImageView;
        
        
    }
    
    return self;

}

@end
