//
//  UITextView+SDTextView.h
//  SDPackage
//
//  Created by slowdony on 2018/8/4.
//  Copyright © 2018年 slowdony. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView (SDTextView)

/**
 设置placeholdStr(设置前需要先设置textView的字体大小,否则placeholdStr字体和textView会不一样)

 @param placeholdStr placeholdStr
 @param placeholdColor placeholdStrColor
 */
-(void)sd_setPlaceholder:(NSString *)placeholdStr placeholdColor:(UIColor *)placeholdColor;
@end
