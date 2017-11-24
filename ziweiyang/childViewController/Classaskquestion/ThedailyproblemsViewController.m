//
//  ThedailyproblemsViewController.m
//  ziweiyang
//
//  Created by bidiao on 2017/11/3.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import "ThedailyproblemsViewController.h"


#import "HYTextView.h"
@interface ThedailyproblemsViewController ()<UITextViewDelegate>
@property(nonatomic,weak) HYTextView * texView;
@end
#define fontColor(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
@implementation ThedailyproblemsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self addview];
}
-(void)addview{
    
    
    UILabel * titlable = [[UILabel alloc]init];
    
    titlable.textColor = [UIColor lightGrayColor];
    NSString * textNstring = @"欢迎提交课程问题\n每天每人可提交1条问题\n提交问题时间 由 10:00am至07:00pm";
    
    NSMutableAttributedString * string = [[NSMutableAttributedString alloc] initWithString:textNstring];
    
    [string addAttribute:NSForegroundColorAttributeName value:fontColor(252,0,0) range:NSMakeRange(27,textNstring.length-27)];
    
    titlable.attributedText = string;
    
    CGSize maximumLabelSize = CGSizeMake( self.view.width-40, MAXFLOAT);
    
    titlable.lineBreakMode = NSLineBreakByTruncatingTail;
    
    titlable.numberOfLines= 0;
    
    CGSize size = [titlable sizeThatFits:maximumLabelSize];
    
    titlable.frame = CGRectMake(10, 10, size.width, size.height);
    
  
    
    [self.view addSubview:titlable];
    
    
    HYTextView * texView = [[HYTextView alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(titlable.frame)+15, self.view.width-20, 200)];
    
    texView.placehoder = @" 请输入问题";
    
    texView.delegate = self;
    
    [self.view addSubview:texView];
    
    self.texView = texView;
    
    UILabel * contlabe = [[UILabel alloc]init];
    
    
    contlabe.text = @". 每日回答题目限额10条，以先到先得为准。\n. 额满为止";
    
    contlabe.numberOfLines  = 0;
    
    CGSize msize = CGSizeMake(self.view.width-30, MAXFLOAT);
    
    
    CGSize asize = [contlabe sizeThatFits:msize];
    
    
    
    contlabe.frame = CGRectMake(10, CGRectGetMaxY(texView.frame)+15, asize.width, asize.height);
    
    [self.view addSubview:contlabe];
    
    
    UIButton * reset =  [[UIButton alloc]init];
    
    reset.frame = CGRectMake(self.view.centerX-10-self.view.width/4, CGRectGetMaxY(contlabe.frame)+30, self.view.width/4-10, 40);
    
    [reset addTarget:self action:@selector(reset) forControlEvents:UIControlEventTouchUpInside];
  //  [reset setImage:[UIImage imageNamed:@"resetBtn"] forState:UIControlStateNormal];
    [reset setBackgroundImage:[UIImage imageNamed:@"resetBtn"] forState:UIControlStateNormal];
    // reset.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:reset];
    
    UIButton * searchbutton = [[UIButton alloc]init];
    
    searchbutton.frame = CGRectMake(self.view.centerX+10, reset.y, reset.width, reset.height);
    
   
    [searchbutton setBackgroundImage:[UIImage imageNamed:@"enterBtn2"] forState:UIControlStateNormal];
    
    [searchbutton addTarget:self action:@selector(tiaojiaobutton) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:searchbutton];
    
}
-(void)reset{
    
    if (self.texView.text) {
        
        self.texView.text = nil;
    }
}

-(void)tiaojiaobutton{
    
    
}

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    
    if([text isEqualToString:@"\n"])
    
    {
        
        [textView resignFirstResponder];
        return NO;
        
    }
    
    return YES;
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
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
