//
//  MeiTuanShopController.m
//  MeiTuanTakeout
//
//  Created by 温岱阳 on 2017/7/31.
//  Copyright © 2017年 DaiyangWen. All rights reserved.
//

#import "MeiTuanShopController.h"
#import "MeiTuanBaseController.h"

#define KShopHeaderViewMinHeight 64.0
#define KShopHeaderViewMaxHeight 180.0


@interface MeiTuanShopController ()

// 将头部视图声明为属性，方便数据传递
@property (weak, nonatomic) UIView *shopHeaderView;

// 右侧分享按钮
@property (strong,nonatomic) UIBarButtonItem *rightButtonItem;

@end



@implementation MeiTuanShopController

#pragma mark - 生命周期方法
- (void)viewDidLoad {
    
    // TODO:设置视图
    [self setupUI];
    
    // TODO:创建父类中的属性（创建导航条）
    [super viewDidLoad];
    
    // 设置控制器view背景颜色
    self.view.backgroundColor = [UIColor whiteColor];
    
    // TODO:设置导航条
    [self setupNavigationBar];
    
    // TODO:设置平移手势
    [self setupPanGesture];

}

// 设置视图
- (void)setupUI {


    // TODO:设置头部视图
    // 为了防止头部视图遮盖住导航条，将头部视图的setupUI方法在[super viewDidLoad]之前调用，viewDidLoad中创建的导航条就在头部视图上面了。
    [self setupShopHeaderView];
    
    
    
}




#pragma mark - 设置头部视图
// 设置头部视图
- (void)setupShopHeaderView{

    // 创建头部视图
    UIView *shopHeaderView = [[UIView alloc] init];
    
    // 设置背景颜色
    shopHeaderView.backgroundColor = [UIColor orangeColor];
    
    // 添加到父视图
    [self.view addSubview:shopHeaderView];
    
    // 给头部视图添加约束
    [shopHeaderView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        
        make.top.left.right.offset(0);
        
        // 高度约束
        make.height.offset(180);
        
        
    }];
    
    // 给属性赋值
    _shopHeaderView = shopHeaderView;


}






#pragma mark - 设置导航条
// 设置导航条
- (void)setupNavigationBar{
    
    
    // 设置导航条和状态栏的颜色
    //    self.meiTuanNavigationBar.barTintColor = [UIColor greenColor];
    
    // 给导航条添加标题
    self.meiTuanNavigationItem.title = @"香河肉饼";
    
    // 设置导航条标题颜色为完全透明
    self.meiTuanNavigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor colorWithWhite:0.4 alpha:0]};
    
    // 设置导航条背景视图颜色完全透明
    self.meiTuanNavigationBar.backgroundImageView.alpha = 0;
    
    // 添加右侧分享按钮
    _rightButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"btn_share"] style:UIBarButtonItemStylePlain target:self action:nil];
    
#warning mark - 注意使用要使用自定义的meiTuanNavigationItem
    // 将右侧按钮赋值给navigationItem的rightBarButtonItem
    self.meiTuanNavigationItem.rightBarButtonItem = _rightButtonItem;
    
    
    // 设置导航条的颜色（设置导航条左边,右边及返回按钮的颜色）
    self.meiTuanNavigationBar.tintColor = [UIColor whiteColor];
    
    
}





#pragma mark - 设置平移手势
// 设置平移手势
- (void)setupPanGesture {

    // 创建平移手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGesture:)];
    
    // 给controller的view添加手势
    [self.view addGestureRecognizer:pan];


}



