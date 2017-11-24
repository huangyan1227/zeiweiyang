//
//  PrivacypolicyViewController.m
//  ziweiyang
//
//  Created by bidiao on 2017/10/17.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import "PrivacypolicyViewController.h"
#import <WebKit/WebKit.h>
@interface PrivacypolicyViewController ()<WKScriptMessageHandler,WKNavigationDelegate,WKUIDelegate>
//@property(nonatomic,strong) UIWebView * webView;
@property(nonatomic,strong)  WKWebView* wkWebView;
@end

@implementation PrivacypolicyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //self.webView = [[UIWebView alloc]initWithFrame:self.view.frame];
    
   // self.webView.delegate = self;
    
    WKWebViewConfiguration * configuation =[WKWebViewConfiguration new];
    
    configuation.preferences.javaScriptEnabled = YES;
    
    self.wkWebView  =  [[WKWebView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-60) configuration:configuation];
    
    self.wkWebView.navigationDelegate = self;
    
    self.wkWebView.UIDelegate = self;
    
    [configuation.userContentController addScriptMessageHandler:self name:@"AppModel"];
    [configuation.userContentController addScriptMessageHandler:self name:@"Mailto"];
    
    NSString * path = [[NSBundle mainBundle] pathForResource:@"privacy" ofType:@"html"];
    

    
    NSString *htmlString = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    
    NSString *basePath = [[NSBundle mainBundle] bundlePath];
    
    NSURL *baseURL = [NSURL fileURLWithPath:basePath];
    
   // [self.webView loadHTMLString:htmlString baseURL:baseURL];
    
    //[self.view addSubview:self.webView];
    
    [self.wkWebView loadHTMLString:htmlString baseURL:baseURL];
    
    [self.view addSubview:self.wkWebView];
    
    
    // Do any additional setup after loading the view.
}
-(void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message{
 
    if ([message.name isEqualToString:@"AppModel"]) {
        
       
        
        NSString * st =message.body[@"body"];
        
        [self tell:st];
        
       
    }
    else if ([message.name isEqualToString:@"Mailto"]){
         NSString * st =message.body[@"body"];
        
        [self sem:st];
    }
    
}
-(void)sem:(NSString*)str{
    
      NSMutableString *strd=[[NSMutableString alloc] initWithFormat:@"mailto::%@",str];
    NSURL *url = [NSURL URLWithString:strd];
                  
    [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
    
}
-(void)tell:(NSString*)str{
    
    
   
    NSMutableString *strd=[[NSMutableString alloc] initWithFormat:@"tel:%@",str];
    
   
    UIWebView * callWebview = [[UIWebView alloc] init];
    [callWebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:strd]]];
    [self.view addSubview:callWebview];
    
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
