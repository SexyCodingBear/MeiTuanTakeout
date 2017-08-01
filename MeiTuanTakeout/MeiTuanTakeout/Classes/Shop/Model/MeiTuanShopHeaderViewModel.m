//
//  MeiTuanShopHeaderViewModel.m
//  MeiTuanTakeout
//
//  Created by 温岱阳 on 2017/8/1.
//  Copyright © 2017年 DaiyangWen. All rights reserved.
//

#import "MeiTuanShopHeaderViewModel.h"

@implementation MeiTuanShopHeaderViewModel

+ (instancetype)shopHeaderViewModelWithDictionary:(NSDictionary *)dict{

    id obj = [[self alloc] init];
    
    [obj setValuesForKeysWithDictionary:dict];

    return obj;

}

// 重写setValue: forUndefinedKey:方法可以解决模型中属性少于字典中的key时，kvc方法报错的问题
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{

    

}


@end
