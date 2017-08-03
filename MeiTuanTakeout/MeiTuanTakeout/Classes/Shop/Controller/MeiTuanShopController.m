//
//  MeiTuanShopController.m
//  MeiTuanTakeout
//
//  Created by 温岱阳 on 2017/7/31.
//  Copyright © 2017年 DaiyangWen. All rights reserved.
//

#import "MeiTuanShopController.h"

#define KShopHeaderViewMinHeight 64.0
#define KShopHeaderViewMaxHeight 180.0


@interface MeiTuanShopController ()

// 将 头部视图模型 声明为属性，方便数据传递
@property (strong,nonatomic) MeiTuanShopHeaderViewModel * headerViewModel;

// 声明存储ShopOrderCategoryModel模型的可变数组
@property (strong,nonatomic) NSMutableArray *shopOrderCategoryModelArray;

// 将 右侧分享按钮 声明为属性，方便数据传递
@property (strong,nonatomic) UIBarButtonItem *rightButtonItem;

// 将 头部视图 声明为属性，方便数据传递和兄弟控件添加约束
@property (weak, nonatomic) MeiTuanShopHeaderView *shopHeaderView;

// 将 标签视图 声明为属性，方便数据传递和兄弟控件添加约束
@property (weak, nonatomic) UIView *shopTagView;

// 将 标签栏指示器 声明为属性，方便数据传递和兄弟控件添加约束
@property (weak, nonatomic) UIView *shopTagIndicatorView;

// 将 滚动视图 声明为属性，方便数据传递和兄弟控件添加约束
@property (weak, nonatomic) UIScrollView *shopScrollView;



@end



@implementation MeiTuanShopController

#pragma mark - 生命周期方法
- (void)viewDidLoad {
    
    // TODO:加载数据
    // setupUI中就创建了头部视图，所以数据要在头部视图创建完成之前加载
    [self loadFoodData];
    
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





#pragma mark - 设置全局视图
// 设置全局视图
- (void)setupUI {


    // TODO:设置头部视图
    // 为了防止头部视图遮盖住导航条，将头部视图的setupUI方法在[super viewDidLoad]之前调用，viewDidLoad中创建的导航条就在头部视图上面了。
    [self setupShopHeaderView];
    
    // TODO:设置标签栏视图
    [self setupShopTagView];
    
    // TODO:设置滚动视图
    [self setupShopScrollView];
    
}





#pragma mark - 设置头部视图
// 设置头部视图
- (void)setupShopHeaderView {

    // 创建头部视图
    MeiTuanShopHeaderView *shopHeaderView = [[MeiTuanShopHeaderView alloc] init];
    
    // 设置背景颜色
    shopHeaderView.backgroundColor = [UIColor orangeColor];
    
    // 给view的模型属性赋值
    shopHeaderView.headerViewModel = _headerViewModel;
    
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





#pragma mark - 设置标签栏视图
// 设置头部视图下面的标签栏视图
- (void)setupShopTagView {
    
    // TODO:1、创建标签栏视图
    UIView *shopTagView = [[UIView alloc] init];
    
    // TODO:此行是测试代码
//    shopTagView.alpha = 0.2;
    
    // 设置标签视图背景颜色
    shopTagView.backgroundColor = [UIColor whiteColor];
    
    // 添加到父视图
    [self.view addSubview:shopTagView];
    
    // 设置约束
    [shopTagView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.offset(0);
        make.top.equalTo(_shopHeaderView.mas_bottom).offset(0);
        make.height.offset(44);
        
    }];
    
    // 给属性赋值
    _shopTagView = shopTagView;
    
    // TODO:2、添加标签栏视图中的按钮
    UIButton *orderButton = [self makeShopTagButtonWithTitle:@"点菜"];
    
    // 给点才按钮设置初始字体类型为加粗
    orderButton.titleLabel.font = [UIFont boldSystemFontOfSize:14];
    
    [self makeShopTagButtonWithTitle:@"评价"];
    [self makeShopTagButtonWithTitle:@"商家"];
    
    // 给标签栏视图中的按钮 批量 添加约束
    [_shopTagView.subviews mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.bottom.offset(0);
        
    }];
    
    // 给标签栏视图中的按钮添加 轴向 约束（MASAxisTypeHorizontal水平轴向）
    [_shopTagView.subviews mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:0 tailSpacing:0];
    
    // TODO:3、添加标签栏指示器视图
    // 创建标签栏指示器
    UIView *shopTagIndicatorView = [[UIView alloc] init];
    
    // 设置标签栏指示器背景颜色为“主题色”（在UIColor+Addition中自定义的方法）
    shopTagIndicatorView.backgroundColor = [UIColor primaryColor];
    
    // 添加到父视图
    [_shopTagView addSubview:shopTagIndicatorView];
    
    // 给标签栏指示器添加约束
    [shopTagIndicatorView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.offset(50);
        make.height.offset(4);
        make.bottom.offset(0);
#warning mark - 注意添加按钮指示器的约束的位置必须在按钮创建之后
        // 参照点菜按钮，必须在点菜按钮创建之后再添加这个约束
        make.centerX.equalTo(orderButton.mas_centerX).offset(0);
        
    }];
    
    // 给标签栏指示器属性赋值
    _shopTagIndicatorView = shopTagIndicatorView;
    
    
}





