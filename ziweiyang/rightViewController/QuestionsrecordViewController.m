//
//  QuestionsrecordViewController.m
//  ziweiyang
//
//  Created by bidiao on 2017/11/15.
//  Copyright © 2017年 bidiao. All rights reserved.
//  提问记录

#import "QuestionsrecordViewController.h"
#import "TitleSlider.h"
#import "ThedayproblemrightViewController.h"
#import "ProblemsreplyViewController.h"
@interface QuestionsrecordViewController ()
@property(nonatomic,strong) TitleSlider * titleSlider;
@end

@implementation QuestionsrecordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.titleSlider = [[TitleSlider alloc]init];
    
 ThedayproblemrightViewController * topic = [ThedayproblemrightViewController new];
    
    // topic.view.backgroundColor = [UIColor redColor];
    
    ProblemsreplyViewController * reply = [  ProblemsreplyViewController new];
    
    // reply.view.backgroundColor = [UIColor yellowColor];
    //  [self addchild:@"紫薇楊" vicontroller:ziyei];
    
    
    
    [self.titleSlider adduiViewcontroll:self title:@[@"每日问题",@"问题回复"] addvieController:@[topic,reply]];
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
