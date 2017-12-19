//
//  BBSrecordViewController.m
//  ziweiyang
//
//  Created by bidiao on 2017/11/15.
//  Copyright © 2017年 bidiao. All rights reserved.
//  论坛记录

#import "BBSrecordViewController.h"
#import "TitleSlider.h"
#import "TopicViewController.h"
#import "BBreplyViewController.h"
@interface BBSrecordViewController ()
@property(nonatomic,strong) TitleSlider * titleSlider;
@property(nonatomic,weak) UILabel * labele;

@end

@implementation BBSrecordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleSlider = [[TitleSlider alloc]init];
    
    TopicViewController * topic = [TopicViewController new];
    
   // topic.view.backgroundColor = [UIColor redColor];
    
    BBreplyViewController * reply = [BBreplyViewController new];
    
   // reply.view.backgroundColor = [UIColor yellowColor];
    //  [self addchild:@"紫薇楊" vicontroller:ziyei];
    
   
    
    [self.titleSlider adduiViewcontroll:self title:@[@"我的话题",@"我的回复"] addvieController:@[topic,reply]];
    
    UILabel * labe = [[UILabel alloc]init];
    
    labe.frame = CGRectMake(0, 42, self.view.width, 40);
    
  
    
    labe.textAlignment = NSTextAlignmentCenter;
    
    labe.backgroundColor = fontColor(245, 239, 218);
    
    self.labele = labe;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(denctien:) name:@"name" object:nil];
    //@""
    [self.view addSubview:labe];
    // Do any additional setup after loading the view.
}
-(void)denctien:(NSNotification*)notion{
    
    NSLog(@" %@",notion.userInfo[@"userst"]);
      self.labele.text = [NSString stringWithFormat:@"会员阶级：%@  积分： %@",notion.userInfo[@"huiyuan"],notion.userInfo[@"score"]] ;
    
}
-(void)viewWillDisappear:(BOOL)animated{
     NSLog(@"同学ddd后");
    [[NSNotificationCenter defaultCenter]removeObserver:self];
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
