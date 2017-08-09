//
//  MeiTuanShopOrderController.h
//  MeiTuanTakeout
//
//  Created by 温岱阳 on 2017/8/1.
//  Copyright © 2017年 DaiyangWen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MeiTuanShopOrderCategoryModel.h"
#import "MeiTuanShopOrderCategoryCell.h"
#import "MeiTuanShopOrderFoodSectionHeaderView.h"
#import "MeiTuanShopOrderFoodCell.h"
#import "MeiTuanShopCarView.h"
#import "MeiTuanShopCarModel.h"
#import "MeiTuanFoodDetailController.h"


@interface MeiTuanShopOrderController : UIViewController

// 食物分类模型数据
@property (strong,nonatomic) NSArray <MeiTuanShopOrderCategoryModel *> *shopOrderCategoryModelData;

/// 将两个表格添加到数组，方便其他类调用
@property (strong,nonatomic) NSArray *tableViews;


@end
