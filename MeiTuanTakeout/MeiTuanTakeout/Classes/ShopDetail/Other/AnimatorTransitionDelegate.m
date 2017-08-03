//
//  AnimatorTransitionDelegate.m
//  MeiTuanTakeout
//
//  Created by 温岱阳 on 2017/8/3.
//  Copyright © 2017年 DaiyangWen. All rights reserved.
//

#import "AnimatorTransitionDelegate.h"


@interface AnimatorTransitionDelegate () <UIViewControllerAnimatedTransitioning>// 遵守动画转场协议




@end


@implementation AnimatorTransitionDelegate





// 此方法是present时调用,谁来处理present及present动画
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    
    return self;
}





// 此方法是dismiss 时调用,谁来处理dismiss及dismiss动画
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {


    return self;
}




// 设置动画持续时间,此方法是present和dismiss时都会调用
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext{
    return 0.25;

}





// 设置动画转场，此方法是present和dismiss时都会调用
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{

    // 通过transitionContext转场上下文 ，viewControllerForKey:方法获取转 场控制器UITransitionContextFromViewKey来源控制器和UITransitionContextToViewKey 目标控制器，将这两个控制器添加到containerView容器视图来实现转场效果。
    
    // 获取来源控制器的view，在dismiss时,formView是商家详情界面的view
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];

    // 获取目标控制器的view，在present时toView就是商家详情界面的view
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    
    // 获取容器视图
    UIView *containerView = [transitionContext containerView];
    
    // 将目标控制器添加到容器视图上，这样才能显示转场之后的界面
    [containerView addSubview:toView];
    
    // 通知转场上下文装场结束
    [transitionContext completeTransition:YES];
    
    
    
}



@end
