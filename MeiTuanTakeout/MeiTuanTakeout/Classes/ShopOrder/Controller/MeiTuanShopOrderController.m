//
//  MeiTuanShopOrderController.m
//  MeiTuanTakeout
//
//  Created by 温岱阳 on 2017/8/1.
//  Copyright © 2017年 DaiyangWen. All rights reserved.
//

#import "MeiTuanShopOrderController.h"

@interface MeiTuanShopOrderController () <UITableViewDataSource,UITableViewDelegate,MeiTuanShopOrderFoodCountViewDelegate>

// 将食物分类表格声明为属性，方便兄弟控件添加约束
@property (weak, nonatomic) UITableView *categoryTableView;

/// 将食物列表表格声明为属性，方便在代理方法中判断类型
@property (weak, nonatomic) UITableView *foodTableView;

// 将购物车控件声明为属性，方便兄弟控件添加约束
@property (weak, nonatomic) MeiTuanShopCarView *shopCarView;

/// 是否手动选中食物分类列表
@property (assign, nonatomic) BOOL isCategoryTableViewClick;

/// 购物车模型属性
@property (strong,nonatomic) MeiTuanShopCarModel *shopCarModel;

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
    
    /// TODO:1、添加购物车控件，先创建购物车，等食物分类表格和食物列表表格创建的时候，它们的底部约束参照购物车的顶端来设置，这样就不会被购物车盖住。
    [self setupShopCarView];
    
    // TODO:2、食物分类表格处理
    [self setupCategoryTableView];
    
    
    // TODO:3、食物列表表格处理
    [self setupFoodTableView];
    
    /// TODO:4、将购物车视图插入到食物列表视图之上
//    [self.view insertSubview:_shopCarView aboveSubview:_foodTableView];
    
    /// TODO:4、将购物车视图置顶
    [self.view bringSubviewToFront:_shopCarView];

}



#pragma mark - 添加购物车控件
/// 添加购物车控件
- (void)setupShopCarView {
    
    /// 类方法获取xib文件的实例对象
    MeiTuanShopCarView *shopCarView = [MeiTuanShopCarView shopCarView];
    
    /// 添加到父控件
    [self.view addSubview:shopCarView];
    
    /// 添加约束，xib控件从文件加载出来以后是有尺寸的，加了约束就没有尺寸了，所以要加约束就要加全，加上xib文件的高
    [shopCarView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.bottom.right.offset(0);
        make.height.offset(shopCarView.bounds.size.height);
        
    }];
    
    
    /// 给属性赋值
    _shopCarView = shopCarView;
}





#pragma mark - 食物分类表格处理
// 食物分类表格处理
- (void)setupCategoryTableView {
    
    // 创建plain样式的tableView
    UITableView *categoryTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    
    // 设置单元格行高
    categoryTableView.rowHeight = 60;
    
    /// TODO:隐藏分割线?
    categoryTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    // 添加到父控件
    [self.view addSubview:categoryTableView];
    
    // 添加约束
    [categoryTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.offset(0);
        make.width.offset(100);
        make.bottom.equalTo(_shopCarView.mas_top).offset(0);
        
    }];
    
    // 设置数据源
    categoryTableView.dataSource = self;
    
    // 设置代理
    categoryTableView.delegate = self;
    
    // 注册单元格
    [categoryTableView registerClass:[MeiTuanShopOrderCategoryCell class] forCellReuseIdentifier:shopOrderCategoryTableViewCellID];
    
    /// 设置索引位置
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    
    /// 设置选中行：让cell一出现就选中第0行
    [categoryTableView selectRowAtIndexPath:indexPath animated:NO scrollPosition:UITableViewScrollPositionNone];
    
    /**
     
     typedef NS_ENUM(NSInteger, UITableViewScrollPosition) {
     UITableViewScrollPositionNone,
     UITableViewScrollPositionTop,
     UITableViewScrollPositionMiddle,
     UITableViewScrollPositionBottom
     };
     
     */
    
    /// 因为自定义了分割线，所以隐藏系统原有的分割线
    categoryTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    
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
        
        make.top.right.offset(0);
        make.left.equalTo(_categoryTableView.mas_right).offset(0);
        make.bottom.equalTo(_shopCarView.mas_top).offset(0);
        
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
    
    /// 给cell中的foodCountView的代理属性赋值
    shopOrderFoodTableViewCell.foodCountView.delegate = self;
    
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
    
    /// 判断选中的列表是不是食物列表表格
    if (tableView == _foodTableView) {
        
        /// 如果是就取消此行的选中效果
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        
        /// 创建食物详情控制器
        MeiTuanFoodDetailController * foodDetailController = [[MeiTuanFoodDetailController alloc] init];
        
        /// 给模型赋值，数据传递
        foodDetailController.shopOrderCategoryModelData = _shopOrderCategoryModelData;
        
        /// 将选中的行的索引值传给食物详情控制器
        foodDetailController.indexPath = indexPath;
        
        /// 导航控制器跳转到食物详情控制器
        [self.navigationController pushViewController:foodDetailController animated:YES];
        
        
    }
    
    /// 判断选中的列表是不是食物分类表格
    if (tableView == _categoryTableView) {
        
        /// 如果是，将_isCategoryTableViewClick置为YES
        _isCategoryTableViewClick = YES;
        
        /// 如果是，创建要滚动到_foodTableView的位置的索引
        NSIndexPath *scrollIndexPath = [NSIndexPath indexPathForRow:0 inSection:indexPath.row];
        
        /// 使_foodTableView动画形式滚动到指定索引位置，并尽量使该位置在视图顶部
        [_foodTableView scrollToRowAtIndexPath:scrollIndexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
        
        
    }


}





