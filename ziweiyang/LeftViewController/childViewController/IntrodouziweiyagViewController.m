//
//  IntrodouziweiyagViewController.m
//  ziweiyang
//
//  Created by bidiao on 2017/10/24.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import "IntrodouziweiyagViewController.h"
#import <WebKit/WebKit.h>
@interface IntrodouziweiyagViewController ()
@property(nonatomic,strong) WKWebView * wkWebView;
@end

@implementation IntrodouziweiyagViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.wkWebView  =  [[WKWebView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-64) configuration:[WKWebViewConfiguration new]];
    
    NSString * pathHtml = [[NSBundle mainBundle] pathForResource:@"ziweiyang" ofType:@"html"];
    
    NSString *htmlString = [NSString stringWithContentsOfFile:pathHtml  encoding:NSUTF8StringEncoding error:nil];
    
    NSString *basePath = [[NSBundle mainBundle] bundlePath];
    
    NSURL *baseURL = [NSURL fileURLWithPath:basePath];
    
    // [self.webView loadHTMLString:htmlString baseURL:baseURL];
    
    //[self.view addSubview:self.webView];
    
    [self.wkWebView loadHTMLString:htmlString baseURL:baseURL];
    
    [self.view addSubview:self.wkWebView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
