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
    UIView *loopView = [[UIView alloc] init];
    
    // 设置背景颜色
    loopView.backgroundColor = [UIColor yellowColor];
    
    // 添加到父视图
    [self addSubview:loopView];
    
    // 添加约束
    [loopView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.offset(16);
        make.bottom.offset(-8);
        make.right.offset(-16);
        make.height.offset(20);
        
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
        
        make.left.equalTo(loopView.mas_left).offset(0);
        make.bottom.equalTo(loopView.mas_top).offset(-8);
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

}

#pragma mark - 重写模型属性的setter方法
// 重写模型属性的setter方法
-(void)setHeaderViewModel:(MeiTuanShopHeaderViewModel *)headerViewModel{
    
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
    
     
}



@end