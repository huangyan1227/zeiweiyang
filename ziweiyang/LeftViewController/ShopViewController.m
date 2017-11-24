//
//  ShopViewController.m
//  ziweiyang
//
//  Created by bidiao on 2017/10/17.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import "ShopViewController.h"
#import "TitleSlider.h"
#import "BookPeriodicalsViewController.h"
#import "AphysicalstoreViewController.h"
@interface ShopViewController ()
@property(nonatomic,strong) TitleSlider * slider;
@end

@implementation ShopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.slider = [TitleSlider new];
    
    
    NSArray * title = @[@"书刊",@"实体店"];
    
    BookPeriodicalsViewController * bookPer =[BookPeriodicalsViewController new];
    
    AphysicalstoreViewController * aph = [AphysicalstoreViewController new];
    NSArray *viewArr = @[bookPer,aph];
    
    [self.slider adduiViewcontroll:self title:title addvieController:viewArr];
    
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
