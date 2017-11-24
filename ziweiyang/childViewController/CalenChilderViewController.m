//
//  CalenChilderViewController.m
//  ziweiyang
//
//  Created by bidiao on 2017/10/30.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import "CalenChilderViewController.h"
#import <WebKit/WebKit.h>
@interface CalenChilderViewController ()
@property(nonatomic,strong) WKWebView * wkWebView;
@end

@implementation CalenChilderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    WKWebViewConfiguration * configuration = [[WKWebViewConfiguration alloc]init];
    
    self.wkWebView = [[WKWebView alloc]initWithFrame:self.view.frame configuration:configuration];
    
    self.view.backgroundColor = [UIColor yellowColor];
    
    // image.backgroundColor =[UIColor yellowColor];
    
    
    
    
    [self.wkWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.ziweiyang.com/sc/mobile_calendar.php"]]];
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
