//
//  MeiTuanShopOrderFoodCountView.h
//  MeiTuanTakeout
//
//  Created by 温岱阳 on 2017/8/4.
//  Copyright © 2017年 DaiyangWen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MeiTuanShopOrderFoodModel.h"

@interface MeiTuanShopOrderFoodCountView : UIView

/// 声明模型变量，传递数据
@property (strong,nonatomic) MeiTuanShopOrderFoodModel *shopOrderFoodModel;



/**
 类方法创建并实例化xib视图

 @return 创建完成的xib视图
 */
+ (instancetype)shopOrderFoodCountView;

@end
