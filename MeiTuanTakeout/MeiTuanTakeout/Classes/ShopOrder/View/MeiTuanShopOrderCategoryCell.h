//
//  MeiTuanShopOrderCategoryCell.h
//  MeiTuanTakeout
//
//  Created by 温岱阳 on 2017/8/3.
//  Copyright © 2017年 DaiyangWen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MeiTuanShopOrderCategoryModel.h"

@interface MeiTuanShopOrderCategoryCell : UITableViewCell

// 声明食物分类模型，便于数据传递
@property (strong,nonatomic) MeiTuanShopOrderCategoryModel *shopOrderCategoryModel;

@end