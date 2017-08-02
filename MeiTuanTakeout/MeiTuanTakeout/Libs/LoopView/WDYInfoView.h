//
//  WDYInfoView.h
//  MeiTuanTakeout
//
//  Created by 温岱阳 on 2017/8/2.
//  Copyright © 2017年 DaiyangWen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WDYInfoModel.h"

@interface WDYInfoView : UIView

// 将信息模型声明为属性方便数据传递
@property (strong,nonatomic) WDYInfoModel *infoModel;

@end
