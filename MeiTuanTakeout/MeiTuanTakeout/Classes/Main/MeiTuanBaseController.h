//
//  MeiTuanBaseController.h
//  MeiTuanTakeout
//
//  Created by 温岱阳 on 2017/7/31.
//  Copyright © 2017年 DaiyangWen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"

@interface MeiTuanBaseController : UIViewController

// 导航条和item不能和系统的重名，所以要使用别的名称

// 导航条
@property (strong,nonatomic) UINavigationBar *meiTuanNavigationBar;

// 导航条上的标题按钮
@property (strong,nonatomic) UINavigationItem *meiTuanNavigationItem;


@end
