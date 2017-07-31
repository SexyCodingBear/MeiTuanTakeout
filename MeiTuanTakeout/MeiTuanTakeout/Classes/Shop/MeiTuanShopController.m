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
    
    // 为了防止头部视图遮盖住导航条，将头部视图在[super viewDidLoad]之前调用，viewDidLoad中创建的导航条就在头部视图上面了。
    [self setupUI];
    
    // 创建父类中的属性
    [super viewDidLoad];
    
    // 设置控制器view背景颜色
    self.view.backgroundColor = [UIColor whiteColor];
    
//    // 设置导航条和状态栏的颜色
//    self.meiTuanNavigationBar.barTintColor = [UIColor greenColor];
    
    // 给导航条添加标题
    self.meiTuanNavigationItem.title = @"香河肉饼";
    
    // 设置导航条标题颜色为完全透明
    self.meiTuanNavigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor colorWithWhite:0.4 alpha:0]};
    
    // 设置导航条背景视图颜色完全透明
    self.meiTuanNavigationBar.backgroundImageView.alpha = 0;
    
    // 添加右侧分享按钮
    _rightButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"btn_share"] style:UIBarButtonItemStylePlain target:self action:nil];
    
    // 将右侧按钮赋值给navigationItem的rightBarButtonItem
    self.meiTuanNavigationItem.rightBarButtonItem = _rightButtonItem;
    
    
    // 设置导航条的颜色
    self.meiTuanNavigationBar.tintColor = [UIColor whiteColor];

}


- (void)setupUI{

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
    
    // 创建平移手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGesture:)];

    // 给controller的view添加手势
    [self.view addGestureRecognizer:pan];


}

#pragma mark - 平移手势方法
// 平移手势方法
- (void)panGesture:(UIPanGestureRecognizer *)panGesture{
    
    // 计算手势偏移量
    CGPoint offset = [panGesture translationInView:panGesture.view];
    
    
    // 根据手势偏移量更新_shopHeaderView约束
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
    
    /**
     
     计算透明度线性变化公式：y为透明度，x为头部视图高度
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
#warning mark - 注意小数问题
    // 设置透明度值，使透明度的值随头部视图高度的范围改变
//    CGFloat alpha = (- 1 * (offset.y + _shopHeaderView.bounds.size.height) / 116.0) + (45 / 29.0);
    
    
    // 将线形方程计算方法抽取到分类之后直接调用方法
//    CGFloat alpha = [self resultWithConsult:(offset.y + _shopHeaderView.bounds.size.height) andConsult1:KShopHeaderViewMinHeight andResult1:1 andConsult2:KShopHeaderViewMaxHeight andresult2:0];
    
    
    // 将线形方程计算方法抽取到分类之后直接调用方法
//    CGFloat alpha = [@(offset.y + _shopHeaderView.bounds.size.height) resultWithValue1:WDYValueMake(KShopHeaderViewMinHeight,1) andValue2:WDYValueMake(KShopHeaderViewMaxHeight,0)];

#warning mark - 测试代码
//    [self.view layoutIfNeeded];
//    NSLog(@"透明度高度：%f",_shopHeaderView.bounds.size.height);
    
    // 将线形方程计算方法抽取到分类之后直接调用方法
    CGFloat alpha = [self resultWithConsult:(_shopHeaderView.bounds.size.height) andValue1:WDYValueMake(KShopHeaderViewMinHeight,1) andValue2:WDYValueMake(KShopHeaderViewMaxHeight,0)];
    
    
    // 设置导航条的背景图片的透明度
    self.meiTuanNavigationBar.backgroundImageView.alpha = alpha;
    
    // 设置导航条标题颜色为跟随随头部视图高度的范围改变
    self.meiTuanNavigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor colorWithWhite:0.4 alpha:alpha]};

#warning mark - 注意：使用的高度值
    // 计算白色分享按钮的白色值，参考值可以使用_shopHeaderView.bounds.size.height，也可以使用(offset.y + _shopHeaderView.bounds.size.height)，变化很小，基本没有区别，一种理论认为：此时的_shopHeaderView.bounds.size.height = offset.y + _shopHeaderView.bounds.size.height，是移动以后的高度。
    CGFloat white = [@(_shopHeaderView.bounds.size.height) resultWithValue1:WDYValueMake(KShopHeaderViewMinHeight, 0.4) andValue2:WDYValueMake(KShopHeaderViewMaxHeight, 1)];
    
    // 根据计算出的白色值，给分享按钮赋值
    self.meiTuanNavigationBar.tintColor = [UIColor colorWithWhite:white alpha:1];
    
    // 根据头部视图高度设置状态栏样式
    // 判断头部视图的高度是不是最大的高度并且状态栏样式是不是白色
    if (_shopHeaderView.bounds.size.height == KShopHeaderViewMaxHeight && self.statusBarStyle != UIStatusBarStyleLightContent) {
        
        // 如果两个条件都满足，将状态栏样式改为白色
        self.statusBarStyle = UIStatusBarStyleLightContent;
        
    }else if(_shopHeaderView.bounds.size.height == KShopHeaderViewMinHeight && self.statusBarStyle != UIStatusBarStyleDefault){// 判断头部视图的高度是不是最小的高度并且状态栏样式是不是黑色
        
        // 如果两个条件都满足，将状态栏样式改为默认的黑色
        self.statusBarStyle = UIStatusBarStyleDefault;
        
        
    }
    
    
    
    
    
    //_shopHeaderView.bounds.size.height已经累加了上次移动的距离，计算offset使用的Translation就不应该累加之前的距离，所以应该在下一次调用之前将Translation恢复默认值。
    [panGesture setTranslation:CGPointZero inView:_shopHeaderView];
    
}

//// 计算二元一次方程组
//- (CGFloat)resultWithConsult:(CGFloat)consult andConsult1:(CGFloat)consult1 andResult1:(CGFloat)result1 andConsult2:(CGFloat)consult2 andresult2:(CGFloat)result2{
//
//    CGFloat a = (result2 - result1) / (consult2 - consult1);
//    
//    CGFloat b = result1 - (consult1 * ((result2 - result1) / (consult2 - consult1)));
//    
//    return consult * a + b;
//
//}



//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    
//    // 创建食物详情控制器
//    MeiTuanFoodDetailController * foodDetailController =[[MeiTuanFoodDetailController alloc] init];
//
//    // 使用导航控制器推入到食品详情视图
//    [self.navigationController pushViewController:foodDetailController animated:YES];
//
//}




@end
