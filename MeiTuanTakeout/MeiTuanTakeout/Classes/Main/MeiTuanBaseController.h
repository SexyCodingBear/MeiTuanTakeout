//
//  MeiTuanBaseController.h
//  MeiTuanTakeout
//
//  Created by 温岱阳 on 2017/7/31.
//  Copyright © 2017年 DaiyangWen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MeiTuanNavigationBar.h"
#import "Masonry.h"

@interface MeiTuanBaseController : UIViewController

// 导航条和item不能和系统的重名，所以要使用别的名称

// 导航条
@property (strong,nonatomic) MeiTuanNavigationBar *meiTuanNavigationBar;

// 导航条上的标题按钮
@property (strong,nonatomic) UINavigationItem *meiTuanNavigationItem;


// 状态栏样式
@property (assign,nonatomic) UIStatusBarStyle statusBarStyle;

@end
