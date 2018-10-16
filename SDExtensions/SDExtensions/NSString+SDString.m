//
//  NSString+SDString.m
//  SDDouYin
//
//  Created by slowdony on 2018/5/26.
//  Copyright © 2018年 slowdony. All rights reserved.
//

#import "NSString+SDString.h"

@implementation NSString (SDString)

/**
 判断字符串是否为空
 
 @return 返回yes=空
 */
- (BOOL)sd_isBlankString {
    if (self == nil || self == NULL) {
        return YES;
    }
    if ([self isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([[self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
        return YES;
    }
    return NO;
}


/**
 更改字符串部分字体

 @param str 字符串
 @param font 需要改的字体
 @param range 需要改的字体的范围
 @return 返回值
 */
+(NSMutableAttributedString *)sd_changeFontWithStr:(NSString *)str font:(UIFont *)font range:(NSRange )range
{
    NSMutableAttributedString *attributStr = [[NSMutableAttributedString alloc]initWithString:str];
    //选择范围改变颜色
    [attributStr addAttribute:NSFontAttributeName value:font range:range];
    return attributStr;
}


/**
 计算字符串宽度

 @param fontSize 字体大小
 @param text 文字
 @return 快读
 */
+ (CGFloat)sd_getFloatForTextWithFontSize:(float)fontSize text:(NSString*)text
{
    return [NSString sd_getFloatForTextWithFont:SDFont(fontSize) text:text];
}


/**
 计算字符串宽度

 @param font 字体
 @param text 文字
 @return 返回宽度
 */
+ (CGFloat)sd_getFloatForTextWithFont:(UIFont *)font text:(NSString*)text
{
    if (!text.length) {
        text = @"";
    }
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:text];
    [attrStr addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, text.length)];
    CGRect frame = [attrStr boundingRectWithSize:CGSizeMake(SCREEN_WIDTH, 0) options:NSStringDrawingUsesLineFragmentOrigin context:nil];
    return frame.size.width;
}

/**
 具体日期
 
 @param timeStampString 时间戳(10位)
 @param dataFormat (对应日期格式)
 @return 返回值
 */
+ (NSString *)sd_dataTransformTimeStampString:(NSString *)timeStampString dataFormat:(NSString *)dataFormat{
    // iOS 生成的时间戳是10位
    NSTimeInterval interval    =[timeStampString doubleValue] ;
    NSDate *date               = [NSDate dateWithTimeIntervalSince1970:interval];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:dataFormat];
    NSString *dateString       = [formatter stringFromDate: date];
    return dateString;
}




/**
 webView加载HTML字符串，图片及文字自适应
 
 @param htmlStr HTML字符串
 @return 自适应HTML字符串
 */
+(NSString *)sd_webViewAdaptiveSizeWithHtmlStr:(NSString *)htmlStr {
    
    NSString *content = [htmlStr stringByReplacingOccurrencesOfString:@"&amp;quot" withString:@"'"];
    content = [content stringByReplacingOccurrencesOfString:@"&lt;" withString:@"<"];
    content = [content stringByReplacingOccurrencesOfString:@"&gt;" withString:@">"];
    content = [content stringByReplacingOccurrencesOfString:@"&quot;" withString:@"\""];
    
    NSString *htmls = [NSString stringWithFormat:@"<html> \n"
                       "<head> \n"
                       "<meta name=\"viewport\" content=\"initial-scale=1.0, maximum-scale=1.0, user-scalable=no\" /> \n"
                       "<style type=\"text/css\"> \n"
                       "body {font-size:15px;}\n"
//                       "p{text-indent:2em}\n" //缩进两行
//                       "display:block\n"
                       "</style> \n"
                       "</head> \n"
                       "<body>"
                       "<script type='text/javascript'>"
                       "window.onload = function(){\n"
                       "var $img = document.getElementsByTagName('img');\n"
                       "for(var p in  $img){\n"
                       " $img[p].style.width = '100%%';\n"
                       "$img[p].style.height ='auto'\n"
                       "}\n"
                       "}"
                       "</script>%@"
                       "</body>"
                       "</html>",content];
    return htmls;
}
@end
