//
//  MeiTuanShopCarView.m
//  MeiTuanTakeout
//
//  Created by 温岱阳 on 2017/8/6.
//  Copyright © 2017年 DaiyangWen. All rights reserved.
//

#import "MeiTuanShopCarView.h"

@implementation MeiTuanShopCarView

+ (instancetype)shopCarView {

    return [[[UINib nibWithNibName:@"MeiTuanShopCarView" bundle:nil] instantiateWithOwner:nil options:nil] firstObject];


}

@end
