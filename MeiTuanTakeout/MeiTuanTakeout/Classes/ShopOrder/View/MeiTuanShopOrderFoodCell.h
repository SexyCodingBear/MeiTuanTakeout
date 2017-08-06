//
//  MeiTuanShopOrderFoodCell.h
//  MeiTuanTakeout
//
//  Created by 温岱阳 on 2017/8/4.
//  Copyright © 2017年 DaiyangWen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MeiTuanShopOrderFoodModel.h"
#import "MeiTuanShopOrderFoodCountView.h"

@interface MeiTuanShopOrderFoodCell : UITableViewCell

/// 声明食物模型变量，传递数据
@property (strong,nonatomic) MeiTuanShopOrderFoodModel *shopOrderFoodModel;

/// 食物选购数量计数器视图
@property (weak, nonatomic) MeiTuanShopOrderFoodCountView * foodCountView;



@end
