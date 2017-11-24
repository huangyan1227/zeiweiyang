//
//  TherulesViewController.m
//  ziweiyang
//
//  Created by bidiao on 2017/11/2.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import "TherulesViewController.h"
#import <WebKit/WebKit.h>
@interface TherulesViewController ()
@property(nonatomic,strong) WKWebView * webView;
@end

@implementation TherulesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString * path = [[NSBundle mainBundle] pathForResource:@"rules" ofType:@"html"];
    
    
    WKWebViewConfiguration * configuration = [[WKWebViewConfiguration alloc]init];
    
    self.webView = [[WKWebView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-60) configuration:configuration];
    
    
    
    
  //  NSString *htmlString = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    
    
    NSString * htmlSrting = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    
    
    NSString *basePath = [[NSBundle mainBundle] bundlePath];
    
    NSURL *baseURL = [NSURL fileURLWithPath:basePath];
    
    
    
    
    [self.webView loadHTMLString:htmlSrting baseURL:baseURL];
    
    
    [self.view addSubview:self.webView];
    
    
    
    
    
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
