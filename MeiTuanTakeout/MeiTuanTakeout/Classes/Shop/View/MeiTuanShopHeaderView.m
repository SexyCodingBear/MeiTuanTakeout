//
//  MeiTuanShopHeaderView.m
//  MeiTuanTakeout
//
//  Created by 温岱阳 on 2017/8/1.
//  Copyright © 2017年 DaiyangWen. All rights reserved.
//

#import "MeiTuanShopHeaderView.h"

@interface MeiTuanShopHeaderView ()

// 背景视图
@property (weak, nonatomic) UIImageView *backgroundImageView;

// 创建头像视图
@property (weak, nonatomic) UIImageView *avatarImageView;

// 店名文本标签
@property (weak, nonatomic) UILabel *shopNameLabel;


// 创建商家公告文本标签
@property (weak, nonatomic) UILabel *bulletinLabel;

// 创建轮播视图
@property (weak, nonatomic) WDYInfoLoopView *infoLoopView;

@end


@implementation MeiTuanShopHeaderView

-(void)awakeFromNib {
    [super awakeFromNib];
    
    [self setupUI];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}


#pragma mark - 初始化视图
// 初始化视图
- (void)setupUI {
    
    
    // TODO:1、创建背景视图
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
    
    
    
    // 添加到父视图
    [self addSubview:backgroundImageView];
    
    // 添加约束
    [backgroundImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        
        make.edges.offset(0);
        
        
    }];
    
    // 给属性赋值
    _backgroundImageView = backgroundImageView;
    
    
    
    
    
    
    // TODO:2、轮播视图
    
    // 创建轮播视图
    WDYInfoLoopView *infoLoopView = [[WDYInfoLoopView alloc] init];
    
    // 裁剪超出显示范围区域
    infoLoopView.clipsToBounds =YES;
    
    // 添加到父视图
    [self addSubview:infoLoopView];
    
    // 添加约束
    [infoLoopView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.offset(16);
        make.bottom.offset(-8);
        make.right.offset(-16);
        make.height.offset(20);
        
    }];
    
    // 给属性赋值
    _infoLoopView = infoLoopView;
    
    // 创建箭头视图
    UIImageView *arrowView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_arrow_white"]];
    
    // 添加到父控件
    [infoLoopView addSubview:arrowView];
    
    // 设置约束，因为UIImageView初始化添加图片，图片自适应大小，所以宽高确定，不用给了，确定xy即可，右边约束确定下，中心Y对齐确定y。
    [arrowView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.offset(0);
        make.centerY.offset(0);
        
    }];
    
    
    
    
    
    
    
    
    // TODO:3、设置虚线
    UIView *dashLineView = [[UIView alloc] init];
    
    // 设置背景颜色
    
    // contents拉伸缩放图片
    //    dashLineView.layer.contents = (__bridge id _Nullable)([UIImage dashLineViewWithColor:[UIColor whiteColor]].CGImage);
    
    //colorWithPatternImage:平铺图片
    dashLineView.backgroundColor = [UIColor colorWithPatternImage:[UIImage dashLineViewWithColor:[UIColor whiteColor]]];
    
    
    // 添加到父视图
    [self addSubview:dashLineView];
    
    // 添加约束
    [dashLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(infoLoopView.mas_left).offset(0);
        make.bottom.equalTo(infoLoopView.mas_top).offset(-8);
        make.right.offset(0);
        make.height.offset(1);
        
    }];
    
    
    
    
    
    
    
    // TODO:4、创建头像视图
    UIImageView *avatarImageView = [[UIImageView alloc] init];
    
    // 设置背景颜色
    avatarImageView.backgroundColor = [UIColor lightGrayColor];
    
    // 设置圆角半径
    avatarImageView.layer.cornerRadius = 32;
    
    // 设置切边
    avatarImageView.layer.masksToBounds = YES;
    
    // 设置边框宽度
    avatarImageView.layer.borderWidth = 2;
    
    // 设置边框颜色
    avatarImageView.layer.borderColor = [UIColor colorWithWhite:1 alpha:0.7].CGColor;
    
    // 添加到父视图
    [self addSubview:avatarImageView];
    
    // 添加约束
    [avatarImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        
        make.left.equalTo(dashLineView.mas_left).offset(0);
        make.bottom.equalTo(dashLineView.mas_top).offset(-8);
        make.width.height.offset(64);
        
        
    }];
    
    // 给属性赋值
    _avatarImageView = avatarImageView;
    
    
    
    
    
    
    // TODO:5、创建店名文本标签
    UILabel * shopNameLabel = [UILabel makeLabelWithTitleColor:[UIColor whiteColor] andFont:[UIFont systemFontOfSize:16] andText:@"粮新发现"];
    
    // 添加到父视图
    [self addSubview:shopNameLabel];
    
    // 添加约束
    [shopNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(avatarImageView.mas_right).offset(16);
        make.centerY.equalTo(avatarImageView.mas_centerY).offset(-16);
        
    }];
    
    // 给属性赋值
    _shopNameLabel = shopNameLabel;
    
    
    
    
    
    
    
    // TODO:6、创建商家公告文本标签
    UILabel * bulletinLabel = [UILabel makeLabelWithTitleColor:[UIColor colorWithWhite:1 alpha:0.9] andFont:[UIFont systemFontOfSize:14] andText:@"粮新发现公告粮新发现公告粮新发现公告粮新发现公告粮新发现公告粮新发现公告"];
    
    // 添加到父视图
    [self addSubview:bulletinLabel];
    
    // 添加约束
    [bulletinLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(shopNameLabel.mas_left).offset(0);
        make.right.offset(-16);
        make.centerY.equalTo(avatarImageView.mas_centerY).offset(16);
        
    }];
    
    // 给属性赋值
    _bulletinLabel = bulletinLabel;
    
    
    
    
    
    // 给轮播视图添加点击／轻敲手势
    // 创建点击手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(infoLoopViewClick)];
    
    // 给轮播视图添加手势
    [infoLoopView addGestureRecognizer:tap];
    
    
    // TODO:让线程延迟0秒,可以理解为让线程卡顿一下，由于CPU数度极快，卡顿的时候CPU将其他线程的事情都做完了
    // setupUI在初始化方法中，初始化的时候headerView还没有添加到shopController中，self.viewController（还没有添加到父控制器）还没有值，所以无法调用infoLoopViewClick
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        // TODO:测试代码，让程序启动就modal出商家详情界面
        [self infoLoopViewClick];
        
    });
    
}





