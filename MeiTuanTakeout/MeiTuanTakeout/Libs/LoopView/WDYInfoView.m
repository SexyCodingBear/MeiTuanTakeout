//
//  WDYInfoView.m
//  MeiTuanTakeout
//
//  Created by 温岱阳 on 2017/8/2.
//  Copyright © 2017年 DaiyangWen. All rights reserved.
//

#import "WDYInfoView.h"

@interface WDYInfoView ()

// 优惠信息图标视图
@property (weak, nonatomic) UIImageView *iconImageView;

// 优惠信息文本标签
@property (weak, nonatomic) UILabel *infoLabel;




@end

@implementation WDYInfoView

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

- (void)setupUI{
    
    
    // TODO:1、创建图标
    UIImageView * iconImageView = [[UIImageView alloc] init];
    
//    iconImageView.backgroundColor = [UIColor whiteColor];
    
    // 添加到父视图
    [self addSubview:iconImageView];
    
    // 添加约束
    [iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.bottom.offset(0);
        make.width.equalTo(iconImageView.mas_height);
        
    }];
    
    // 给属性赋值
    _iconImageView = iconImageView;
    
    // TODO:2、创建优惠信息
    UILabel *infoLabel = [[UILabel alloc] init];
    
    // 设置文本
    infoLabel.text = @"大家都吃吧，不要钱还倒贴钱";
    
    // 设置文本颜色
    infoLabel.textColor = [UIColor whiteColor];
    
    // 设置文本字体
    infoLabel.font = [UIFont systemFontOfSize:12];
    
    // 添加到父视图
    [self addSubview:infoLabel];
    
    // 添加约束
    [infoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(iconImageView.mas_right).offset(8);
        make.centerY.offset(0);
        
    }];
    
    // 给属性赋值
    _infoLabel = infoLabel;
    

}

#pragma mark - 重写模型属性的setter方法
// 重写模型属性的setter方法
- (void)setInfoModel:(WDYInfoModel *)infoModel{
    
    // 给属性赋值
    _infoModel = infoModel;
    
    // 使用第三方框架加载网络图片，自动给imageView中的image属性赋值
    [_iconImageView sd_setImageWithURL:[NSURL URLWithString:infoModel.icon_url]];
    NSLog(@"%@",_iconImageView.image);
    
    // 给_infoLabel中的text属性赋值
    _infoLabel.text = infoModel.info;
    

}



@end
