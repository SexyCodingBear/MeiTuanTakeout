//
//  WDYInfoLoopView.h
//  MeiTuanTakeout
//
//  Created by 温岱阳 on 2017/8/2.
//  Copyright © 2017年 DaiyangWen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WDYInfoView.h"
#import "WDYInfoModel.h"

@interface WDYInfoLoopView : UIView

// 折扣信息数组(带有范型)
@property (strong,nonatomic) NSArray<WDYInfoModel *> *discounts;

@end
