//
//  ContactViewController.m
//  ziweiyang
//
//  Created by bidiao on 2017/10/17.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import "ContactViewController.h"

@interface ContactViewController ()

@end
#define fontColor(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
@implementation ContactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addLableView];
}
-(void)addLableView{
    
    UILabel * textlable = [[UILabel alloc]init];
    
    textlable.text =@"网站内容查询、建议或任何意见、欢迎联络我们。";
    
    textlable.adjustsFontSizeToFitWidth = YES;
   
    textlable.frame = CGRectMake(10, 10, self.view.frame.size.width-10, 40);
    
    [self.view addSubview:textlable];
    
    textlable.textColor = fontColor(139,94,145);

    UILabel * tlable = [[UILabel alloc]init];
    
    tlable.frame=CGRectMake(10, 40, self.view.frame.size.width-10, 120);
    
    tlable.text = @"电邮:  info@ziweiyang.com.hk\n\n电话:  (852)28382115\n\n地址:  香港铜锣湾告士打道256-257信和广场1004室";
    
    tlable.numberOfLines =0;
    
    tlable.textColor = fontColor(142, 141, 135);
    
    [self.view addSubview:tlable];
    
    UIImageView * imageView = [[UIImageView alloc]init];
    
    imageView.frame = CGRectMake(10, CGRectGetMaxY(tlable.frame)+10, self.view.frame.size.width-20, self.view.frame.size.height-260);
    
    NSString * imag =[[NSBundle mainBundle] pathForResource:@"map_ziweiyang" ofType:@"jpg"];
    //NSLog(@" %@ff",imag);
    
   imageView.image =  [UIImage imageWithContentsOfFile:imag];
    
    [self.view addSubview:imageView];
    
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