#pragma mark - 创建标签栏视图中的按钮
// 创建标签栏视图中的按钮
- (UIButton *)makeShopTagButtonWithTitle:(NSString *)title {
    
    // 创建按钮
    UIButton * button = [[UIButton alloc] init];
    
    /**
     
     typedef NS_OPTIONS(NSUInteger, UIControlState) {
     UIControlStateNormal       = 0,
     UIControlStateHighlighted  = 1 << 0,                  // used when UIControl isHighlighted is set
     UIControlStateDisabled     = 1 << 1,
     UIControlStateSelected     = 1 << 2,                  // flag usable by app (see below)
     UIControlStateFocused NS_ENUM_AVAILABLE_IOS(9_0) = 1 << 3, // Applicable only when the screen supports focus
     UIControlStateApplication  = 0x00FF0000,              // additional flags available for application use
     UIControlStateReserved     = 0xFF000000               // flags reserved for internal framework use
     };
     
     */
    
    // 设置按钮标题
    [button setTitle:title forState:UIControlStateNormal];
    
    // 设置按钮标题标题文字的字体
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    
    // 设置按钮文字颜色(按钮默认颜色是白色)
    [button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    
    // 设置按钮的标签：使用标签视图子控件的个数当作按钮标签的值。
    button.tag = _shopTagView.subviews.count;
    
    // 给按钮添加监听事件
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    // 添加到父视图
    [_shopTagView addSubview:button];
    
    // 返回设置好的按钮
    return button;
    
}





#pragma mark - 点击标签栏视图中按钮的监听方法，使滚动页面跟随按钮移动
// 点击标签栏视图中按钮的监听方法，使滚动页面跟随按钮移动
- (void)buttonClick:(UIButton *)button {
    
    // 使用scrollView的setContentOffset:方法动画效果使页面滚动
    [_shopScrollView setContentOffset:CGPointMake(_shopScrollView.bounds.size.width * button.tag, 0) animated:YES];


}





#pragma mark - 设置滚动视图
// 设置标签栏视图下面的滚动视图
- (void)setupShopScrollView {

    // TODO:1、创建滚动视图
    UIScrollView *shopScrollView = [[UIScrollView alloc] init];
    
    // 设置滚动视图背景颜色
    shopScrollView.backgroundColor = [UIColor orangeColor];
    
    // 设置分页效果
    shopScrollView.pagingEnabled = YES;
    
    // 设置弹簧效果
    shopScrollView.bounces = NO;
    
    // 设置滚动条隐藏
    shopScrollView.showsVerticalScrollIndicator = NO;
    shopScrollView.showsHorizontalScrollIndicator =NO;
    
    
    
    // 添加到父视图
    [self.view addSubview:shopScrollView];
    
    // 设置约束
    [shopScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.bottom.right.offset(0);
        make.top.equalTo(_shopTagView.mas_bottom).offset(0);
        
    }];
    
    

    
    // 2、创建三个子控制器
    
    MeiTuanShopOrderController * shopOrderController = [[MeiTuanShopOrderController alloc] init];
    MeiTuanShopCommentController * shopCommentController = [[MeiTuanShopCommentController alloc] init];
    MeiTuanShopInformationController * shopInformationController = [[MeiTuanShopInformationController alloc] init];
    
    shopOrderController.shopOrderCategoryModelData = _shopOrderCategoryModelArray;
    
    
    // 将创建好的子控制器加入到数组
    NSArray *viewControllerArray = @[shopOrderController,shopCommentController,shopInformationController];
    
    // 把控制器的View添加到ScrollView中
    for (UIViewController * viewController in viewControllerArray) {
        
        // 将子控制器视图加入到shopScrollView中
        [shopScrollView addSubview:viewController.view];
        
        // 将子控制器添加到父控制器中，建立父子控制器关系
        [self addChildViewController:viewController];
        
        // 通知父控制器子控制器已经加入父控制器中
        [viewController didMoveToParentViewController:self];
    }
    
    
    // 给每个View设置约束（由于ScrollView需要确定contentSize，所以约束需要给出四边边距和明确宽高）
    
    [shopScrollView.subviews mas_makeConstraints:^(MASConstraintMaker *make) {
        
        // 顶部底部约束
        make.top.bottom.offset(0);
        
        // 设置宽高
        make.width.height.equalTo(shopScrollView);
        
    }];
    
    // 添加水平轴向约束
    [shopScrollView.subviews mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:0 tailSpacing:0];
    
    // 3、给shopScrollView设置代理
    shopScrollView.delegate = self;
    
    
    // 4、给属性赋值
    _shopScrollView = shopScrollView;
    
}





