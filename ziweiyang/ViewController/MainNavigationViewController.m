//
//  MainNavigationViewController.m
//  ziweiyang
//
//  Created by bidiao on 2017/10/18.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import "MainNavigationViewController.h"
#import "LogViewController.h"
#import "MainViewController.h"
@interface MainNavigationViewController ()
@property(nonatomic,strong) UIButton * bg;
@end

@implementation MainNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
   // [self.navigationBar setBackgroundColor:[UIColor colorWithDisplayP3Red:221/255.0 green:211/255.0 blue:186/255.0 alpha:1]];
    
    [self.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithDisplayP3Red:221/255.0 green:211/255.0 blue:186/255.0 alpha:1]] forBarMetrics:UIBarMetricsDefault];
    
    UIButton * rightbutton = [[UIButton alloc]init];
    
    rightbutton.frame = CGRectMake(self.view.frame.size.width-60, 0,60, 40);
    self.bg = rightbutton;
    
    rightbutton.titleLabel.adjustsFontSizeToFitWidth = YES;
    [rightbutton addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
   [self.navigationBar addSubview:rightbutton];
    [rightbutton setTitle:@"登录" forState:UIControlStateNormal];
    
   // self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightbutton];
  //  self.navigationItem.rightBarButtonItem = []

    // Do any additional setup after loading the view.
}
//-(void)viewDidDisappear:(BOOL)animated{
//        self.bg.hidden = YES;
//    [super viewDidDisappear:animated];
//     NSLog(@"gsdfee333333");
//
//}
//
//-(void)viewDidAppear:(BOOL)animated{
//        self.bg.hidden = YES;
//    [super viewDidAppear:animated];
//      NSLog(@"gsdfeee2222222222");
//}
//-(void)viewWillDisappear:(BOOL)animated{
//    [super viewWillDisappear:animated];
//        self.bg.hidden = YES;
//    NSLog(@"gsdfdsfaeeeeeeeeee");
//   
//    
//}
-(void)viewWillAppear:(BOOL)animated{
    NSLog(@"ggcccfedssfsdffaeeeeeeeeee");
     self.bg.hidden = NO;
     [super viewWillAppear:animated];
    if (AppLog_State) {
        [self.bg setTitle:@"成功" forState:UIControlStateNormal];
        
    }else{
     [self.bg setTitle:@"登录" forState:UIControlStateNormal];
    }
}
-(void)click:(UIButton*)bg{
    
  // NSLog(@"登ff录");
   // NSLog(@"gg%d",AppLog_State);
    if (AppLog_State) {
        
           NSLog(@"---------ff录");
        [self.maind
         rightMen];
    }else{

   // bg.hidden = YES;
    LogViewController * logView =  [LogViewController new];

    logView.button = self.bg;

    [self pushViewController:logView animated:YES];
    }
//
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
