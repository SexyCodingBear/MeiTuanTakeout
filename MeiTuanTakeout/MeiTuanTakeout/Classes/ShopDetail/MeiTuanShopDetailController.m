//
//  MeiTuanShopDetailController.m
//  MeiTuanTakeout
//
//  Created by 温岱阳 on 2017/8/2.
//  Copyright © 2017年 DaiyangWen. All rights reserved.
//

#import "MeiTuanShopDetailController.h"

#define Kmargin 16 //间距


// 写MeiTuanScrollView继承自UIScrollView
@interface MeiTuanScrollView : UIScrollView

@end


@implementation MeiTuanScrollView

// 触摸方法：触摸结束，将手指抬起时关闭商家控制器
// 由于scrollView添加了pinch和pan手势，没有tap手势，没有touchEnd方法，这样就会屏蔽scrollView区域的触摸监听事件，所以在自定义的scrollView中重写此方法
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    // 动画方式关闭商家控制器,必须控制器调用，所以使用自己写的分类UIView+Addition中的viewController方法，找到当前控制器
    [self.viewController dismissViewControllerAnimated:YES completion:nil];
    
    
}

@end






@interface MeiTuanShopDetailController ()

@end


@implementation MeiTuanShopDetailController

- (void)viewDidLoad {
    
    
    [super viewDidLoad];
    
    // 添加背景颜色
    self.view.backgroundColor = [UIColor orangeColor];
    
    // 设置视图
    [self setupUI];
    
}






- (void)setupUI {
    
    // TODO:1、设置背景图片
    // 添加背景图片
    UIImageView *backgroundImageView = [[UIImageView alloc] init];
    
    // 设置图片填充模式，等比例缩放
    backgroundImageView.contentMode = UIViewContentModeScaleAspectFill;
    
    /**
     
     typedef NS_ENUM(NSInteger, UIViewContentMode) {
     UIViewContentModeScaleToFill,
     UIViewContentModeScaleAspectFit,      // contents scaled to fit with fixed aspect. remainder is transparent保证图片不变形。但是不能完全填充
     UIViewContentModeScaleAspectFill,     // contents scaled to fill with fixed aspect. some portion of content may be clipped.保证图片不变形且完全填充，但是会有超出部分，需要裁减掉。
     UIViewContentModeRedraw,              // redraw on bounds change (calls -setNeedsDisplay)
     UIViewContentModeCenter,              // contents remain same size. positioned adjusted.
     UIViewContentModeTop,
     UIViewContentModeBottom,
     UIViewContentModeLeft,
     UIViewContentModeRight,
     UIViewContentModeTopLeft,
     UIViewContentModeTopRight,
     UIViewContentModeBottomLeft,
     UIViewContentModeBottomRight,
     };
     
     */
    
    // 删除模型中提取的URL字符串中的.webp后缀
    NSString *backgroundImageViewURL = [_headerViewModel.poi_back_pic_url stringByDeletingPathExtension];
    
    
    /**
     
     在info.plist中添加键值：
     App Transport Security Settings
     在App Transport Security Settings中添加键值：
     Allow Arbitrary Loads
     将值设置成YES
     
     */
    
    // 使用第三方框架加载网络图片，自动给imageView中的image属性赋值
    [backgroundImageView sd_setImageWithURL:[NSURL URLWithString:backgroundImageViewURL]];
    
    // 添加到父视图
    [self.view addSubview:backgroundImageView];
    
    // 添加约束
    [backgroundImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.offset(0);
        
    }];
    
    
    
    
    
    // TODO:2、关闭按钮
    // 创建关闭按钮
    UIButton * closeButton = [[UIButton alloc] init];
    
    
    // 设置按钮的图片
    [closeButton setImage:[UIImage imageNamed:@"btn_close_normal"] forState:UIControlStateNormal];
    
    [closeButton setImage:[UIImage imageNamed:@"btn_close_normal"] forState:UIControlStateHighlighted];
    
    
    // 添加到父视图
    [self.view addSubview:closeButton];
    
    // 添加约束
    [closeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.offset(0);
        make.bottom.offset(-60);
        
    }];

    // 给按钮添加监听事件
    [closeButton addTarget:self action:@selector(closeButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
    
    // TODO:3、添加滚动视图
    // 创建滚动视图，MeiTuanScrollView写在本类里，不需要引入头文件
    MeiTuanScrollView *scrollView = [[MeiTuanScrollView alloc] init];
    
    // 添加到父视图
    [self.view addSubview:scrollView];
    
    // 添加约束
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.right.offset(0);
        make.bottom.equalTo(closeButton.mas_top).offset(-60);
        
    }];
    
    /**
     
     UISCrollView上加控件由于要计算contentSize必须要明确每个控件的宽高，加上UIView只需要明确UIView的宽高就可以了，里面的子控件不是直接加在ScrollView上的，不需要明确宽高。

     
     */
    
    // TODO:3.1 创建滚动视图中的内容视图
    UIView * contentView = [[UIView alloc] init];
    
    // 添加到父视图
    [scrollView addSubview:contentView];
    
    // 添加约束
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.offset(0);
        make.width.equalTo(scrollView);
