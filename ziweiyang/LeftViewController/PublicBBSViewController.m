//
//  PublicBBSViewController.m
//  ziweiyang
//
//  Created by bidiao on 2017/10/17.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import "PublicBBSViewController.h"
#import "TitleSlider.h"
#import "HotViewController.h"
#import "ThefoundationViewController.h"
#import "SeniorViewController.h"
#import "TherulesViewController.h"
#import "XinTieViewController.h"
@interface PublicBBSViewController ()
@property(nonatomic,strong) TitleSlider * slider;
@end
#define fontColor(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define kNaHeight ([[UIApplication sharedApplication] statusBarFrame].size.height>20?20:0)
@implementation PublicBBSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    HotViewController * hot = [HotViewController new];
    
    ThefoundationViewController * foundation = [ThefoundationViewController new];
    
    SeniorViewController * senior = [SeniorViewController new];
    
    NSArray * arraVie =@[hot,foundation,senior];
    
    NSArray * titleArray = @[@"热门话题",@"建基场",@"资深场"];
    self.slider = [TitleSlider new];
    
    [self.slider adduiViewcontroll:self title:titleArray addvieController:arraVie];
    [self adview];
    
}
-(void)adview{
    
    UIView * view = [UIView new];
    
    view.frame = CGRectMake(0, self.view.frame.size.height-120-kNaHeight, self.view.frame.size.width, 60);
    
    view.backgroundColor = fontColor(239, 227, 197);
    
    [self.view addSubview:view];
    
    UIButton *rules = [[UIButton alloc]init];
    
    rules.frame = CGRectMake(20, 10,view.frame.size.width/4 , view.frame.size.height*2/3);
    
    [view addSubview:rules];
    
    [rules addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    
    [rules setTitle:@"壇規" forState:UIControlStateNormal];
    
    [rules setTitleColor:fontColor(121, 101, 66) forState:UIControlStateNormal];
    
    [rules setImage:[UIImage imageNamed:@"ruleIcon"] forState:UIControlStateNormal];
    
    [rules setBackgroundImage:[UIImage imageNamed:@"padding"] forState:UIControlStateNormal];
    // 设置按钮的内容左对齐
    rules.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    
    // 设置间距
   rules.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);

    UIButton *xintie = [[UIButton alloc]init];
    
    xintie.frame = CGRectMake(view.frame.size.width*3/4 -20,10 , rules.frame.size.width, rules.frame.size.height);
    [xintie setBackgroundImage:[UIImage imageNamed:@"newTopic"] forState:UIControlStateNormal];
    [view addSubview:xintie];
    
    [xintie addTarget:self action:@selector(xintie) forControlEvents:UIControlEventTouchUpInside];
    
    
}
-(void)click{
    
    
    [self.navigationController pushViewController:[TherulesViewController new] animated:YES];
    
    
}
-(void)xintie{
    
    
    [self.navigationController pushViewController:[XinTieViewController new] animated:YES];
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