#pragma mark - scrollView代理方法：监听ScrollView滚动，使标签指示器跟随页面滚动
// scrollView代理方法：监听ScrollView滚动，使标签指示器跟随页面滚动
-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    // 计算当前页数，值为小数
    CGFloat pageNUmber = scrollView.contentOffset.x / scrollView.bounds.size.width;
    
    // 计算标签指示器沿x轴的偏移量
    CGFloat offsetX = _shopTagView.bounds.size.width / (_shopTagView.subviews.count - 1);
    
#warning mark - 控件加了约束后不要修改它的frame，但是可以修改它的transform，因为frame是由bounds，anchorPoint，position来确定的
    // 设置_shopTagIndicatorView的x方向形变
    _shopTagIndicatorView.transform = CGAffineTransformMakeTranslation(offsetX * pageNUmber, 0);

}





#pragma mark - scrollView代理方法：监听ScrollView滚动结束，使当前标签指示器指示的按钮的标题文字变为粗体
// scrollView代理方法：监听ScrollView滚动结束，使当前标签指示器指示的按钮的标题文字变为粗体
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    // 计算当前页数，整数
    NSInteger pageNumber = _shopScrollView.contentOffset.x / _shopScrollView.bounds.size.width;
    
    // 方法一：循环遍历标签栏视图的子视图（按钮+标签栏指示器，不限制取出的子控件类型，取出之后再循环内判断是不是需要的控件）
