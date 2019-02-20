//
//  WKWebView+SDImages.m
//  baisidedu
//
//  Created by slowdony on 2019/2/20.
//  Copyright © 2019年 slowdony. All rights reserved.
//

#import "WKWebView+SDImages.h"

@implementation WKWebView (SDImages)
- (void)addTapImageGesture{
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureAction:)];
    tapGesture.numberOfTapsRequired = 1;
    tapGesture.delegate = (id)self;
    [self addGestureRecognizer:tapGesture];
}


//这里增加手势的返回，不然会被WKWebView拦截
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}

-(void) tapGestureAction:(UITapGestureRecognizer *)recognizer
{
    //首先要获取用户点击在WKWebView 的范围点
    CGPoint touchPoint = [recognizer locationInView:self];
//    NSString *imgURLJS = [NSString stringWithFormat:@"document.elementFromPoint(%f, %f).src", touchPoint.x, touchPoint.y];
    NSString *imgURLJS = @"document.documentElement.innerHTML";
    //跟着注入JS 获取 异步获取结果
    [self evaluateJavaScript:imgURLJS completionHandler:^(id result, NSError * _Nullable error) {
        if (error == nil)
        {
            NSString *url = result;
            if (url.length == 0)
            {
                return ;
            }
            else
            {
                //如果是url 则转换成 UIImage
                NSData *imgData = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
                UIImage *clickImg = [UIImage imageWithData:imgData];
                if (clickImg)
                {
                    NSArray *imgArr = @[url];
                    NSMutableArray *tempArray = [[NSMutableArray alloc] init];
                    [tempArray addObject:clickImg];
                    //将图片 存起来 ，然后可以放到 预览控件里面去了
                   // [self setImgUrlArrayKey:[tempArray copy]];
                    
                    //to do 这里就可以将图片放在你想要放在的 图片预览控件里面了
                }
                
            }
        }
    }];
}

//呈现图片，HTML是否适配分辨率将影响点击资源与获取到得资源是否一致
-(void)showImageURL:(NSString *)url point:(CGPoint)point
{
    UIImageView *showView = [[UIImageView alloc] initWithFrame:[[UIScreen mainScreen]bounds]];
    showView.center = point;
    CGPoint newPoint = self.center;
    showView.center = newPoint;
    
    showView.backgroundColor = [UIColor blackColor];
    showView.alpha = 1;
    showView.userInteractionEnabled = YES;
    [self addSubview:showView];
    [showView setContentMode:UIViewContentModeScaleAspectFit];
//    [showView showImageFromURL:url placeHolder:nil CompletionBlock:nil];
    
    UITapGestureRecognizer* singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleViewTap:)];
    [showView addGestureRecognizer:singleTap];
    
//    [self.navigationController setNavigationBarHidden:YES animated:YES];
}


/*
 *JavaScript获取网页信息总结
 获取所有html:NSString *lJs = @"document.documentElement.innerHTML";
 获取网页title:NSString *lJs2 = @"document.title";
 UIWebView *lWebView = [self getCurrentWebView];
 NSString *lHtml1 = [lWebView stringByEvaluatingJavaScriptFromString:lJs];
 NSString *lHtml2 = [lWebView stringByEvaluatingJavaScriptFromString:lJs2];
 
 JavaScript获取网页信息总结
 JavaScript获取当前页面URL、title等
 
 thisURL = document.URL;
 thisHREF = document.location.href;
 thisSLoc = self.location.href;
 thisDLoc = document.location;
 thisTLoc = top.location.href;
 thisPLoc = parent.document.location;
 thisTHost = top.location.hostname;
 thisHost = location.hostname;
 thisTitle = document.title;
 thisProtocol = document.location.protocol;
 thisPort = document.location.port;
 thisHash = document.location.hash;
 thisSearch = document.location.search;
 thisPathname = document.location.pathname;
 thisHtml = document.documentElement.innerHTML;
 thisBodyText = document.documentElement.innerText;//获取网页内容文字
 thisBodyText = document.body.innerText;//获取网页内容文字  怎么和上一个一样？有知道的请解释
 */
//获取

    /*1视频*/
    /*
     //获取网页中所有视频
     NSString *getVideoTitle = [_webview getVideoTitle];
     NSLog(@"\n\n 视频名称 : %@",getVideoTitle);
     double getVideoDuration = [_webview getVideoDuration];
     NSLog(@"\n\n 视频总时间 : %f",getVideoDuration);
     double getVideoCurrentTime = [_webview getVideoCurrentTime];
     NSLog(@"\n\n 视频当前时间 : %f",getVideoCurrentTime);
     */
    
    /*2网页*/
    /*
     //获取网页中所有图片
     NSString *imageUrls = [_webview stringByEvaluatingJavaScriptFromString:@"var str=new Array();""$('img').each(function(){str.push($(this).attr('src'));});"
     "str.join(',');"];
     NSLog(@"\n\n 所有图片 : %@",imageUrls);
     
     //获取所有html
     NSString *lJs = @"document.documentElement.innerHTML";
     NSString *lHtml1 = [_webview stringByEvaluatingJavaScriptFromString:lJs];
     //NSLog(@"1.%@",lHtml1);
     
     //获取网页title:
     NSString *lJs2 = @"document.title";
     NSString *lHtml2 = [_webview stringByEvaluatingJavaScriptFromString:lJs2];
     NSLog(@"2.%@",lHtml2);
     
     //thisURL = document.URL
     NSString *lJs3 = @"document.URL";
     NSString *lHtml3 = [_webview stringByEvaluatingJavaScriptFromString:lJs3];
     NSLog(@"3.%@",lHtml3);
     
     //获取网页内容文字
     NSString *lJs4 = @"document.documentElement.innerText";
     NSString *lHtml4 = [_webview stringByEvaluatingJavaScriptFromString:lJs4];
     NSLog(@"4.%@",lHtml4);
     
     //获取网页内容文字
     NSString *lJs5 = @"document.body.innerText";
     NSString *lHtml5 = [_webview stringByEvaluatingJavaScriptFromString:lJs5];
     NSLog(@"5.%@",lHtml5);
     */
@end
