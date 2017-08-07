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

/// 购物车内商品数量显示标签，方便在传递数据的时候更改文本标签是否隐藏的属性
@property (weak, nonatomic) UILabel *foodCountLabel;

@end



@implementation MeiTuanShopCarView


+ (instancetype)shopCarView {

    return [[[UINib nibWithNibName:@"MeiTuanShopCarView" bundle:nil] instantiateWithOwner:nil options:nil] firstObject];


}






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
    
    /// 添加购物车视图购物车中的数量显示标签
#warning mark - 使用图片样式做label的背景色的时候，label中的文字尽量不要给nil，nil会让图片不能自适应大小，导致图片变形，可以传@""字符串
    UILabel *foodCountLabel = [UILabel makeLabelWithTitleColor:[UIColor whiteColor] andFont:[UIFont systemFontOfSize:12] andText:@"0"];
    
    /// 给数量显示标签添加背景图片，使用添加图片样式颜色的方法添加背景图片
    foodCountLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"icon_food_count_bg"]];
    
    /// 添加到父视图
    [self.carButton addSubview:foodCountLabel];
    
    /// 添加约束
    [foodCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.right.offset(0);
        make.width.height.offset(16);
        
    }];
    
    /// 让字体自适应
    /// 解决数字太长（例如99999）只能显示一部分的问题，对齐方式默认为左对齐，需要更改文本标签标题文字水平位置（对齐方式）才能居中。
    foodCountLabel.adjustsFontSizeToFitWidth = YES;
    
    /// 设置文本标签标题文字水平位置：左右居中
    /// 如果要显示的数字特别长,例如999999999，字体自适应和设置文本标签标题文字水平位置之后，基线（底部）会很靠下，为了显示更多的内容，需要让基线居中（字体中心点在中心），要让基线居中需要调整控件的baselineAdjustment属性。
    foodCountLabel.textAlignment = NSTextAlignmentCenter;
    
    /**
     
    // Values for NSTextAlignment
    typedef NS_ENUM(NSInteger, NSTextAlignment) {
        NSTextAlignmentLeft      = 0,    // Visually left aligned
#if TARGET_OS_IPHONE
        NSTextAlignmentCenter    = 1,    // Visually centered
        NSTextAlignmentRight     = 2,    // Visually right aligned
#else // !TARGET_OS_IPHONE
        NSTextAlignmentRight     = 1,    // Visually right aligned
        NSTextAlignmentCenter    = 2,    // Visually centered
#endif
        NSTextAlignmentJustified = 3,    // Fully-justified. The last line in a paragraph is natural-aligned.
        NSTextAlignmentNatural   = 4,    // Indicates the default alignment for script
    } NS_ENUM_AVAILABLE_IOS(6_0);
     
     */
    
    
    /// 设置基线位置：上下居中
    
    foodCountLabel.baselineAdjustment = UIBaselineAdjustmentAlignCenters;
    
    /**
     
     typedef NS_ENUM(NSInteger, UIBaselineAdjustment) {
     UIBaselineAdjustmentAlignBaselines = 0, // default. used when shrinking text to position based on the original baseline
     UIBaselineAdjustmentAlignCenters,
     UIBaselineAdjustmentNone,
     };
     
     */
    
    /// 设置技术控件是否隐藏的属性（隐藏）
    foodCountLabel.hidden = YES;
    
    /// 给属性赋值,方便在传递数据的时候更改文本标签是否隐藏的属性
    _foodCountLabel = foodCountLabel;
    
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
    _pleaseAddButton.backgroundColor = shopCarModel.foodModelArray.count ? [UIColor primaryColor] : [UIColor lightGrayColor];
    
    /// 设置购物车内商品数量文本标签是否隐藏:根据传入的数据（模型数组长度）判断购物车内商品数量文本标签是否隐藏（模型数组长度为0时隐藏）
    _foodCountLabel.hidden = (shopCarModel.foodModelArray.count == 0);
    
    /// 设置购物车内商品数量文本标签的文本
    _foodCountLabel.text = @(shopCarModel.foodModelArray.count).description;
    
}

@end
