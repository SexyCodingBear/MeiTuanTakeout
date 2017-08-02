//
//  WDYInfoLoopView.m
//  MeiTuanTakeout
//
//  Created by 温岱阳 on 2017/8/2.
//  Copyright © 2017年 DaiyangWen. All rights reserved.
//

#import "WDYInfoLoopView.h"

@interface WDYInfoLoopView ()

// 第一个优惠信息视图
@property (weak, nonatomic) WDYInfoView * infoView1;

// 第二个优惠信息视图
@property (weak, nonatomic) WDYInfoView * infoView2;

// 当前索引值
@property (assign, nonatomic) NSInteger currentIndex;


@end


@implementation WDYInfoLoopView


#pragma mark - 初始化方法
// 初始化方法
-(void)awakeFromNib {
    [super awakeFromNib];
    
    [self setupUI];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}





#pragma mark - 创建视图
// 创建视图
- (void)setupUI{
    
    // 创建第一个信息视图
    WDYInfoView * infoView1 = [[WDYInfoView alloc] init];
    
    // 添加到父视图
    [self addSubview:infoView1];
    
    // 添加约束
    [infoView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.bottom.offset(0);
        make.right.offset(-16);
        
    }];
    
    // 给属性赋值
    _infoView1 = infoView1;
    
    
    // 创建第二个信息视图
    WDYInfoView * infoView2 = [[WDYInfoView alloc] init];
    
    // 添加到父视图
    [self addSubview:infoView2];
    
    // 添加约束
    [infoView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(infoView1.mas_bottom).offset(0);
        make.left.equalTo(infoView1.mas_left).offset(0);
        make.width.height.equalTo(infoView1);
        
    }];
    
    // 给属性赋值
    _infoView2 = infoView2;
    
}






#pragma mark - 重写模型属性的setter方法
// 重写数组属性的setter方法
-(void)setDiscounts:(NSArray<WDYInfoModel *> *)discounts {
    
    // 给属性赋值
    _discounts = discounts;
    
    // 给信息视图赋值
    [self setValeForInfoView];
    
    // 滚动视图
    [self scroll];


}





#pragma mark - 给信息视图赋值
// 给信息视图赋值
- (void)setValeForInfoView{
    
    // 给第一个信息视图赋值
    _infoView1.infoModel = _discounts[_currentIndex];
    
    // 给第二个信息视图赋值
    _infoView2.infoModel = _discounts[(_currentIndex + 1) % _discounts.count];
    
}





#pragma mark - 滚动视图
// 滚动视图
- (void)scroll {

    // 延迟线程操作
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        // 添加UIview动画效果
        [UIView animateWithDuration:0.5 animations:^{
            
            // 设置第一个信息视图的形变，使其移动
            _infoView1.transform = CGAffineTransformMakeTranslation(0, self.bounds.size.height);
            
            // 设置第二个信息视图的形变，使其移动
            _infoView2.transform = CGAffineTransformMakeTranslation(0, self.bounds.size.height);
            
        } completion:^(BOOL finished) {
            
            // 更改索引值，使索引值在0-6之间无限循环
            _currentIndex = (_currentIndex + 1) % _discounts.count;
            
            // 给信息视图重新设置数据
            [self setValeForInfoView];
            
            // 将信息视图的形变归零
            _infoView1.transform = CGAffineTransformIdentity;
            _infoView2.transform = CGAffineTransformIdentity;
            
            // 递归调用scroll方法实现无限轮播
            [self scroll];
            
        }];
        
        
    });


}




@end
