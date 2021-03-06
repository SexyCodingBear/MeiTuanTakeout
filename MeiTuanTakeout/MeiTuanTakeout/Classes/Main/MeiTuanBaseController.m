//
//  MeiTuanBaseController.m
//  MeiTuanTakeout
//
//  Created by 温岱阳 on 2017/7/31.
//  Copyright © 2017年 DaiyangWen. All rights reserved.
//

#import "MeiTuanBaseController.h"

@interface MeiTuanBaseController ()


@end



@implementation MeiTuanBaseController

#pragma mark - 重写初始化方法
// push的时候只创建了viewController，并没有创建View，要现实的时候才创建View，所以此时meiTuanNavigationItem为nil，要想此时meiTuanNavigationItem有值，必须提前调用view或者一创建控制器（初始化的时候）就创建meiTuanNavigationItem，所以在基类中将meiTuanNavigationItem创建放在initWithNibName:初始化方法中。

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{

    // 父类初始化
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];

    if (self) {
        
        // 创建导航条
        MeiTuanNavigationBar *navigationBar = [[MeiTuanNavigationBar alloc] init];
        
        // 创建导航条上的属性
        UINavigationItem *navigationItem = [[UINavigationItem alloc] init];
        
        // 将navigationItem设置给navigationBar
        [navigationBar setItems:@[navigationItem]];
        
        
        // 给属性赋值
        _meiTuanNavigationBar = navigationBar;
        
        _meiTuanNavigationItem = navigationItem;
        
    }

    return self;
}

#pragma mark - 生命周期方法
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 将_meiTuanNavigationBar添加到父视图（控制器的View）
    [self.view addSubview:_meiTuanNavigationBar];
    
    // 设置导航条的约束
    [_meiTuanNavigationBar mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.right.offset(0);
        
        // 高度约束
        make.height.offset(64);
        
    }];
    
    
}

#pragma mark - 重写StatusBarStyle属性的setter方法
// StatusBarStyle属性的setter方法。传递状态栏样式的值，此方法调用说明有人想要换状态栏样式
- (void)setStatusBarStyle:(UIStatusBarStyle)statusBarStyle {
    
    
    _statusBarStyle = statusBarStyle;
    
    
    // 让显示状态栏样式的方法preferredStatusBarStyle重新调用
    [self setNeedsStatusBarAppearanceUpdate];


}

#pragma mark - 设置并显示状态栏样式
// 设置并显示状态栏样式 
-(UIStatusBarStyle)preferredStatusBarStyle{

//    NSLog(@"---");// 测试是否调用设置状态栏样式时候使用
    // 返回一个状态栏样式并显示这种样式
    return self.statusBarStyle;

}


#pragma mark - 内存警告处理
// 内存警告处理
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    // 如果自身视图已经加载，并且视图不在window上
    if (self.isViewLoaded && self.view.window == nil) {
        // 把视图置为空，这样没有强引用视图自动被释放
        self.view = nil;
    }
    
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
