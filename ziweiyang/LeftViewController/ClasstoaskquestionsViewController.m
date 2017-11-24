//
//  ClasstoaskquestionsViewController.m
//  ziweiyang
//
//  Created by bidiao on 2017/10/17.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import "ClasstoaskquestionsViewController.h"
#import "TitleSlider.h"
#import "QuestioneplyViewController.h"
#import "ThedailyproblemsViewController.h"
@interface ClasstoaskquestionsViewController ()
@property(nonatomic,strong) TitleSlider * slider;
@end

@implementation ClasstoaskquestionsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    QuestioneplyViewController * que = [QuestioneplyViewController new];
    
    ThedailyproblemsViewController * theday = [ThedailyproblemsViewController new];
    NSArray * arraVie =@[que,theday];
    
    NSArray * titleArray = @[@"问题回复",@"每日问题"];
    self.slider = [TitleSlider new];
    
    [self.slider adduiViewcontroll:self title:titleArray addvieController:arraVie];
    //[self adview];
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
