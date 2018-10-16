//
//  UITextView+SDTextView.m
//  SDPackage
//
//  Created by slowdony on 2018/8/4.
//  Copyright © 2018年 slowdony. All rights reserved.
//

#import "UITextView+SDTextView.h"

@implementation UITextView (SDTextView)
/**
 设置placeholdStr(设置前需要先设置textView的字体大小,否则placeholdStr字体和textView会不一样)
 
 @param placeholdStr placeholdStr
 @param placeholdColor placeholdStrColor
 */
-(void)sd_setPlaceholder:(NSString *)placeholdStr placeholdColor:(UIColor *)placeholdColor
{
    UILabel *placeHolderLabel = [[UILabel alloc] init];
    placeHolderLabel.text = placeholdStr;
    placeHolderLabel.numberOfLines = 0;
    placeHolderLabel.textColor = placeholdColor?[UIColor grayColor]:placeholdColor;
    placeHolderLabel.font = self.font;
    [placeHolderLabel sizeToFit];
    [self addSubview:placeHolderLabel];
    
    /*
     KVC键值编码，对UITextView的私有属性进行修改
     */
    [self setValue:placeHolderLabel forKey:@"_placeholderLabel"];
}
@end
