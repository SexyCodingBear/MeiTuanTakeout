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

/// 将食物列表表格声明为属性，方便在代理方法中判断类型
@property (weak, nonatomic) UITableView *foodTableView;



@end




// 设置重用标识符
static NSString *shopOrderCategoryTableViewCellID = @"shopOrderCategoryTableViewCell";

static NSString *shopOrderFoodTableViewCellID = @"shopOrderFoodTableViewCell";

static NSString *shopOrderFoodSectionHeaderViewID = @"shopOrderFoodSectionHeaderView";


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

    // TODO:1、食物分类表格处理
    [self setupCategoryTableView];
    
    
    // TODO:2、食物列表表格处理
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
    
    
    
    // 设置数据源
    categoryTableView.dataSource = self;
    
    // 设置代理
    categoryTableView.delegate = self;
    
    // 注册单元格
    [categoryTableView registerClass:[MeiTuanShopOrderCategoryCell class] forCellReuseIdentifier:shopOrderCategoryTableViewCellID];
    
    /// 设置索引位置
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    
    /// 设置选中行：让cell一出现就选中某行
    [categoryTableView selectRowAtIndexPath:indexPath animated:NO scrollPosition:UITableViewScrollPositionNone];
    
    /**
     
     typedef NS_ENUM(NSInteger, UITableViewScrollPosition) {
     UITableViewScrollPositionNone,
     UITableViewScrollPositionTop,
     UITableViewScrollPositionMiddle,
     UITableViewScrollPositionBottom
     };
     
     */
    
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

    // 设置数据源
    foodTableView.dataSource = self;
    
    // 设置代理
    foodTableView.delegate = self;
    
    // 加载XIB文件
    UINib *nib = [UINib nibWithNibName:@"MeiTuanShopOrderFoodCell" bundle:nil];
    
    // 注册单元格
    [foodTableView registerNib:nib forCellReuseIdentifier:shopOrderFoodTableViewCellID];
    
    // 注册每组头部视图
#warning mark - 注册每组头部视图必须使用registerClass: forHeaderFooterViewReuseIdentifier:方法
    [foodTableView registerClass:[MeiTuanShopOrderFoodSectionHeaderView class] forHeaderFooterViewReuseIdentifier:shopOrderFoodSectionHeaderViewID];
    
    // TODO:设置每组头部视图的统一行高
#warning mark - 如果是代码创建的每组头部视图必须要指定每组头部视图的高度
    foodTableView.sectionHeaderHeight = 30;
    
    // 设置预估行高
    foodTableView.estimatedRowHeight = 130;
    
    /// 给属性赋值
    _foodTableView = foodTableView;
}




#pragma mark - 数据源方法
// TODO:1、返回有多少组单元格
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    // 判断tableView的类型
    if (tableView == _categoryTableView) {
        
        // 如果是食物分类表格，返回1组
        return 1;
    }
    
    // 如果是食物列表表格，返回模型的长度
    return _shopOrderCategoryModelData.count;

}






// TODO:2、返回每组有多少行单元格
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    // 判断tableView的类型
    if (tableView == _categoryTableView) {
        
        // 如果是食物分类表格，返回模型的长度
        return _shopOrderCategoryModelData.count;
    }
    
    // 如果是食物列表表格，返回模型[对应组]的spus属性的长度
    return _shopOrderCategoryModelData[section].spus.count;
}






// TODO:3、设置单元格
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
    MeiTuanShopOrderFoodCell *shopOrderFoodTableViewCell  = [tableView dequeueReusableCellWithIdentifier:shopOrderFoodTableViewCellID forIndexPath:indexPath];
    
    // 取出食物分类模型
    MeiTuanShopOrderCategoryModel * shopOrderCategoryModel =
    _shopOrderCategoryModelData[indexPath.section];
    
    // 取出食物模型
    MeiTuanShopOrderFoodModel * shopOrderFoodModel =
    shopOrderCategoryModel.spus[indexPath.row];
    
    // 使用食物模型的name给食物列表的单元格的文本标签赋值
    shopOrderFoodTableViewCell.shopOrderFoodModel = shopOrderFoodModel;
    
    // 返回食物列表单元格
    return shopOrderFoodTableViewCell;
    
    
}





//#pragma mark - 设置食物列表表格头部标题
//// 设置食物列表表格每组头部标题，不能更改组头标题的字体
//-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
//
//    // 如果是食物列表表格
//    if (tableView != _categoryTableView) {
//
//        // 返回食物分类模型中的一组的名称
//        return _shopOrderCategoryModelData[section].name;
//    }
//
//    return nil;
//
//}



// TODO:4、设置表格每组头部视图:自定义食物列表表格每组头部视图
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {

    // 使用重用标识符获取表格每组头部视图
    MeiTuanShopOrderFoodSectionHeaderView *foodSectionHeaderView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:shopOrderFoodSectionHeaderViewID];
    
    // 给表格每组头部视图传递模型数据
    foodSectionHeaderView.shopOrderCategoryModel = _shopOrderCategoryModelData[section];
    
    // 返回表格每组头部视图
    return foodSectionHeaderView;
}




#pragma mark - 代理方法
/// TODO:5、某一行被选中的时候会调用此方法
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    /// 判断选中的列表是不是食物列表
    if (tableView == _foodTableView) {
        
        /// 如果是就取消此行的选中效果
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
    }


}





/// 滚动视图滚动时调用此方法
-(void)scrollViewDidScroll:(UIScrollView *)scrollView {

    /// 如果当前滚动的视图是食物列表视图
    if (scrollView == _foodTableView) {
        
        /// 获取食物列表视图可视区域所有cell的索引，取出第一个索引
        NSIndexPath *indexPath = [[_foodTableView indexPathsForVisibleRows] firstObject];
        
        /// 设置要选中的食物分类的表格索引,只有一组，所以section = 0，食物列表视图可视区域第一个索引的组数就是对应食物分类的表格的行数
        NSIndexPath *selectedIndexPath = [NSIndexPath indexPathForRow:indexPath.section inSection:0];
        
        /// 选中_categoryTableView的索引位置的cell并使此cell尽量显示在视图中间
        [_categoryTableView selectRowAtIndexPath:selectedIndexPath animated:YES scrollPosition:UITableViewScrollPositionMiddle];
        
        
        /**
         
         typedef NS_ENUM(NSInteger, UITableViewScrollPosition) {
         UITableViewScrollPositionNone,
         UITableViewScrollPositionTop,
         UITableViewScrollPositionMiddle,
         UITableViewScrollPositionBottom
         };
         
         */
    }
    

}







@end
