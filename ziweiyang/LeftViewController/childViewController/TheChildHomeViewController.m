//
//  TheChildHomeViewController.m
//  ziweiyang
//
//  Created by bidiao on 2017/10/19.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import "TheChildHomeViewController.h"
#import <WebKit/WebKit.h>
#import "WKWebViewMode.h"
@interface TheChildHomeViewController ()
@property(nonatomic,strong)  WKWebView* webView;
@end

@implementation TheChildHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    
    UIImageView * imageView = [[UIImageView alloc]init];
    
    imageView.frame = self.view.frame;
    
    [self.view insertSubview:imageView atIndex:0 ];
    
    imageView.image = [UIImage imageNamed:@"bgPattern"];
    [self addtitleview];
}
-(void)addtitleview{
    
   
    
    UILabel * namelable =[[UILabel alloc]init];
    
    namelable.frame = CGRectMake(10, 10, self.view.frame.size.width-20, 40);
    namelable.textColor = [UIColor colorWithDisplayP3Red:128/255.0 green:32/255.0 blue:140/255.0 alpha:1];
    namelable.text = self.home.name;
    
    [self.view addSubview:namelable];
    
    UILabel * datelable = [[UILabel alloc]init];
    
    datelable.frame = CGRectMake(10, CGRectGetMaxY(namelable.frame)+5, self.view.frame.size.width-20, 40);
   datelable.textColor = [UIColor colorWithDisplayP3Red:100/255.0 green:100/255.0 blue:98/255.0 alpha:1];
    datelable.text = self.home.date;
    
    [self.view addSubview:datelable];
    //style="background-image: url('bgPattern.jpg'); background-repeat: repeat;
    
    
    NSString * ab = [self.home.detail stringByReplacingOccurrencesOfString:@"&#34;" withString:@"\""];
    
    
    NSString * a = [NSString stringWithFormat:@"<html><meta charset = \"UTF-8\"  content = \"text/html\"><meta name=\"viewport\" content=\"width=device-width; initial-scale=1; user-scalable=no\"><head></head><body font－size:19px ;>%@</body><style type=\"text/css\">body {font-size:19px !important;background-image: url('ziweiyang/html/img/bgPattern.jpg'); background-repeat: repeat;background:#FCF9E7;}</style></html>",ab];
     
  WKWebViewConfiguration * cont = [[WKWebViewConfiguration alloc]init];
    self.webView = [[WKWebView alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(datelable.frame)+10, self.view.frame.size.width-20, self.view.frame.size.height - CGRectGetMaxY(datelable.frame)-60) configuration:cont];
    
    self.webView.scrollView.showsHorizontalScrollIndicator = NO;
    self.webView.scrollView.showsVerticalScrollIndicator = NO;
    
  //  NSString *htmlString = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    
  //  NSString *basePath = [[NSBundle mainBundle] bundlePath];
    
   // NSURL *baseURL = [NSURL fileURLWithPath:basePath];
    
 //[WKWebViewMode webloadHttml:a url:[NSURL URLWithString:@"https://www.ziweiyang.com/"] cgrect:CGRectMake(10, CGRectGetMaxY(datelable.frame)+10, self.view.frame.size.width-20, self.view.frame.size.height - CGRectGetMaxY(datelable.frame)-60) view:self.view];
    [self.webView loadHTMLString:a baseURL:[NSURL URLWithString:AppNetWork_Post]];
    
   // UIWebView * web = [[UIWebView alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(datelable.frame)+10, self.view.frame.size.width-10, self.view.frame.size.height - CGRectGetMaxY(datelable.frame))];
    
    //[web loadHTMLString:a baseURL:nil];
    
   // self.webView.backgroundColor = [UIColor clearColor];
    
    [self.view addSubview:self.webView];
    
    
    
}
-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    //NSLog(@"shouye");
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
