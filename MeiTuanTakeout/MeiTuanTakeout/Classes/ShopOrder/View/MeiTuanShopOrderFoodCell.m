//
//  MeiTuanShopOrderFoodCell.m
//  MeiTuanTakeout
//
//  Created by 温岱阳 on 2017/8/4.
//  Copyright © 2017年 DaiyangWen. All rights reserved.
//

#import "MeiTuanShopOrderFoodCell.h"

@interface MeiTuanShopOrderFoodCell ()

/// 食物配图
@property (weak, nonatomic) IBOutlet UIImageView *pictureView;

/// 食物名称
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

/// 食物描述
@property (weak, nonatomic) IBOutlet UILabel *foodDescriptionLabel;

/// 月售
@property (weak, nonatomic) IBOutlet UILabel *month_saled_contentLabel;

/// 赞
@property (weak, nonatomic) IBOutlet UILabel *praise_contentLabel;

/// 价格
@property (weak, nonatomic) IBOutlet UILabel *min_priceLabel;

/// 食物描述的顶部约束
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *foodDescriptionTopConstraint;




@end


@implementation MeiTuanShopOrderFoodCell

-(void)setShopOrderFoodModel:(MeiTuanShopOrderFoodModel *)shopOrderFoodModel {

    /// 给模型属性赋值
    _shopOrderFoodModel = shopOrderFoodModel;

    /// 食物配图
    [_pictureView sd_setImageWithURL:[NSURL URLWithString:[shopOrderFoodModel.picture stringByDeletingPathExtension]] placeholderImage:[UIImage imageNamed:@"img_food_loading"]];
    
    /// 食物名称
    _nameLabel.text = shopOrderFoodModel.name;
    
    /// 食物描述
    _foodDescriptionLabel.text = shopOrderFoodModel.foodDescription;
    
    /// 月售
    _month_saled_contentLabel.text = shopOrderFoodModel.month_saled_content;
    
    /// 赞
    _praise_contentLabel.text = shopOrderFoodModel.praise_content;
    
    /// 价格：double类型的小数转换成NSString类型在ios下面输出显示会出问题，转换之后的数丢失精度，在小数点后几位有差别。也就是说转换之后变成了另一个数。如果先将double类型转换成float类型在模型中保存，在输出的时候在包装成NSNumber类型输出就没有问题。包装成NSNumber类型是因为，模型中有好多数字（1.2，2.34，3.456），每一个小数点后面的位数都可能不一样，如果直接输出float，无法确定小数点后输出多少位。如果转换成NSNumber，系统会自动保留位数，直接输出即可。
    _min_priceLabel.text = [NSString stringWithFormat:@"¥ %@",@(shopOrderFoodModel.min_price)];
    
    /// 更改食物描述的顶部约束的常量属性，当foodDescription字符串的长度不为0时（有描述文字时），约束为8；长度为0时（没有描述文字时），约束为0。
    /// stringByReplacingOccurrencesOfString:(NSString *)target withString:(NSString *)replacement方法，把target替换成replacement，去除字符串中的空格
    _foodDescriptionTopConstraint.constant = ([shopOrderFoodModel.foodDescription stringByReplacingOccurrencesOfString:@" " withString:@""].length) ? 8:0;
}

@end
