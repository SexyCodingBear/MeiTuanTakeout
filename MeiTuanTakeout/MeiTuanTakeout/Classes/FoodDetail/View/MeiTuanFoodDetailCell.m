//
//  MeiTuanFoodDetailCell.m
//  MeiTuanTakeout
//
//  Created by 温岱阳 on 2017/8/5.
//  Copyright © 2017年 DaiyangWen. All rights reserved.
//

#import "MeiTuanFoodDetailCell.h"

@interface MeiTuanFoodDetailCell () <UIScrollViewDelegate>

/// 食物配图
@property (weak, nonatomic) IBOutlet UIImageView *pictureImageView;

/// 食物名称
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

/// 月售
@property (weak, nonatomic) IBOutlet UILabel *month_saled_contentLabel;

/// 价格
@property (weak, nonatomic) IBOutlet UILabel *min_priceLabel;

/// 食物描述
@property (weak, nonatomic) IBOutlet UILabel *foodDescriptionLabel;

/// 好评度百分比
@property (weak, nonatomic) IBOutlet UILabel *percentageLabel;

/// 进度值
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;

/// 滚动视图
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

/// 商品信息
@property (weak, nonatomic) IBOutlet UILabel *shopInfoLabel;

/// 商品评论顶部的约束
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *shopCommentTopConstraint;





@end

@implementation MeiTuanFoodDetailCell

// xib或者storyboard创建的视图加载完成会调用awakeFromNib方法
-(void)awakeFromNib {
    
    [super awakeFromNib];
    
    [self setupUI];
}

// 代码创建的视图初始化方法
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self setupUI];
    }
    
    return self;
}






// 搭建界面
- (void)setupUI{
    
    /// 给scrollView设置代理
    _scrollView.delegate = self;
    
}





#pragma mark - 代理方法
/// 滚动时调用
-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    /// 获取偏移量
    CGFloat offsetY = scrollView.contentOffset.y;
    
    /// 如果偏移量为负，证明向下拖拽视图，放大图片
    if (offsetY < 0) {
        
        /// 是用线性方程计算公式（分类中）计算放大倍数
        CGFloat scale = [@(offsetY) resultWithValue1:WDYValueMake(0, 1) andValue2:WDYValueMake(-240, 2)];
        
        /// 使用计算的放大倍数放大图片，并且使图片向上平移，
//        _pictureImageView.transform = CGAffineTransformMakeScale(scale, scale);
        /// 声明并赋初值
        CGAffineTransform transform = CGAffineTransformIdentity;
        
        
        /// 平移必须放在放大之前。放大时，从中心放大，Y向下移动100，上边界向上走50，下边界向下走50,
        transform = CGAffineTransformTranslate(transform, 0, offsetY * 0.5);
        
        transform = CGAffineTransformScale(transform, scale, scale);
        
        
        
        _pictureImageView.transform = transform;
        
    }else {/// 防止猛地向上推，导致offsetY变成正数，但是放大效果还在，如果offsetY变成正数，要在else中作处理
    
    
    
        _pictureImageView.transform = CGAffineTransformIdentity;
    
    }
    
}





/// 重写模型属性的setter方法，传递数据，给属性赋值
-(void)setShopOrderFoodModel:(MeiTuanShopOrderFoodModel *)shopOrderFoodModel {
    
    /// 给模型属性赋值
    _shopOrderFoodModel = shopOrderFoodModel;
    
    /// 设置食物配图
    [_pictureImageView sd_setImageWithURL:[NSURL URLWithString:[_shopOrderFoodModel.picture stringByDeletingPathExtension]]];
    
    /// 设置食物名称
    _nameLabel.text = _shopOrderFoodModel.name;
    
    /// 设置月售
    _month_saled_contentLabel.text = _shopOrderFoodModel.month_saled_content;
    
    /// 设置价格
    _min_priceLabel.text = [NSString stringWithFormat:@"%@%%",@(_shopOrderFoodModel.min_price).description];
    
    /// 设置食物描述
    _foodDescriptionLabel.text = shopOrderFoodModel.foodDescription;
    
    CGFloat percentage = 0;
    
    /// 如果好评有值才计算好评度
    if (_shopOrderFoodModel.praise_num) {
        
        /// 计算好评度
        percentage = _shopOrderFoodModel.praise_num / (_shopOrderFoodModel.praise_num + _shopOrderFoodModel.tread_num);
        
    }
    
    
    
    /// 设置好评度百分比
    _percentageLabel.text = [NSString stringWithFormat:@"%.f%%",percentage * 100];
    
    /// 设置进度值
    _progressView.progress = percentage;
    
    /// 是否有食物详情
    BOOL isDescContent = [_shopOrderFoodModel.foodDescription stringByReplacingOccurrencesOfString:@" " withString:@""].length;
    
    /// 设置商品信息文本标签是否隐藏
    _shopInfoLabel.hidden = !isDescContent;
    
    /// 更改约束
    _shopCommentTopConstraint.constant = (isDescContent == YES) ? 8 : -24;

}

@end
