//
//  UIBarButtonItem+SDBarButtonItem.h
//  SDPackage
//
//  Created by slowdony on 2018/10/16.
//  Copyright © 2018年 slowdony. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface UIBarButtonItem (SDBarButtonItem)


/**
 创建一个(纯图片的)UIBarButtonItem

 @param target target
 @param action action
 @param image image
 @param selectImage selectImage
 @return UIBarButtonItem
 */
+(UIBarButtonItem *)sd_itemTarget:(id)target
                           action:(SEL)action
                            image:(NSString *)image
                      selectImage:(NSString *)selectImage;


/**
 创建一个(带文字的)的UIBarButtonItem

 @param target target
 @param action action
 @param title 文字
 @return UIBarButtonItem
 */
+(UIBarButtonItem *)sd_itemWithaddTarget:(id)target
                                  action:(SEL)action
                                   title:(NSString *)title;
@end


