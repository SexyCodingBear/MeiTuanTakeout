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


// 声明状态栏样式属性，用来保存每次调用setStatusBarStyle:方法所获得的状态栏样式，因为每次更改状态栏样式都要执行preferredStatusBarStyle方法来设置并显示状态栏样式，在preferredStatusBarStyle方法中通过self.statusBarStyle方法获取状态栏样式
@property (assign,nonatomic) UIStatusBarStyle statusBarStyle;


@end
