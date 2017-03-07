//
//  PresentTransition.m
//  OneCardPass
//  自定义present转场动画
//  Created by ming on 2017/2/28.
//  Copyright © 2017年 ming. All rights reserved.
//

#import "PresentTransition.h"

@implementation PresentTransition

//动画耗时
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    return  0.4;
}
//动画执行
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController * fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController * toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containerView = [transitionContext containerView];
    UIView * fromView = fromViewController.view;
    UIView * toView = toViewController.view;
    UIView * shadowView = [[UIView alloc]initWithFrame:fromView.frame];
    shadowView.backgroundColor = [UIColor blackColor];
    shadowView.layer.opacity = 0.0;
    [containerView addSubview:shadowView];
    toView.frame = CGRectMake(0, CGRectGetMaxY(containerView.frame), toView.frame.size.width, 300);
    [containerView addSubview:toView];
    NSTimeInterval transitionDuration = [self transitionDuration:transitionContext];
    //让toview的origin.y在屏幕的一半处，这样它从屏幕的中间位置弹起而不是从屏幕底部弹起，弹起过程中逐渐变为不透明

    [UIView animateWithDuration:transitionDuration delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:1 options:UIViewAnimationOptionCurveLinear animations:^{
        shadowView.layer.opacity = 0.5 ;    // 逐渐变为不透明
        toView.frame = [transitionContext finalFrameForViewController:toViewController];   // 移动到指定位置
    } completion:^(BOOL finished) {
        //转场失败后的处理
        if ([transitionContext transitionWasCancelled]) {
            [shadowView removeFromSuperview];
        }
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
    
    
    
}
@end
