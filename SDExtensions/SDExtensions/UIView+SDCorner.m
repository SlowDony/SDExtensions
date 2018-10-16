//
//  UIView+SDCorner.m
//  SDPackage
//
//  Created by slowdony on 2018/9/1.
//  Copyright © 2018年 slowdony. All rights reserved.
//

#import "UIView+SDCorner.h"
#import <objc/runtime.h>
@implementation UIView (SDCorner)
- (CGFloat)sd_cornerRadius{
    NSNumber *number = objc_getAssociatedObject(self, @selector(sd_cornerRadius));
    return [number floatValue];
}

- (void)setSd_cornerRadius:(CGFloat)sd_cornerRadius{
    objc_setAssociatedObject(self, @selector(sd_cornerRadius), @(sd_cornerRadius), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)sd_addCornerAtPostion:(UIRectCorner)postion{
    [self layoutIfNeeded];
    CGFloat radius = (self.sd_cornerRadius > 0) ? self.sd_cornerRadius : 6.f;
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:postion cornerRadii:CGSizeMake(radius, radius)];
    
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
    [self.layer setMasksToBounds:YES];
}
@end
