//
//  IntroductiontotheViewController.m
//  ziweiyang
//
//  Created by bidiao on 2017/10/17.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import "IntroductiontotheViewController.h"
#import "IntrodouziweiyagViewController.h"
#import "IntrodoubookViewController.h"

#import "TitleSlider.h"

@interface IntroductiontotheViewController ()<UIScrollViewDelegate>

@property(nonatomic,strong) TitleSlider * titleSlider;

@end

@implementation IntroductiontotheViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.titleSlider = [[TitleSlider alloc]init];
    
    IntrodouziweiyagViewController * ziyei = [IntrodouziweiyagViewController new];
    ziyei.view.backgroundColor = [UIColor redColor];
    
  //  [self addchild:@"紫薇楊" vicontroller:ziyei];
    
  IntrodoubookViewController * book = [IntrodoubookViewController new];
    
    
    [self.titleSlider adduiViewcontroll:self title:@[@"紫薇楊",@"書籍"] addvieController:@[ziyei,book]];
    
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
