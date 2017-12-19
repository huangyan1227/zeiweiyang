//
//  ThecompanyViewController.m
//  ziweiyang
//
//  Created by bidiao on 2017/10/17.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import "ThecompanyViewController.h"
#import <WebKit/WebKit.h>
@interface ThecompanyViewController ()
@property(nonatomic,strong) WKWebView * wkwebView;
@end

@implementation ThecompanyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   // self.webView = [[UIWebView alloc]initWithFrame:self.view.frame];
    
   // self.webView.delegate = self;
    
    self.wkwebView  =  [[WKWebView alloc]initWithFrame:self.view.frame configuration:[WKWebViewConfiguration new]];
    NSString * pathHtml = [[NSBundle mainBundle] pathForResource:@"company" ofType:@"html"];
    
    NSString *htmlString = [NSString stringWithContentsOfFile:pathHtml encoding:NSUTF8StringEncoding error:nil];
    
    NSString *basePath = [[NSBundle mainBundle] bundlePath];
    
    NSURL *baseURL = [NSURL fileURLWithPath:basePath];
    
  //  [self.webView loadHTMLString:htmlString baseURL:baseURL];
    
  //  [self.view addSubview:self.webView];
    
    
    [self.wkwebView loadHTMLString:htmlString baseURL:baseURL];
    
    [self.view addSubview:self.wkwebView];
    
    
    
    // Do any additional setup after loading the view.
}
-(void)webViewDidFinishLoad:(UIWebView *)webView{
    
   // NSLog(@"王超");
}
-(void)webViewDidStartLoad:(UIWebView *)webView{
    
    NSLog(@"开始");
    
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
