//
//  UIView+SDCorner.h
//  SDPackage
//
//  Created by slowdony on 2018/9/1.
//  Copyright © 2018年 slowdony. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (SDCorner)
/*! 圆角半径 默认为 6*/
@property (nonatomic,assign)CGFloat sd_cornerRadius;

/**
 为视图添加圆角

 @param postion 要添加的圆角位置，可通过位或运算自定义圆角
 */
- (void)sd_addCornerAtPostion:(UIRectCorner)postion;
@end
