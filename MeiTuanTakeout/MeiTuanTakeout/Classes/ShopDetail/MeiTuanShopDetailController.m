//
//  MeiTuanShopDetailController.m
//  MeiTuanTakeout
//
//  Created by 温岱阳 on 2017/8/2.
//  Copyright © 2017年 DaiyangWen. All rights reserved.
//

#import "MeiTuanShopDetailController.h"

@interface MeiTuanShopDetailController ()

@end

@implementation MeiTuanShopDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 添加背景颜色
    self.view.backgroundColor = [UIColor orangeColor];
    
    // TODO：1、创建关闭按钮
    UIButton * closeButton = [[UIButton alloc] init];
    
    
    // 设置按钮的图片
    [closeButton setImage:[UIImage imageNamed:@"btn_close_normal"] forState:UIControlStateNormal];
    
    [closeButton setImage:[UIImage imageNamed:@"btn_close_normal"] forState:UIControlStateHighlighted];
    
    
    // 给按钮添加监听事件
    [closeButton addTarget:self action:@selector(closeButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    // 添加到父视图
    [self.view addSubview:closeButton];
    
    // 添加约束
    [closeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.offset(0);
        make.bottom.offset(-60);
        
    }];
    
    
    
    
    
    
    
}


- (void)closeButtonClick {
    
    // 动画方式关闭商家控制器
    [self dismissViewControllerAnimated:YES completion:nil];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