#pragma mark - 滚动视图滚动时调用此方法
/// 滚动视图滚动时调用此方法
-(void)scrollViewDidScroll:(UIScrollView *)scrollView {

    /// 如果当前滚动的视图是食物列表视图，
    /// 当点击食物分类表格的时候,会滚动到指定索引位置，滚动时又会调用scrollViewDidScroll:方法，又会让食物分类表格在屏幕中间显示，会发生闪动。为了解决这个问题设置了_isCategoryTableViewClick变量进行判断
    if (scrollView == _foodTableView && _isCategoryTableViewClick == NO) {
        
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





#pragma mark - 滚动动画完成会调用此方法
/// 滚动动画完成会调用此方法
-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {

    /// 点击_isCategoryTableView让视图自己滚动到要去的位置后，将_isCategoryTableViewClick标记重制为NO
    _isCategoryTableViewClick = NO;


}





#pragma mark - 实现<MeiTuanShopOrderFoodCountViewDelegate>代理方法
/// 实现<MeiTuanShopOrderFoodCountViewDelegate>代理方法
-(void)shopOrderFoodCountViewValueChange:(MeiTuanShopOrderFoodCountView *)countView {

//    NSLog(@"%s", __FUNCTION__);// 测试代码
    switch (countView.buttonType) {
        
        /// 如果点击的按钮类形是加号
        case MeiTuanShopOrderFoodCountViewButtonTypeAdd:
//            NSLog(@"多选了一个食物");// 测试代码
            
            /// 将计数器视图的模型属性添加到点菜控制器购物车属性的模型数组中
            [self.shopCarModel.foodModelArray addObject:countView.shopOrderFoodModel];
//            NSLog(@"%@",_foodModelArray );
            
            break;
        
    /**
     
     注意：要坐购物车点击开看里面有多少行食物的时候，可以再定义一个NSSet属性，NSSet中没有重复的模型，NSSet.count就可以知道有多少行，因为购物车列表也是tableView，但是
     
     
     */
            
        /// 如果点击的按钮类形是减号
        case MeiTuanShopOrderFoodCountViewButtonTypeMinus:
//            NSLog(@"删除了一个食物");// 测试代码
            
        /// 删除模型对象会把所有地址相同的对象模型全部删除
//            [self.foodModelArray removeObject:countView.shopOrderFoodModel];
            
            /// 将计数器视图的模型属性从点菜控制器购物车属性的模型数组中删除
            /// 使用索引删除不会把所有地址相同的对象模型删除
            [self.shopCarModel.foodModelArray removeObjectAtIndex:[self.shopCarModel.foodModelArray indexOfObject:countView.shopOrderFoodModel]];
            break;
            
            
        default:
            break;
    }
    
    
    /// 将购物车模型属性赋值给购物车视图
    self.shopCarView.shopCarModel = self.shopCarModel;
}





#pragma mark - 懒加载创建购物车模型
/// 懒加载创建购物车模型,给模型中的属性进行实例化
- (MeiTuanShopCarModel *)shopCarModel {

    if (_shopCarModel == nil) {
        
        _shopCarModel = [[MeiTuanShopCarModel alloc]init];
        
    }

    return _shopCarModel;
}






@end
