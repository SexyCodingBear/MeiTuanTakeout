//
//  MeiTuanShopOrderController.m
//  MeiTuanTakeout
//
//  Created by 温岱阳 on 2017/8/1.
//  Copyright © 2017年 DaiyangWen. All rights reserved.
//

#import "MeiTuanShopOrderController.h"

@interface MeiTuanShopOrderController ()


@property (weak, nonatomic) UITableView *categoryTableView;






@end

@implementation MeiTuanShopOrderController


#pragma mark - 生命周期方法：是图显示以后调用
- (void)viewDidLoad {
    
    
    [super viewDidLoad];
    
    // 设置背景颜色
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 搭建界面
    [self setupUI];
    
}




#pragma mark - 搭建界面
- (void)setupUI {

    // 食物类型表格处理
    [self setupCategoryTableView];
    
    
    // 食物列表表格处理
    [self setupFoodTableView];
    

}






#pragma mark - 食物类型表格处理
// 食物类型表格处理
- (void)setupCategoryTableView {
    
    // 创建plain样式的tableView
    UITableView *categoryTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    
    // 添加到父控件
    [self.view addSubview:categoryTableView];
    
    // 添加约束
    [categoryTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.bottom.offset(0);
        make.width.offset(100);
        
    }];
    
    // 给属性赋值
    _categoryTableView = categoryTableView;
}




#pragma mark - 食物列表表格处理
// 食物列表表格处理
- (void)setupFoodTableView {

    // 创建plain样式的tableView
    UITableView *foodTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    
    // 添加到父控件
    [self.view addSubview:foodTableView];
    
    // 添加约束
    [foodTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.right.bottom.offset(0);
        make.left.equalTo(_categoryTableView.mas_right).offset(0);
        
    }];



}


@end
