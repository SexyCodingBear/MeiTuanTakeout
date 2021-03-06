//
//  MeiTuanNavigationController.m
//  MeiTuanTakeout
//
//  Created by 温岱阳 on 2017/7/31.
//  Copyright © 2017年 DaiyangWen. All rights reserved.
//

#import "MeiTuanNavigationController.h"

@interface MeiTuanNavigationController ()

@end

@implementation MeiTuanNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 将导航控制器自带的导航条隐藏掉
    self.navigationBar.hidden = YES;
    
//    // 此方法专门用来隐藏导航条,但此方法会禁用掉导航控制器自带侧滑POP功能
//    [self setNavigationBarHidden:YES];
//    
//    // 此方法专门用来隐藏导航条,但此方法会禁用掉导航控制器自带侧滑POP功能
//    [self setNavigationBarHidden:YES animated:YES];
    
}


#pragma mark - 重写pushViewController:方法
// 将系统的UIViewController *换成MeiTuanBaseController *
-(void)pushViewController:(MeiTuanBaseController *)viewController animated:(BOOL)animated{

    // 调用父类pushViewController:添加根控制器
    [super pushViewController:viewController animated:animated];

    // 如果子控制器个数大于1，证明根控制器已经加入，给根控制器之后的每个控制器的导航条加上返回按钮
    if (self.childViewControllers.count > 1) {
        
        /**
         
         typedef NS_ENUM(NSInteger, UIBarButtonItemStyle) {
         UIBarButtonItemStylePlain,
         UIBarButtonItemStyleBordered NS_ENUM_DEPRECATED_IOS(2_0, 8_0, "Use UIBarButtonItemStylePlain when minimum deployment target is iOS7 or later"),
         UIBarButtonItemStyleDone,
         };
         
         */
        
        // 设置左侧返回按钮，图片、样式、点击方法,注意：使用自定义的meiTuanNavigationItem。
        viewController.meiTuanNavigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"btn_backItem"] style:UIBarButtonItemStylePlain target:self action:@selector(backBarButtomClick)];
        
        // push的时候只创建了viewController，并没有创建View，要现实的时候才创建View，所以此时meiTuanNavigationItem为nil，要想此时meiTuanNavigationItem有值，必须提前调用view或者一创建控制器（初始化的时候）就创建meiTuanNavigationItem，所以在基类中将meiTuanNavigationItem创建放在initWithNibName:初始化方法中。
        NSLog(@"%@",viewController.meiTuanNavigationItem);
        
        
    }

}


#pragma mark - 左侧返回按钮点击方法
// 左侧返回按钮
- (void)backBarButtomClick{
    
    // 返回到上一个视图
    [self popViewControllerAnimated:YES];
    
}


#pragma mark - 状态栏样式权限转换
// 实现此方法让子控制器去设置状态栏的样式
- (UIViewController *)childViewControllerForStatusBarStyle{
    
    // 把设置状态栏的权限交给自己的topViewController
    return self.topViewController;

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
