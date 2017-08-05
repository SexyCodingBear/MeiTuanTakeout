//
//  MeiTuanFoodDetailController.m
//  MeiTuanTakeout
//
//  Created by 温岱阳 on 2017/7/31.
//  Copyright © 2017年 DaiyangWen. All rights reserved.
//

#import "MeiTuanFoodDetailController.h"

@interface MeiTuanFoodDetailController () <UICollectionViewDataSource,UICollectionViewDelegate>

@end

/// 设置重用标识符
static NSString *foodDetailCellID = @"foodDetailCell";


@implementation MeiTuanFoodDetailController

#pragma mark - 生命周期方法
- (void)viewDidLoad {
    
    
    /// 搭建界面
    /// 为了防止表格视图遮盖住导航条，将表格视图的setupUI方法在[super viewDidLoad]之前调用，viewDidLoad中创建的导航条就在表格视图上面了。
    [self setupUI];
    
    // 创建父类属性
    [super viewDidLoad];
    
    /// 设置导航条
    [self setupNavigationBar];
    
    // 设置视图背景颜色
    self.view.backgroundColor = [UIColor orangeColor];
    
    /// 设置视图自动适应滚动屏幕的内边距（内缩64）
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    
    
}


- (void)setupUI {
    
    /// 创建自定义布局对象
    MeiTuanFoodDetailFlowLayout *foodDetailFlowLayout = [[MeiTuanFoodDetailFlowLayout alloc] init];
    
    /// 创建表格视图
    UICollectionView * foodDetailCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:foodDetailFlowLayout];
    
    /// 添加到父视图
    [self.view addSubview:foodDetailCollectionView];
    
    /// 设置约束
    [foodDetailCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.offset(0);
        
    }];
    
    /// 设置垂直滚动条
    foodDetailCollectionView.showsVerticalScrollIndicator = NO;
    
    /// 设置水平滚动条
    foodDetailCollectionView.showsHorizontalScrollIndicator = NO;
    
    /// 设置弹簧效果
    foodDetailCollectionView.bounces = NO;
    
    /// 设置分页效果
    foodDetailCollectionView.pagingEnabled = YES;
    
    /// 设置数据源
    foodDetailCollectionView.dataSource = self;
    
    /// 设置代理
    foodDetailCollectionView.delegate = self;
    
    /// 加载xib文件
    UINib *nib = [UINib nibWithNibName:@"MeiTuanFoodDetailCell" bundle:nil];
    
    /// 使用重用标识符和xib文件注册单元格
    [foodDetailCollectionView registerNib:nib forCellWithReuseIdentifier:foodDetailCellID];
    
    /// 跳转到要去的界面，viewDidLoad的时候foodDetailCollectionView的约束还没有添加，viewDidLoad中跳转到索引行时会调用prepareLayout，prepareLayout需要collectionView.bounds.size，没有约束size为0，会报错。所以需要添加延迟。
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        /// 跳转到指定索引行，并停留在左侧。
        [foodDetailCollectionView scrollToItemAtIndexPath:self.indexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
        
    });
    

}






#pragma mark - 数据源方法

/// 返回表格视图有多少组
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return _shopOrderCategoryModelData.count;
}





/// 返回表格视图每组有多少个表格
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {


    return _shopOrderCategoryModelData[section].spus.count;


}





/// 设置单元格
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    /// 使用重用机制（重用标识符和索引）获取单元格
    MeiTuanFoodDetailCell * foodDetailCell = [collectionView dequeueReusableCellWithReuseIdentifier:foodDetailCellID forIndexPath:indexPath];
    
    /// 给模型属性赋值，传递数据
    foodDetailCell.shopOrderFoodModel = _shopOrderCategoryModelData[indexPath.section].spus[indexPath.row];
    
    /// 返回单元格
    return foodDetailCell;

}






/**
 设置导航条
 */
- (void)setupNavigationBar {
    // 设置导航条的标题
//    self.meiTuanNavigationItem.title = @"详情";
    
    /// 让导航条背景图片透明
    self.meiTuanNavigationBar.backgroundImageView.alpha = 0;
    
    /// 设置导航条文字按钮颜色
    self.meiTuanNavigationBar.tintColor = [UIColor whiteColor];
}


@end