#pragma mark - 轮播视图点击方法
// 轮播视图点击方法
- (void)infoLoopViewClick {

    NSLog(@"---------");
    // 使用模态呈现商家详情页面
    // 1、拿到控制器才能modal：两种方法拿到控制器：1、使用代理：声明协议，声明代理对象，给代理对象赋值，代理类遵守协议，实现代理方法，使用代理对象调用代理方法 2、通过响应者链条获取控制器。找到响应者，判断是不是控制器类型，如果是就返回，如果到最后都没找到就返回nil
    
    // 创建商家详情控制器
    MeiTuanShopDetailController *shopDetailController = [[MeiTuanShopDetailController alloc] init];
    
    shopDetailController.headerViewModel = _headerViewModel;
    
    // 使用商家控制器模态出商家详情控制器
    [self.viewController presentViewController:shopDetailController animated:YES completion:nil];

}





#pragma mark - 重写模型属性的setter方法
// 重写模型属性的setter方法
-(void)setHeaderViewModel:(MeiTuanShopHeaderViewModel *)headerViewModel {
    
    // 给属性赋值
    _headerViewModel = headerViewModel;
    
    // TODO:1、设置背景图片
    // 删除模型中提取的URL字符串中的.webp后缀
    NSString *backgroundImageViewURL = [headerViewModel.poi_back_pic_url stringByDeletingPathExtension];
    
    
    /**
     
     在info.plist中添加键值：
     App Transport Security Settings
     在App Transport Security Settings中添加键值：
     Allow Arbitrary Loads
     将值设置成YES
     
     */
    
    // 使用第三方框架加载网络图片，自动给imageView中的image属性赋值
    [_backgroundImageView sd_setImageWithURL:[NSURL URLWithString:backgroundImageViewURL]];
    
    // TODO:2、设置头像
    // 删除模型中提取的URL字符串中的.webp后缀
    NSString *avatarImageViewURL = [headerViewModel.pic_url stringByDeletingPathExtension];
    
    // 使用第三方框架加载网络图片，自动给imageView中的image属性赋值
    [_avatarImageView sd_setImageWithURL:[NSURL URLWithString:avatarImageViewURL]];
    
    // TODO:3、设置店名
    _shopNameLabel.text = _headerViewModel.name;
    
    // TODO:4、设置商家公告
    _bulletinLabel.text = _headerViewModel.bulletin;
    
    
    // TODO:4、设置一个轮播视图的数据
    _infoLoopView.discounts = _headerViewModel.discounts;
    
     
}



@end
