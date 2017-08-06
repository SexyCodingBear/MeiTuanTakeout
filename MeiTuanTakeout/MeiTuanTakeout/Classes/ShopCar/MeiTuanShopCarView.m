//
//  MeiTuanShopCarView.m
//  MeiTuanTakeout
//
//  Created by 温岱阳 on 2017/8/6.
//  Copyright © 2017年 DaiyangWen. All rights reserved.
//

#import "MeiTuanShopCarView.h"

@interface MeiTuanShopCarView ()


/// 购物车按钮
@property (weak, nonatomic) IBOutlet UIButton *carButton;

/// 总价格文本标签
@property (weak, nonatomic) IBOutlet UILabel *sumOfPriceLabel;

/// 请添加按钮
@property (weak, nonatomic) IBOutlet UIButton *pleaseAddButton;



@end



@implementation MeiTuanShopCarView

+ (instancetype)shopCarView {

    return [[[UINib nibWithNibName:@"MeiTuanShopCarView" bundle:nil] instantiateWithOwner:nil options:nil] firstObject];


}



/// 重写模型的strer方法，给属性赋值
- (void)setShopCarModel:(MeiTuanShopCarModel *)shopCarModel {
    
    
    /// 给属性赋值
    _shopCarModel =shopCarModel;
    
    
    /// TODO:1、设置总价格文本标签
    /// kvc计算价格总数,也可以使用For循环
    NSNumber *sumOfPrice = [shopCarModel.foodModelArray valueForKeyPath:@"@sum.min_price"];
    
    /// 显示总价格
    _sumOfPriceLabel.text = [NSString stringWithFormat:@"¥ %@",sumOfPrice];
    
    
    
    
    /// TODO:2、设置购物车按钮图片
    
    // 当按钮设置为选中状态时再点击会看到按钮的默认状态
//    _carBtn.selected = shopCarModel.foodModelArray.count;
    
    /// 判断数组的长度来决定使用哪张图片
    UIImage *image = [UIImage imageNamed:(shopCarModel.foodModelArray.count ? @"button_shoppingCart_noEmpty" : @"button_shoppingCart_empty")];
    
    /// 更换按钮图片
    [_carButton setImage:image forState:UIControlStateNormal];
    
    
    
    /// TODO:3、设置请添加按钮的文字标题
    // 系统样式的按钮在修改里面内容时可能会用动画,如果不想要,就把它改成custom
    
    [_pleaseAddButton setTitle:(shopCarModel.foodModelArray.count ? @"结  账" : @"请添加") forState:UIControlStateNormal];
    
    
    
    /// TODO:4、设置请添加按钮的背景颜色
    /// lightGrayColor的颜色是通过灰度控制的，但是自定义的颜色之后，lightGrayColor的灰度(0.723366)和之前在xib中设置的lightGrayColor的灰度(0.666667)不一样。
    _pleaseAddButton.backgroundColor = _shopCarModel.foodModelArray.count ? [UIColor primaryColor] : [UIColor lightGrayColor];
    
    
    
}

@end
