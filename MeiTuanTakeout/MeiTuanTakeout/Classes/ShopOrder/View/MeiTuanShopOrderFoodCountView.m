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
    
    /// 给属性赋值
    _buttonType = MeiTuanShopOrderFoodCountViewButtonTypeMinus;
    
    /// 判断代理对象是否实现了代理方法
    /**
     判断委托者行为有两种方法：
     1、把行为对象通过参数传递过去，在代理方法中判断参数的类型
     2、定义枚举，判断委托者自身的属性来确定行为种类
     
     */
    if ([self.delegate respondsToSelector:@selector(shopOrderFoodCountViewValueChange:)]) {
        
        /// 如果实现了代理方法就调用代理方法
        [self.delegate shopOrderFoodCountViewValueChange:self];
    }
    
    
    
}





/**
 加号按钮点击事件
 */
- (IBAction)addButtonClick {
    
    /// 模型中的计数器自增
    _shopOrderFoodModel.count++;
    
    /// 更新控件状态
    [self updateState];
    
    /// 给属性赋值
    _buttonType = MeiTuanShopOrderFoodCountViewButtonTypeAdd;
    
    
    /// 判断代理对象是否实现了代理方法
    /**
     判断委托者行为有两种方法：
     1、把行为对象通过参数传递过去，在代理方法中判断参数的类型
     2、定义枚举，判断委托者自身的属性来确定行为种类
     
     */
    if ([self.delegate respondsToSelector:@selector(shopOrderFoodCountViewValueChange:)]) {
        
        /// 如果实现了代理方法就调用代理方法
        [self.delegate shopOrderFoodCountViewValueChange:self];
    }
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
    
    
    /**
     
     注意：不可以在这里设置代理，初始化的时候会调用，赋值的时候也会调用，会不停地调用，不能因为加号和减号都要调用这个方法就把代理赋值放在这里。
     
     */
    
}




/// 重写模型属性的setter方法，在赋值时更新数据。如果不更新，重用cell时，cell中的其他数据都更新了（因为重写了cell中模型属性的setter方法，对cell中的属性重新赋值），但是计数器中的_minusButton.hidden，_countLabel.hidden，_countLabel.text,中保存的还是上一次的值，就会显示上一次的状态，所以要重写模型属性的setter方法，在赋值时，更新属性的状态。
- (void)setShopOrderFoodModel:(MeiTuanShopOrderFoodModel *)shopOrderFoodModel {

    /// 给模型赋值
    _shopOrderFoodModel = shopOrderFoodModel;
    
    /// 更新控件状态
    [self updateState];

    
}



@end
