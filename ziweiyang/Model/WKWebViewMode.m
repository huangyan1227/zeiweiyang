//
//  WKWebViewMode.m
//  ziweiyang
//
//  Created by bidiao on 2017/11/14.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import "WKWebViewMode.h"
#import <WebKit/WebKit.h>

static WKWebView *wkwebview = nil;
@implementation WKWebViewMode

+(WKWebView*)shardwkwebView:(CGRect)rect view:(UIView*)view{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        WKWebViewConfiguration * cont = [[WKWebViewConfiguration alloc]init];
      
        wkwebview = [[WKWebView alloc]initWithFrame:rect configuration:cont];
        
        wkwebview.scrollView.showsHorizontalScrollIndicator = NO;
      
        wkwebview.scrollView.showsVerticalScrollIndicator = NO;
       
        [view addSubview:wkwebview];
  
    });
    
    return wkwebview;
}

+(id)webloadHttml:(NSString *)a url:(NSURL *)url cgrect:(CGRect)rect view:(UIView *)view{
    
    
    
    return [[self shardwkwebView:rect view:view] loadHTMLString:a baseURL:url];
}
@end
