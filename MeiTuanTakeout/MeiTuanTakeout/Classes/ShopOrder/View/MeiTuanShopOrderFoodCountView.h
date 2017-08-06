//
//  MeiTuanShopOrderFoodCountView.h
//  MeiTuanTakeout
//
//  Created by 温岱阳 on 2017/8/4.
//  Copyright © 2017年 DaiyangWen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MeiTuanShopOrderFoodModel.h"

/// 设置枚举保存按钮的类型
typedef enum : NSUInteger {
    MeiTuanShopOrderFoodCountViewButtonTypeAdd,
    MeiTuanShopOrderFoodCountViewButtonTypeMinus,
} MeiTuanShopOrderFoodCountViewButtonType;

@class MeiTuanShopOrderFoodCountView;

/// 声明协议
@protocol MeiTuanShopOrderFoodCountViewDelegate <NSObject>

/// 可选实现
@optional

/// 代理方法：计数器值改变的时候
- (void)shopOrderFoodCountViewValueChange:(MeiTuanShopOrderFoodCountView *)countView;

@end




@interface MeiTuanShopOrderFoodCountView : UIView

/// 声明模型变量，传递数据
@property (strong,nonatomic) MeiTuanShopOrderFoodModel *shopOrderFoodModel;

/// 按钮的类型，声明属性记录按钮的类型
@property (assign, nonatomic) MeiTuanShopOrderFoodCountViewButtonType buttonType;

/// 设置代理属性
@property (weak, nonatomic) id <MeiTuanShopOrderFoodCountViewDelegate> delegate;

/**
 类方法创建并实例化xib视图

 @return 创建完成的xib视图
 */
+ (instancetype)shopOrderFoodCountView;

@end
