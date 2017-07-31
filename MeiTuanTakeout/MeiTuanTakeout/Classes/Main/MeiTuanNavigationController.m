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
        
        NSLog(@"%@",viewController.navigationItem);
        
        
    }

}

// 左侧返回按钮
- (void)backBarButtomClick{
    
    // 返回到上一个视图
    [self popViewControllerAnimated:YES];
    
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
