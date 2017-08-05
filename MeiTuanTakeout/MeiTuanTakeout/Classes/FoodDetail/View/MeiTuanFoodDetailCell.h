//
//  MeiTuanFoodDetailCell.h
//  MeiTuanTakeout
//
//  Created by 温岱阳 on 2017/8/5.
//  Copyright © 2017年 DaiyangWen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MeiTuanShopOrderFoodModel.h"

@interface MeiTuanFoodDetailCell : UICollectionViewCell

/// 声明食物列表模型，便于传递数据
@property (strong,nonatomic) MeiTuanShopOrderFoodModel *shopOrderFoodModel;

@end
