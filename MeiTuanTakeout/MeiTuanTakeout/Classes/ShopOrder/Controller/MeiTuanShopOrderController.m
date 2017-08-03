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


#pragma mark - 生命周期方法：视图显示以后调用
- (void)viewDidLoad {
    
    
    [super viewDidLoad];
    
    // 设置背景颜色
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 搭建界面
    [self setupUI];
    
}





#pragma mark - 搭建界面
- (void)setupUI {

    // 食物分类表格处理
    [self setupCategoryTableView];
    
    
    // 食物列表表格处理
    [self setupFoodTableView];
    

}





#pragma mark - 食物分类表格处理
// 食物分类表格处理
- (void)setupCategoryTableView {
    
    // 创建plain样式的tableView
    UITableView *categoryTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    
    // 设置单元格行高
    categoryTableView.rowHeight = 60;
    
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
    [categoryTableView registerClass:[MeiTuanShopOrderCategoryCell class] forCellReuseIdentifier:shopOrderCategoryTableViewCellID];
    
    
    
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
    
    // 判断tableView的类型
    if (tableView == _categoryTableView) {
        
        // 如果是食物分类表格，返回1组
        return 1;
    }
    
    // 如果是食物列表表格，返回模型的长度
    return _shopOrderCategoryModelData.count;

}






// 返回每组有多少行
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    // 判断tableView的类型
    if (tableView == _categoryTableView) {
        
        // 如果是食物分类表格，返回模型的长度
        return _shopOrderCategoryModelData.count;
    }
    
    // 如果是食物列表表格，返回模型[对应组]的spus属性的长度
    return _shopOrderCategoryModelData[section].spus.count;
}






// 设置单元格
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 判断tableView的类型
    if (tableView == _categoryTableView) {
        
        
        // 如果是食物分类表格，使用重用标识符创建食物分类表格单元格
        MeiTuanShopOrderCategoryCell *shopOrderCategoryTableViewCell  = [tableView dequeueReusableCellWithIdentifier:shopOrderCategoryTableViewCellID forIndexPath:indexPath];
        
        // 取出食物分类模型
        shopOrderCategoryTableViewCell.shopOrderCategoryModel =
        _shopOrderCategoryModelData[indexPath.row];
        
        // 返回食物分类单元格
        return shopOrderCategoryTableViewCell;
        
        
    }
    
    // 如果是食物列表表格，使用重用标识符创建食物列表表格单元格
    UITableViewCell *shopOrderFoodTableViewCell  = [tableView dequeueReusableCellWithIdentifier:shopOrderFoodTableViewCellID forIndexPath:indexPath];
    
    // 取出食物分类模型
    MeiTuanShopOrderCategoryModel * shopOrderCategoryModel =
    _shopOrderCategoryModelData[indexPath.section];
    
    // 取出食物模型
    MeiTuanShopOrderFoodModel * shopOrderFoodModel =
    shopOrderCategoryModel.spus[indexPath.row];
    
    // 使用食物模型的name给食物列表的单元格的文本标签赋值
    shopOrderFoodTableViewCell.textLabel.text = shopOrderFoodModel.name;
    
    // 返回食物列表单元格
    return shopOrderFoodTableViewCell;
    
    
}









@end
