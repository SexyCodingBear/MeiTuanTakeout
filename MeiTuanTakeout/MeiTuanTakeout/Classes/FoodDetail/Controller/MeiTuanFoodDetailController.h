//
//  MeiTuanFoodDetailController.h
//  MeiTuanTakeout
//
//  Created by 温岱阳 on 2017/7/31.
//  Copyright © 2017年 DaiyangWen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MeiTuanBaseController.h"
#import "MeiTuanFoodDetailFlowLayout.h"
#import "MeiTuanFoodDetailCell.h"
#import "MeiTuanShopOrderCategoryModel.h"

@interface MeiTuanFoodDetailController : MeiTuanBaseController

// 食物分类模型数据
@property (strong,nonatomic) NSArray <MeiTuanShopOrderCategoryModel *> *shopOrderCategoryModelData;

/// 储存要跳转到的界面的索引值
@property (strong,nonatomic) NSIndexPath *indexPath;


@end
