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

- (void)viewDidLoad {
    
    // 创建父类属性
    [super viewDidLoad];
    
    // 设置视图背景颜色
    self.view.backgroundColor = [UIColor greenColor];
    
    // 设置导航条的标题
    self.meiTuanNavigationItem.title = @"详情";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
