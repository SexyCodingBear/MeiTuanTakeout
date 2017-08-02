//
//  WDYInfoModel.h
//  MeiTuanTakeout
//
//  Created by 温岱阳 on 2017/8/2.
//  Copyright © 2017年 DaiyangWen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WDYInfoModel : NSObject

// 图标地址
@property (copy, nonatomic) NSString *icon_url;

// 优惠信息
@property (copy, nonatomic) NSString *info;


// 字典转模型方法
+ (instancetype)infoModelWithDictionary:(NSDictionary *)dict;

@end
