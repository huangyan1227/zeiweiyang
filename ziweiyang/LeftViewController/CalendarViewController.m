//
//  CalendarViewController.m
//  ziweiyang
//
//  Created by bidiao on 2017/10/17.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import "CalendarViewController.h"
#import <WebKit/WebKit.h>
#import "TitleSlider.h"
#import "CalenChilderViewController.h"
#import "AnnotationsViewController.h"


@interface CalendarViewController ()

@property(nonatomic,strong) TitleSlider * slider;
@end

@implementation CalendarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.slider = [TitleSlider new];
    
    CalenChilderViewController * calChilder =[CalenChilderViewController new];
    
    AnnotationsViewController * anChilder =[AnnotationsViewController new];
    
    NSArray * childer = @[calChilder,anChilder];
    
    NSArray * title = @[@"万年历",@"註解"];
    
    
    [self.slider adduiViewcontroll:self title:title addvieController:childer];
    
    
    
    NSString * path = [[NSBundle mainBundle] pathForResource:@"js" ofType:@"jpg"];
    
    UIImageView * image = [[UIImageView alloc]init];
    image.image = [UIImage imageWithContentsOfFile:path];
    image.frame =self.view.frame;
    
    //[self.view addSubview:image];
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
