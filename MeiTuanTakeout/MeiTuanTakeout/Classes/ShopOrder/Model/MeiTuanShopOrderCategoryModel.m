//
//  MeiTuanShopOrderCategoryModel.m
//  MeiTuanTakeout
//
//  Created by 温岱阳 on 2017/8/3.
//  Copyright © 2017年 DaiyangWen. All rights reserved.
//

#import "MeiTuanShopOrderCategoryModel.h"

@implementation MeiTuanShopOrderCategoryModel

+ (instancetype)shopOrderCategoryModelWithDictionary:(NSDictionary *)dict {

    id obj = [[self alloc] init];
    
    // kvc赋值
    [obj setValuesForKeysWithDictionary:dict];

    return obj;

}




// 想要字典转模型的时候得到的spus数组中为转换好的模型，需要重写setValue： forKey：方法，在方法中判断key是不是spus，如果是将其转换成MeiTuanShopOrderFoodModel类型的模型
-(void)setValue:(id)value forKey:(NSString *)key {

    // 先掉用父类的setValue: forKey:方法赋值，父类的KVC方法没有被更改过会给所有的key赋值，当赋完值以后，
    [super setValue:value forKey:key];
    
    // 调用子类的setValue: forKey:方法，会遍历所有值，当找到key：@"spus"时，执行以下操作：
    if ([key isEqualToString:@"spus"]) {
        
        
        NSMutableArray * foodModelArray = [NSMutableArray arrayWithCapacity:[value count]];
        
        
        for (NSDictionary *foodDict in value) {
            
            // 字典转模型
            MeiTuanShopOrderFoodModel * foodModel = [MeiTuanShopOrderFoodModel shopOrderFoodModelWithDictionary:foodDict];
            
            [foodModelArray addObject:foodModel];
            
        }
        
        // 赋值给属性
        _spus = foodModelArray;
        
    }

}




// 重写setValue: forUndefinedKey:方法可以解决模型中属性少于字典中的key时，kvc方法报错的问题
-(void)setValue:(id)value forUndefinedKey:(NSString *)key {



}



@end
