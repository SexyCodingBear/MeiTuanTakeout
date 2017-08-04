//
//  MeiTuanShopOrderFoodModel.h
//  MeiTuanTakeout
//
//  Created by 温岱阳 on 2017/8/3.
//  Copyright © 2017年 DaiyangWen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MeiTuanShopOrderFoodModel : NSObject

/// 食物配图
@property (copy,nonatomic) NSString *picture;

/// 食物名称
@property (copy,nonatomic) NSString *name;

/// 食物描述
@property (copy,nonatomic) NSString *foodDescription;

/// 月售
@property (copy,nonatomic) NSString *month_saled_content;

/// 赞
@property (copy,nonatomic) NSString *praise_content;

/// 价格
@property (assign,nonatomic) float min_price;


/// 当前食物的选购数量，每个模型中一个count属性，一个cell对应一个模型，一个cell中有一个计数器，每个计数器对应一个模型中的count属性
@property (assign, nonatomic) NSInteger count;



// 字典转模型方法
+ (instancetype)shopOrderFoodModelWithDictionary:(NSDictionary *)dict;



@end
