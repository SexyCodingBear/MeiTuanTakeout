//
//  MeiTuanShopOrderFoodModel.h
//  MeiTuanTakeout
//
//  Created by 温岱阳 on 2017/8/3.
//  Copyright © 2017年 DaiyangWen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MeiTuanShopOrderFoodModel : NSObject

// 食物名称
@property (copy,nonatomic) NSString *name;




// 字典转模型方法
+ (instancetype)shopOrderFoodModelWithDictionary:(NSDictionary *)dict;



@end
