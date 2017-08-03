//
//  MeiTuanShopHeaderViewModel.h
//  MeiTuanTakeout
//
//  Created by 温岱阳 on 2017/8/1.
//  Copyright © 2017年 DaiyangWen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WDYInfoModel.h"

@interface MeiTuanShopHeaderViewModel : NSObject

// 头部视图背景图片
#warning mark - KVC要求模型中的属性值和字典中key必须一致！
@property (copy,nonatomic) NSString *poi_back_pic_url;

// 头像视图
@property (copy, nonatomic) NSString *pic_url;

// 店名
@property (copy, nonatomic) NSString *name;


// 商家公告
@property (copy, nonatomic) NSString *bulletin;


// 起送价
@property (nonatomic, copy) NSString *min_price_tip;

// 配送费
@property (nonatomic, copy) NSString *shipping_fee_tip;

// 配送时间
@property (nonatomic, copy) NSString *delivery_time_tip;



// 折扣信息数组(带有范型)
@property (strong,nonatomic) NSArray <WDYInfoModel *>*discounts;

// 字典转模型方法
+ (instancetype)shopHeaderViewModelWithDictionary:(NSDictionary *)dict;

@end
