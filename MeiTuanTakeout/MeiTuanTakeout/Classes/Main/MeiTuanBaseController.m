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

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{

    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];

    if (self) {
        
        // 创建导航条
        UINavigationBar *navigationBar = [[UINavigationBar alloc] init];
        
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


// 内存警告处理
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    
    if (self.isViewLoaded && self.view.window == nil) {
        
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
