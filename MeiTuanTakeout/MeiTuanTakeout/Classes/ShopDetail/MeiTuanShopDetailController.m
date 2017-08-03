//
//  MeiTuanShopDetailController.m
//  MeiTuanTakeout
//
//  Created by 温岱阳 on 2017/8/2.
//  Copyright © 2017年 DaiyangWen. All rights reserved.
//

#import "MeiTuanShopDetailController.h"

#define Kmargin 16 //间距

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
    
    // TODO：1、设置背景图片
    // 添加背景图片
    UIImageView *backgroundImageView = [[UIImageView alloc] init];
    
    // 设置图片填充模式，等比例缩放
    backgroundImageView.contentMode = UIViewContentModeScaleAspectFill;
    
    /**
     
     typedef NS_ENUM(NSInteger, UIViewContentMode) {
     UIViewContentModeScaleToFill,
     UIViewContentModeScaleAspectFit,      // contents scaled to fit with fixed aspect. remainder is transparent
     UIViewContentModeScaleAspectFill,     // contents scaled to fill with fixed aspect. some portion of content may be clipped.
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
    
    
    
    
    
    // TODO：2、关闭按钮
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
    
    
    
    
    
    // TODO：3、添加滚动视图
    // 创建滚动视图
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    
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
    
    // 创建滚动视图中的内容视图
    UIView * contentView = [[UIView alloc] init];
    
    // 添加到父视图
    [scrollView addSubview:contentView];
    
    // 添加约束
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.offset(0);
        make.width.equalTo(scrollView);
        make.height.offset(1000);
        
    }];
    
    
    
    
#warning mark - scrollView中的这些子控件都添加到contentView中
    
    // TODO：4、店名文本标签
    UILabel *shopNameLabel = [UILabel makeLabelWithTitleColor:[UIColor whiteColor] andFont:[UIFont systemFontOfSize:14] andText:_headerViewModel.name];
    
    // 添加到父视图
    [contentView addSubview:shopNameLabel];
    
    // 添加约束
    [shopNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.offset(64);
        make.centerX.offset(0);
        
    }];
    
    
    
    
    
    // TODO：5、起送价文本标签
    UILabel *shopTipsLabel = [UILabel makeLabelWithTitleColor:[UIColor colorWithWhite:1 alpha:0.9] andFont:[UIFont systemFontOfSize:12] andText:[NSString stringWithFormat:@"%@ | %@ | %@ ",_headerViewModel.min_price_tip,_headerViewModel.shipping_fee_tip,_headerViewModel.delivery_time_tip]];
    
    // 添加到父视图
    [contentView addSubview:shopTipsLabel];
    
    // 添加约束
    [shopTipsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(shopNameLabel.mas_bottom).offset(Kmargin * 0.5);
        make.centerX.offset(0);
        
    }];
    
    
    
    
    
    
    // TODO：6、折扣信息文本标签
    UILabel *shopDiscountsLabel = [UILabel makeLabelWithTitleColor:[UIColor whiteColor] andFont:[UIFont systemFontOfSize:16] andText:@"折扣信息"];
    
    // 添加到父视图
    [contentView addSubview:shopDiscountsLabel];
    
    // 添加约束
    [shopDiscountsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(shopTipsLabel.mas_bottom).offset(Kmargin * 2.5);
        make.centerX.offset(0);
        
    }];
    
    
    
    
    
    
    // TODO: 7、左侧折扣信息分割线
    UIView * shopDiscountsLineLeftView = [[UIView alloc] init];
    
    shopDiscountsLineLeftView.backgroundColor = [UIColor whiteColor];
    
    [contentView addSubview:shopDiscountsLineLeftView];
    
    [shopDiscountsLineLeftView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.height.offset(1);
        make.left.offset(Kmargin);
        make.right.equalTo(shopDiscountsLabel.mas_left).offset(-Kmargin);
        make.centerY.equalTo(shopDiscountsLabel);
        
    }];
    
    
    
    
    
    // TODO: 8、右侧折扣信息分割线
    UIView * shopDiscountsLineRightView = [[UIView alloc] init];
    
    shopDiscountsLineRightView.backgroundColor = [UIColor whiteColor];
    
    [contentView addSubview:shopDiscountsLineRightView];
    
    [shopDiscountsLineRightView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.height.offset(1);
        make.right.offset(-Kmargin);
        make.left.equalTo(shopDiscountsLabel.mas_right).offset(Kmargin);
        make.centerY.equalTo(shopDiscountsLabel);
        
    }];
    
    
    

}





#pragma mark - 关闭按钮点击方法
// 关闭按钮点击方法
- (void)closeButtonClick {
    
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
