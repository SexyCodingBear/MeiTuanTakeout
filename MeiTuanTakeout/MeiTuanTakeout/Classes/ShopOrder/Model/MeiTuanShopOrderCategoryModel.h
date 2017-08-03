//
//  MeiTuanShopOrderCategoryModel.h
//  MeiTuanTakeout
//
//  Created by 温岱阳 on 2017/8/3.
//  Copyright © 2017年 DaiyangWen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MeiTuanShopOrderFoodModel.h"

@interface MeiTuanShopOrderCategoryModel : NSObject

// 分类名称
@property (copy,nonatomic) NSString *name;

// 分类中的所有菜品详情
@property (strong,nonatomic) NSMutableArray <MeiTuanShopOrderFoodModel *> *spus;

// 字典转模型方法
+ (instancetype)shopOrderCategoryModelWithDictionary:(NSDictionary *)dict;


@end