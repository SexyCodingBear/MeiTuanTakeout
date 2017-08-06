//
//  MeiTuanShopCarModel.h
//  MeiTuanTakeout
//
//  Created by 温岱阳 on 2017/8/7.
//  Copyright © 2017年 DaiyangWen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MeiTuanShopOrderFoodModel.h"

@interface MeiTuanShopCarModel : NSObject


/// 保存所有选购的食物的模型
@property (strong,nonatomic) NSMutableArray <MeiTuanShopOrderFoodModel *>*foodModelArray;

@end
