//
//  MeiTuanShopHeaderView.h
//  MeiTuanTakeout
//
//  Created by 温岱阳 on 2017/8/1.
//  Copyright © 2017年 DaiyangWen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WDYInfoLoopView.h"
#import "MeiTuanShopHeaderViewModel.h"
#import "MeiTuanShopDetailController.h"
#import "AnimatorTransitionDelegate.h"

@interface MeiTuanShopHeaderView : UIView

// 声明头部视图模型
@property (strong,nonatomic) MeiTuanShopHeaderViewModel *headerViewModel;



@end
