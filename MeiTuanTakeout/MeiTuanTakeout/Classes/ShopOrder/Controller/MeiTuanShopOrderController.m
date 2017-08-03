//
//  MeiTuanShopOrderController.m
//  MeiTuanTakeout
//
//  Created by 温岱阳 on 2017/8/1.
//  Copyright © 2017年 DaiyangWen. All rights reserved.
//

#import "MeiTuanShopOrderController.h"

@interface MeiTuanShopOrderController () <UITableViewDataSource,UITableViewDelegate>

// 将食物分类表格声明为属性，方便兄弟控件添加约束
@property (weak, nonatomic) UITableView *categoryTableView;






@end




// 设置重用标识符
static NSString *shopOrderCategoryTableViewCellID = @"shopOrderCategoryTableViewCell";

static NSString *shopOrderFoodTableViewCellID = @"shopOrderFoodTableViewCell";




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
    
    // 设置数据源
    categoryTableView.dataSource = self;
    
    // 设置代理
    categoryTableView.delegate = self;
    
    // 注册单元格
    [categoryTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:shopOrderCategoryTableViewCellID];
    
    
    
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

    // 设置数据源
    foodTableView.dataSource = self;
    
    // 设置代理
    foodTableView.delegate = self;
    
    // 注册单元格
    [foodTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:shopOrderFoodTableViewCellID];

}




#pragma mark - 数据源方法
// 返回有多少组
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    
    if (tableView == _categoryTableView) {
        
        return 1;
    }
    
    
    return _shopOrderCategoryModelData.count;

}






// 返回每组有多少行
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    if (tableView == _categoryTableView) {
        
        return _shopOrderCategoryModelData.count;
    }
    
    
    return _shopOrderCategoryModelData[section].spus.count;
}






// 设置单元格
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    if (tableView == _categoryTableView) {
        
        
        
        UITableViewCell *shopOrderCategoryTableViewCell  = [tableView dequeueReusableCellWithIdentifier:shopOrderCategoryTableViewCellID forIndexPath:indexPath];
        
        
        MeiTuanShopOrderCategoryModel * shopOrderCategoryModel =
        _shopOrderCategoryModelData[indexPath.row];
        
        
        shopOrderCategoryTableViewCell.textLabel.text = shopOrderCategoryModel.name;
        
        
        return shopOrderCategoryTableViewCell;
        
        
    }
    
    
    UITableViewCell *shopOrderFoodTableViewCell  = [tableView dequeueReusableCellWithIdentifier:shopOrderFoodTableViewCellID forIndexPath:indexPath];
    
    
    MeiTuanShopOrderCategoryModel * shopOrderCategoryModel =
    _shopOrderCategoryModelData[indexPath.section];
    
    
    MeiTuanShopOrderFoodModel * shopOrderFoodModel =
    shopOrderCategoryModel.spus[indexPath.row];
    
    
    shopOrderFoodTableViewCell.textLabel.text = shopOrderFoodModel.name;
    
    
    return shopOrderFoodTableViewCell;
    
    
}









@end
