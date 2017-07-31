//
//  MeiTuanFoodDetailController.m
//  MeiTuanTakeout
//
//  Created by 温岱阳 on 2017/7/31.
//  Copyright © 2017年 DaiyangWen. All rights reserved.
//

#import "MeiTuanFoodDetailController.h"

@interface MeiTuanFoodDetailController ()

@end



@implementation MeiTuanFoodDetailController

#pragma mark - 生命周期方法
- (void)viewDidLoad {
    
    // 创建父类属性
    [super viewDidLoad];
    
    // 设置视图背景颜色
    self.view.backgroundColor = [UIColor greenColor];
    
    // 设置导航条的标题
    self.meiTuanNavigationItem.title = @"详情";
}



@end
