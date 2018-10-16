//
//  NSString+SDString.h
//  SDDouYin
//
//  Created by slowdony on 2018/5/26.
//  Copyright © 2018年 slowdony. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (SDString)

/**
 判断字符串是否为空
 
 @return 返回yes=空
 */
- (BOOL)sd_isBlankString;

/**
 更改字符串部分字体
 
 @param str 字符串
 @param font 需要改的字体
 @param range 需要改的字体的范围
 @return 返回值
 */
+(NSMutableAttributedString *)sd_changeFontWithStr:(NSString *)str font:(UIFont *)font range:(NSRange )range;

/**
 计算字符串宽度
 
 @param fontSize 字体大小
 @param text 文字
 @return 快读
 */
+ (CGFloat)sd_getFloatForTextWithFontSize:(float)fontSize text:(NSString*)text;



/**
 计算字符串宽度
 
 @param font 字体
 @param text 文字
 @return 返回宽度
 */
+ (CGFloat)sd_getFloatForTextWithFont:(UIFont *)font text:(NSString*)text;



/**
 webView加载HTML字符串，图片及文字自适应

 @param htmlStr HTML字符串
 @return 自适应HTML字符串
 */
+(NSString *)sd_webViewAdaptiveSizeWithHtmlStr:(NSString *)htmlStr;

/**
 具体日期
 
 @param timeStampString 时间戳(10位)
 @param dataFormat (对应日期格式)
 @return 返回值
 */
+ (NSString *)sd_dataTransformTimeStampString:(NSString *)timeStampString dataFormat:(NSString *)dataFormat;


@end