//    for (NSInteger i = 0; i < _shopTagView.subviews.count; i++) {
//        
//        // 取出与索引相应的按钮
//        UIButton *button = _shopTagView.subviews[i];
//        
//        // 判断button是不是UIButton或者其子类的实例对象
//        if ([button isKindOfClass:[UIButton class]]) {
//            
//            //如果是并且页数和索引相等证明是要找的标签栏按钮
//            if (pageNumber == i) {
//                
//                // 设置标签栏按钮的字体为粗体
//                button.titleLabel.font = [UIFont boldSystemFontOfSize:14];
//            }else {// 如果是并且页数和索引不相等证明不是要找的标签栏按钮
//                
//                // 设置标签栏按钮的字体为系统样式
//                button.titleLabel.font = [UIFont systemFontOfSize:14];
//            
//            }
//        }
//    }
    
    
    // 方法二：循环遍历标签栏视图的子视图（按钮+标签栏指示器，通过限制count，将最后添加的边前栏指示器排除）
    for (NSInteger i = 0; i < _shopTagView.subviews.count - 1; i++) {
        
        // 取出与索引相应的按钮
        UIButton *button = _shopTagView.subviews[i];
        
        //如果页数和索引相等证明是要找的标签栏按钮
        if (pageNumber == i) {
            
            // 设置标签栏按钮的字体为粗体
            button.titleLabel.font = [UIFont boldSystemFontOfSize:14];
        }else {// 如果是并且页数和索引不相等证明不是要找的标签栏按钮
            
            // 设置标签栏按钮的字体为系统样式
            button.titleLabel.font = [UIFont systemFontOfSize:14];
            
        }
    }
}





#pragma mark - scrollView代理方法：监听ScrollView动画滚动结束，使当前标签指示器指示的按钮的标题文字变为粗体
// scrollView代理方法：监听ScrollView动画滚动结束，使当前标签指示器指示的按钮的标题文字变为粗体
-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    
    // 手动调用scrollViewDidEndDecelerating:方法，使当前标签指示器指示的按钮的标题文字变为粗体
    [self scrollViewDidEndDecelerating:scrollView];
}





#pragma mark - 设置导航条
// 设置导航条
- (void)setupNavigationBar {
    
    
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
- (void)panGesture:(UIPanGestureRecognizer *)panGesture {
    
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





#pragma mark - 加载数据
// 加载数据
- (void)loadFoodData {
    
    //  加载JSON文件，找到JSON文件的URL路径，将JSON文件读取成NSData类型的数据
    NSData *data = [NSData dataWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"food.json" withExtension:nil]];
    
    // 将包含JSON文件格式的NSData数据转换成字典
    NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
    // 取出想要的poi_info（头部视图）对应的字典
    NSDictionary *headerViewDict = jsonDict[@"data"][@"poi_info"];
    
    // 字典转模型
    MeiTuanShopHeaderViewModel * headerViewModel = [MeiTuanShopHeaderViewModel shopHeaderViewModelWithDictionary:headerViewDict];
    
    // 给属性赋值
    _headerViewModel = headerViewModel;
    
    
    // TODO:测试代码，打印取出的字典
//    NSLog(@"%@",headerViewModel.poi_back_pic_url);
    
    
    
    /********* 以上处理的是 商家头部模型数据 *********/
    
    
    
    
    
    
    
    /********* 以下处理的是 食物模型数据 *********/
    
    // 取出想要的food_spu_tags（食物分类）对应的数组
    NSArray *shopOrderCategoryData = jsonDict[@"data"][@"food_spu_tags"];
    
    NSMutableArray *shopOrderCategoryModelArray = [NSMutableArray arrayWithCapacity:shopOrderCategoryData.count];
    
    for (NSDictionary *dict in shopOrderCategoryData) {
        
        // 字典转模型
        MeiTuanShopOrderCategoryModel * shopOrderCategoryModel = [MeiTuanShopOrderCategoryModel shopOrderCategoryModelWithDictionary:dict];
        
        
        [shopOrderCategoryModelArray addObject:shopOrderCategoryModel];
    }
    
    // 给属性赋值
    _shopOrderCategoryModelArray = shopOrderCategoryModelArray;
    

}


@end
