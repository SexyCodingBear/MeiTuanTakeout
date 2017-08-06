//
//  MeiTuanShopCarModel.m
//  MeiTuanTakeout
//
//  Created by 温岱阳 on 2017/8/7.
//  Copyright © 2017年 DaiyangWen. All rights reserved.
//

#import "MeiTuanShopCarModel.h"

@implementation MeiTuanShopCarModel

#pragma mark - 懒加载创建保存食物模型的数组
/// 懒加载创建保存食物模型的数组,给模型中的属性进行实例化
-(NSMutableArray<MeiTuanShopOrderFoodModel *> *)foodModelArray {

    if (_foodModelArray == nil) {
        
        _foodModelArray = [NSMutableArray array];
    }
    
    return _foodModelArray;

}

@end
