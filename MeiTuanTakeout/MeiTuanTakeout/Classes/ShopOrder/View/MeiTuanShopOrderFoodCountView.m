//
//  MeiTuanShopOrderFoodCountView.m
//  MeiTuanTakeout
//
//  Created by 温岱阳 on 2017/8/4.
//  Copyright © 2017年 DaiyangWen. All rights reserved.
//

#import "MeiTuanShopOrderFoodCountView.h"

@interface MeiTuanShopOrderFoodCountView ()

/// 减号按钮
@property (weak, nonatomic) IBOutlet UIButton *minusButton;

/// 计数文本标签
@property (weak, nonatomic) IBOutlet UILabel *countLabel;

//@property (assign, nonatomic) NSInteger count;



@end



@implementation MeiTuanShopOrderFoodCountView


+ (instancetype)shopOrderFoodCountView {

    return [[[UINib nibWithNibName:@"MeiTuanShopOrderFoodCountView" bundle:nil] instantiateWithOwner:nil options:nil] firstObject];

}


// xib或者storyboard创建的视图加载完成会调用awakeFromNib方法
-(void)awakeFromNib {
    
    [super awakeFromNib];
    
    /// 初始化视图
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
    
    /// 更新控件状态
    [self updateState];
    
    
}



/**
 减号按钮点击事件
 */
- (IBAction)minusButtonClick {
    
    
    /// 模型中的计数器自减
    _shopOrderFoodModel.count--;
    
    /// 更新控件状态
    [self updateState];
    
}





/**
 加号按钮点击事件
 */
- (IBAction)addButtonClick {
    
    /// 模型中的计数器自增
    _shopOrderFoodModel.count++;
    
    /// 更新控件状态
    [self updateState];
    
}






/**
 更新状态
 */
- (void)updateState {
    
    /// 设置减号按钮的隐藏
    _minusButton.hidden = (_shopOrderFoodModel.count == 0);
    
    /// 设置计数文本标签钮的隐藏
    _countLabel.hidden = (_shopOrderFoodModel.count == 0);
    
    /// 设置计数文本标签的文本
    _countLabel.text = @(_shopOrderFoodModel.count).description;
}




/// 重写模型属性的setter方法，在赋值时更新数据。如果不更新，重用cell时，cell中的其他数据都更新了（因为重写了cell中模型属性的setter方法，对cell中的属性重新赋值），但是计数器中的_minusButton.hidden，_countLabel.hidden，_countLabel.text,中保存的还是上一次的值，就会显示上一次的状态，所以要重写模型属性的setter方法，在赋值时，更新属性的状态。
- (void)setShopOrderFoodModel:(MeiTuanShopOrderFoodModel *)shopOrderFoodModel {

    /// 给模型赋值
    _shopOrderFoodModel = shopOrderFoodModel;
    
    /// 更新控件状态
    [self updateState];


}



@end