#pragma mark - 平移手势方法
// 平移手势方法
- (void)panGesture:(UIPanGestureRecognizer *)panGesture{
    
    // TODO:1、设置头部视图高度跟随手指移动而改变
    
    // 1.1计算手势偏移量
    CGPoint offset = [panGesture translationInView:panGesture.view];
    
    
    // 1.2根据手势偏移量更新_shopHeaderView约束
    [_shopHeaderView mas_updateConstraints:^(MASConstraintMaker *make) {
        
        // 如果手势偏移量+头部视图原来高度小于等于最小高度
        if ((offset.y + _shopHeaderView.bounds.size.height) <= KShopHeaderViewMinHeight ) {
            
            // 将头部视图的高度固定在最小高度
            make.height.offset(KShopHeaderViewMinHeight);
            
            
        }else if ((offset.y + _shopHeaderView.bounds.size.height) >= KShopHeaderViewMaxHeight ) {// 如果手势偏移量+头部视图原来高度小大于等于最大高度
            
            // 将头部视图的高度固定在最大高度
            make.height.offset(KShopHeaderViewMaxHeight);
            
        }else{// 如果手势偏移量+头部视图原来高度在最小高度和最大高度之间
            
            // 头部视图的高度随手势偏移量和头部视图原来高度变化
            make.height.offset(offset.y + _shopHeaderView.bounds.size.height);
            
#warning mark - 测试代码
//            [self.view layoutIfNeeded];
//            NSLog(@"高度：%f",_shopHeaderView.bounds.size.height);
            
        }
        
    }];
    
    
    
    
    // TODO:2、设置导航条透明度跟随头部视图高度变化而改变
    
    /**
     
     2.1计算透明度线性变化公式：y为透明度，x为头部视图高度
     
     y = a * x + b;
     
     x = 64,y = 1;
     x = 180,y = 0;
     
     1 = 64a + b ;
     0 = 180a + b;
     
     a = - 1 / 116.0;
     b = 45 / 29.0
     
     y = -1 / 116.0 * x + 45 / 29.0;
     
     
     公式推导：
     result1 = consult1 * a + b;
     result2 = consult2 * a + b;
     
     a = (result2 - result1) / (consult2 - consult1);
     
     b = result1 - (consult1 * ((result2 - result1) / (consult2 - consult1)));
     
     */

    
    // 2.2 计算透明度值
#warning mark - 注意小数问题
//    CGFloat alpha = (- 1 * (offset.y + _shopHeaderView.bounds.size.height) / 116.0) + (45 / 29.0);
    
    
    // 将线形方程计算方法抽取到分类之后直接调用方法
//    CGFloat alpha = [self resultWithConsult:(offset.y + _shopHeaderView.bounds.size.height) andConsult1:KShopHeaderViewMinHeight andResult1:1 andConsult2:KShopHeaderViewMaxHeight andresult2:0];
    
    
    // 将线形方程计算方法抽取到分类之后直接调用方法
//    CGFloat alpha = [@(offset.y + _shopHeaderView.bounds.size.height) resultWithValue1:WDYValueMake(KShopHeaderViewMinHeight,1) andValue2:WDYValueMake(KShopHeaderViewMaxHeight,0)];

#warning mark - 测试代码
//    [self.view layoutIfNeeded];
//    NSLog(@"透明度高度：%f",_shopHeaderView.bounds.size.height);
    
    
    // 将线形方程计算方法抽取到分类之后直接调用方法，详见NSObject+LinearEquation分类
    CGFloat alpha = [self resultWithConsult:(_shopHeaderView.bounds.size.height) andValue1:WDYValueMake(KShopHeaderViewMinHeight,1) andValue2:WDYValueMake(KShopHeaderViewMaxHeight,0)];
    
    
    // 2.3 设置导航条的背景图片的透明度
    self.meiTuanNavigationBar.backgroundImageView.alpha = alpha;

    
    
    
    // TODO:3、设置导航条标题颜色（灰度的透明度）跟随头部视图高度变化而改变
    self.meiTuanNavigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor colorWithWhite:0.4 alpha:alpha]};
    
    
    
    
    // TODO:4、设置分享按钮的颜色（灰度的白色）跟随头部视图高度变化而改变

    // 4.1计算灰度中的白色值
#warning mark - 注意：使用的高度值
    // 参考值可以使用_shopHeaderView.bounds.size.height，也可以使用(offset.y + _shopHeaderView.bounds.size.height)，变化很小，基本没有区别，一种理论认为：此时的_shopHeaderView.bounds.size.height = offset.y + _shopHeaderView.bounds.size.height，是移动以后的高度。
    
    CGFloat white = [@(_shopHeaderView.bounds.size.height) resultWithValue1:WDYValueMake(KShopHeaderViewMinHeight, 0.4) andValue2:WDYValueMake(KShopHeaderViewMaxHeight, 1)];
    
    // 4.2 根据分享按钮的灰度值（根据计算出的白色值）
    self.meiTuanNavigationBar.tintColor = [UIColor colorWithWhite:white alpha:1];

    
    
    // TODO:5、根据头部视图高度设置状态栏样式
    // 判断头部视图的高度是不是最大的高度并且状态栏样式是不是白色
    if (_shopHeaderView.bounds.size.height == KShopHeaderViewMaxHeight && self.statusBarStyle != UIStatusBarStyleLightContent) {

#warning mark - statusBarStyle要在MeiTuanBaseController.h中声明，否则找不到变量
        // 如果两个条件都满足，将状态栏样式改为白色
        self.statusBarStyle = UIStatusBarStyleLightContent;
        
    }else if(_shopHeaderView.bounds.size.height == KShopHeaderViewMinHeight && self.statusBarStyle != UIStatusBarStyleDefault){// 判断头部视图的高度是不是最小的高度并且状态栏样式是不是黑色
        
        // 如果两个条件都满足，将状态栏样式改为默认的黑色
        self.statusBarStyle = UIStatusBarStyleDefault;
        
        
    }
    
    
    
    
    // TODO:6、重置平移手势的Translation值
    //_shopHeaderView.bounds.size.height已经累加了上次移动的距离，计算offset使用的Translation就不应该累加之前的距离，所以应该在下一次调用之前将Translation恢复默认值。
    [panGesture setTranslation:CGPointZero inView:_shopHeaderView];
    
}





@end