//        make.height.offset(1000);// 在没有设置最底部控件的底部约束的之前使用，给contentView一个高度。
        
    }];
    
    
    
    
#warning mark - scrollView中的这些子控件都添加到contentView中
    
    // TODO:3.2 店名文本标签
    UILabel *shopNameLabel = [UILabel makeLabelWithTitleColor:[UIColor whiteColor] andFont:[UIFont systemFontOfSize:14] andText:_headerViewModel.name];
    
    // 添加到父视图
    [contentView addSubview:shopNameLabel];
    
    // 添加约束
    [shopNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.offset(64);
        make.centerX.offset(0);
        
    }];
    
    
    
    
    
    // TODO:3.3 起送价文本标签
    UILabel *shopTipsLabel = [UILabel makeLabelWithTitleColor:[UIColor colorWithWhite:1 alpha:0.9] andFont:[UIFont systemFontOfSize:12] andText:[NSString stringWithFormat:@"%@ | %@ | %@ ",_headerViewModel.min_price_tip,_headerViewModel.shipping_fee_tip,_headerViewModel.delivery_time_tip]];
    
    // 添加到父视图
    [contentView addSubview:shopTipsLabel];
    
    // 添加约束
    [shopTipsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(shopNameLabel.mas_bottom).offset(Kmargin * 0.5);
        make.centerX.offset(0);
        
    }];
    
    
    
    
    
    
    // TODO:3.4 折扣信息文本标签
    UILabel *shopDiscountsLabel = [UILabel makeLabelWithTitleColor:[UIColor whiteColor] andFont:[UIFont systemFontOfSize:16] andText:@"折扣信息"];
    
    // 添加到父视图
    [contentView addSubview:shopDiscountsLabel];
    
    // 添加约束
    [shopDiscountsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(shopTipsLabel.mas_bottom).offset(Kmargin * 2.5);
        make.centerX.offset(0);
        
    }];
    
    
    
    
    
    
    // TODO:3.5 左侧折扣信息分割线
    // 创建视图
    UIView * shopDiscountsLineLeftView = [[UIView alloc] init];
    
    // 设置背景颜色
    shopDiscountsLineLeftView.backgroundColor = [UIColor whiteColor];
    
    // 添加到父视图
    [contentView addSubview:shopDiscountsLineLeftView];
    
    // 添加约束
    [shopDiscountsLineLeftView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.height.offset(1);
        make.left.offset(Kmargin);
        make.right.equalTo(shopDiscountsLabel.mas_left).offset(-Kmargin);
        make.centerY.equalTo(shopDiscountsLabel);
        
    }];
    
    
    
    
    
    // TODO:3.6 右侧折扣信息分割线
    // 创建视图
    UIView * shopDiscountsLineRightView = [[UIView alloc] init];
    
    // 设置背景颜色
    shopDiscountsLineRightView.backgroundColor = [UIColor whiteColor];
    
    // 添加到父视图
    [contentView addSubview:shopDiscountsLineRightView];
    
    // 添加约束
    [shopDiscountsLineRightView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.height.offset(1);
        make.right.offset(-Kmargin);
        make.left.equalTo(shopDiscountsLabel.mas_right).offset(Kmargin);
        make.centerY.equalTo(shopDiscountsLabel);
        
    }];
    
    
    
    
    
    // TODO:3.7 展示商家优惠信息
    // 创建优惠信息
    UIStackView * stackView = [[UIStackView alloc] init];
    
    // 设置轴向
    stackView.axis = UILayoutConstraintAxisVertical;
    
    // 设置控件分布方式：等分填充，每个控件大小一样
    stackView.distribution = UIStackViewDistributionFillEqually;
    
    // 设置每个控件之间的间距
    stackView.spacing = 10;
    
    // 根据优惠信息的模型个数for循环创建infoView
    for (WDYInfoModel *infoModel in _headerViewModel.discounts) {
        
        // 创建一条信息视图
        WDYInfoView *infoView = [[WDYInfoView alloc] init];
        
        // 给信息视图模型赋值
        infoView.infoModel = infoModel;
        
        // addArrangedSubview:将信息视图添加到父视图
        [stackView addArrangedSubview:infoView];
    }
    
    // 添加到父视图
    [contentView addSubview:stackView];
    
    // 添加约束
    [stackView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.offset(Kmargin);
        make.right.offset(-Kmargin);
        make.top.equalTo(shopDiscountsLabel.mas_bottom).offset(Kmargin);
        make.height.offset(30 * _headerViewModel.discounts.count);
        
    }];
    
    
    
    
    // TODO:3.8 公告信息文本标签
    // 创建公告信息文本标签
    UILabel *shopBulletinLabel = [UILabel makeLabelWithTitleColor:[UIColor whiteColor] andFont:[UIFont systemFontOfSize:16] andText:@"公告信息"];
    
    // 添加到父视图
    [contentView addSubview:shopBulletinLabel];
    
    // 添加约束
    [shopBulletinLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(stackView.mas_bottom).offset(Kmargin * 2.5);
        make.centerX.offset(0);
        
    }];
    
    
    
    
    
    
    // TODO:3.9 左侧公告信息分割线
    // 创建视图
    UIView * shopBulletinLineLeftView = [[UIView alloc] init];
    
    // 设置背景颜色
    shopBulletinLineLeftView.backgroundColor = [UIColor whiteColor];
    
    // 添加到父视图
    [contentView addSubview:shopBulletinLineLeftView];
    
    // 添加约束
    [shopBulletinLineLeftView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.height.offset(1);
        make.left.offset(Kmargin);
        make.right.equalTo(shopBulletinLabel.mas_left).offset(-Kmargin);
        make.centerY.equalTo(shopBulletinLabel);
        
    }];
    
    
    
    
    
    // TODO:3.10 右侧公告信息分割线
    // 创建视图
    UIView * shopBulletinLineRightView = [[UIView alloc] init];
    
    // 设置背景颜色
    shopBulletinLineRightView.backgroundColor = [UIColor whiteColor];
    
    // 添加到父视图
    [contentView addSubview:shopBulletinLineRightView];
    
    // 添加约束
    [shopBulletinLineRightView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.height.offset(1);
        make.right.offset(-Kmargin);
        make.left.equalTo(shopBulletinLabel.mas_right).offset(Kmargin);
        make.centerY.equalTo(shopBulletinLabel);
        
    }];
    
    
    
    
    
    
    // TODO:3.11 商家公告文本标签栏
    // 创建公告信息文本标签
    UILabel *shopBulletinInfoLabel = [UILabel makeLabelWithTitleColor:[UIColor colorWithWhite:1 alpha:0.9] andFont:[UIFont systemFontOfSize:12] andText:_headerViewModel.bulletin];
    
    // 设置自动换行
    shopBulletinInfoLabel.numberOfLines = 0;
    
    
    // 添加到父视图
    [contentView addSubview:shopBulletinInfoLabel];
    
    // 添加约束
    [shopBulletinInfoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.offset(Kmargin);
        make.right.offset(-Kmargin);
        make.top.equalTo(shopBulletinLabel.mas_bottom).offset(Kmargin);
        
        // 多给最底部的控件添加一个距离父控件底部的约束 来处理高度 "有点自动计算行的意思"
        make.bottom.offset(-Kmargin);
        
    }];
    
}





#pragma mark - 关闭按钮点击方法
// 关闭按钮点击方法
- (void)closeButtonClick {
    
    // 动画方式关闭商家控制器
    [self dismissViewControllerAnimated:YES completion:nil];
    
}




#pragma mark - 触摸方法
// 触摸方法：触摸结束，将手指抬起时关闭商家控制器
// 由于scrollView添加了pinch和pan手势，没有tap手势，这样就会屏蔽scrollView区域的触摸监听事件，所以此方法只能适用于非scrollView区域
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    // 动画方式关闭商家控制器
    [self dismissViewControllerAnimated:YES completion:nil];


}





#pragma mark - 设置状态栏颜色
// 设置状态栏颜色
- (UIStatusBarStyle)preferredStatusBarStyle {
    
    // 返回亮色状态栏
    return UIStatusBarStyleLightContent;


}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
