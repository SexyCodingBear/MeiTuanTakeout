//
//  MeiTuanShopOrderController.h
//  MeiTuanTakeout
//
//  Created by 温岱阳 on 2017/8/1.
//  Copyright © 2017年 DaiyangWen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MeiTuanShopOrderCategoryModel.h"

@interface MeiTuanShopOrderController : UIViewController

// 分类模型数据
@property (strong,nonatomic) NSArray <MeiTuanShopOrderCategoryModel *> *shopOrderCategoryModelData;


@end
