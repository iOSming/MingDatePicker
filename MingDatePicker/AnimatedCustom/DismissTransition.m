//
//  DismissTransition.m
//  OneCardPass
//  自定义dismiss转场动画
//  Created by ming on 2017/2/28.
//  Copyright © 2017年 ming. All rights reserved.
//

#import "DismissTransition.h"

@implementation DismissTransition
//动画耗时
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    return  0.2;
}
// 动画执行
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{    
    UIView * containerView = [transitionContext containerView];
    UIView * fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    
    __block UIView * shadowView;
    [transitionContext.containerView.subviews enumerateObjectsUsingBlock:^(UIView *view, NSUInteger idx, BOOL *stop) {
        if (view.layer.opacity < 1.f) {
            shadowView = view;
            *stop = YES;
        }
    }];
    
    //让toview的origin.y在屏幕的一半处，这样它从屏幕的中间位置弹起而不是从屏幕底部弹起，弹起过程中逐渐变为不透明
    fromView.frame =  CGRectMake(0, CGRectGetMaxY(containerView.frame) - 300,
                                 fromView.frame.size.width, 300);
    CGRect endframe = CGRectMake(0, CGRectGetMaxY(containerView.frame), fromView.frame.size.width, 300);
    NSTimeInterval transitionDuration = [self transitionDuration:transitionContext];

    [UIView animateWithDuration:transitionDuration  animations:^{
        shadowView.alpha = 0.0 ;    // 逐渐变为不透明
        fromView.frame = endframe;   // 移动到指定位置
    } completion:^(BOOL finished) {
        [shadowView removeFromSuperview];
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        
    }];
}
@end
