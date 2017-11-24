//
//  RegisteredViewController.m
//  ziweiyang
//
//  Created by bidiao on 2017/10/19.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import "RegisteredViewController.h"
#import "ThetermsViewController.h"
#import "PrivacypolicyViewController.h"
#import "NSDate+BRAdd.h"
#import "BRDatePickerView.h"
#import "BRStringPickerView.h"
@interface RegisteredViewController ()<UITextFieldDelegate>

@end
#define fontColor(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
@implementation RegisteredViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.title = @"会员资料";
    // Do any additional setup after loading the view.
    UIImageView * imageView = [[UIImageView alloc]init];
    
    imageView.frame = self.view.frame;
    
    [self.view insertSubview:imageView atIndex:0 ];
    
    imageView.image = [UIImage imageNamed:@"bgPattern"];
    
    [self addView];
}
-(void)addView{
    
    UIScrollView * scrollView = [[UIScrollView alloc]initWithFrame:self.view.frame];
    
    [self.view addSubview:scrollView];
    
    UIImageView * imageView = [UIImageView new];
    
    imageView.frame = CGRectMake(10, 10, scrollView.width/2, (scrollView.width/3)*3/4);
    
    imageView.image = [UIImage imageNamed:@"logo"];
    
    imageView.centerX =scrollView.centerX;
    
    [scrollView addSubview:imageView];
    
    UILabel * labetext = [[UILabel alloc]init];
    
    labetext.frame = CGRectMake(2, CGRectGetMaxY(imageView.frame)+10, imageView.width/2, 30);
    
    labetext.centerX = scrollView.centerX;
    
    labetext.textColor = fontColor(108, 38, 26);
    
    labetext.text = @"会员注册";
    
    [scrollView addSubview:labetext];
    
    NSArray * array = @[@" 电子邮件",@" 密码",@" 确认密码",@" 名称",@" 电话",@" 通讯地址",@" 送货地址"];
    
    for (int i=0; i<array.count; i++) {
        
        [self texttitle:array[i] textframe:CGRectMake(10, (CGRectGetMaxY(labetext.frame)+10)+(50*i), (scrollView.width-30), 40) inttag:i scrolleView:scrollView];
    }
   
   
     UIButton * sexbutton = [[UIButton alloc]init ];
    
    [self button:sexbutton frame:CGRectMake(10, (CGRectGetMaxY(labetext.frame)+10)+350, (scrollView.width-30), 40) title:@"性别" intage:16 scrolleview:scrollView];
//    [sexbutton setTitle:@"性别" forState:UIControlStateNormal];
//
//    [sexbutton addTarget:self action:@selector(sexButton) forControlEvents:UIControlEventTouchUpInside];
//
//    sexbutton.frame =CGRectMake(10, (CGRectGetMaxY(labetext.frame)+10)+350, (scrollView.width-30), 40);
//
//    sexbutton.centerX = scrollView.centerX;
//
//    sexbutton.titleEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
//
//    sexbutton.backgroundColor = [UIColor whiteColor];
//
//    [sexbutton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
//  //  sexbutton.titleLabel.textAlignment= NSTextAlignmentLeft;
//    sexbutton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
//    [scrollView addSubview:sexbutton];
    
    [self texttitle:@"介绍人电邮地址" textframe:CGRectMake(10, CGRectGetMaxY(sexbutton.frame)+10, scrollView.width-30, 40) inttag:8 scrolleView:scrollView];
    
    UIImageView * imagew = [[UIImageView alloc]init];
    
    imagew.frame = CGRectMake(sexbutton.x, CGRectGetMaxY(sexbutton.frame)+60, 20, 20);
    
    imagew.image = [UIImage imageNamed:@"forgetPwd"];
    
    [scrollView addSubview:imagew];
    
    UILabel * textlabel = [[UILabel alloc]init];
    
    textlabel.frame = CGRectMake(CGRectGetMaxX(imagew.frame)+10, imagew.y-5, scrollView.width/3, 30);
    
    textlabel.text = @"出生地时区:";
    
    textlabel.textColor = fontColor(91, 57, 0);
    
    [scrollView addSubview:textlabel];
    
    UIButton * borndate = [[UIButton alloc]init];
    
     [self button:borndate frame:CGRectMake(10, CGRectGetMaxY(textlabel.frame)+10, (scrollView.width-30), 40) title:@"选择出生日期" intage:17 scrolleview:scrollView];
    
    UIButton * borntime = [[UIButton alloc]init];
    
    [self button:borntime frame:CGRectMake(10, CGRectGetMaxY(borndate.frame)+10, (scrollView.width-30), 40) title:@"出生时间" intage:18 scrolleview:scrollView];

    UIButton * borntimezone = [[UIButton alloc]init];
    
    [self button:borntimezone frame:CGRectMake(10, CGRectGetMaxY(borntime.frame)+10, (scrollView.width-30), 40) title:@"选择出生时区" intage:19 scrolleview:scrollView];

    UILabel  * texable = [[UILabel alloc]init];
    
     texable.numberOfLines = 0;
    
    
    
    texable.textColor =fontColor(91, 57, 0);
    
    texable.text = @"紫薇命盘依据出生日期生成，请据实填写，填写后只有一次更改机会，而出生时间则可作无限次修改，敬请留意！";
    
    
    CGSize  maxsize = CGSizeMake(scrollView.width-30, MAXFLOAT);
    
    CGSize size = [texable sizeThatFits:maxsize];
    
   
    
   texable.frame = CGRectMake(10, CGRectGetMaxY(borntimezone.frame)+10, size.width, size.height);
   
    texable.backgroundColor = [UIColor clearColor];
    
    [scrollView addSubview:texable];
    
    UIButton * selebuttontiao = [[UIButton alloc]init];
    
    [self addbuton:selebuttontiao frame:CGRectMake(scrollView.width/3, CGRectGetMaxY(texable.frame)+10, 20, 20) title:@"我同意使用条款" view:scrollView action:@selector(selectbutton:) tage2:40];
    
    UIButton * selecbuttontiao2 =[[UIButton alloc]init];
    
    [self addbuton:selecbuttontiao2 frame:CGRectMake(scrollView.width/3, CGRectGetMaxY(selebuttontiao.frame)+10, 20, 20) title:@"我同意隐私政策" view:scrollView action:@selector(selectbutton2:) tage2:41];
    
    // CGRectGetMaxY(selecbuttontiao2.frame)+60;
    
    UIButton * registebutton = [[UIButton alloc]init];
    
    registebutton.frame = CGRectMake(10, CGRectGetMaxY(selecbuttontiao2.frame)+10, scrollView.width-30, 40);
    
    [registebutton addTarget:self action:@selector(zongbutton) forControlEvents:UIControlEventTouchUpInside];
    
    [registebutton setBackgroundImage:[UIImage imageNamed:@"signup_reg"] forState:UIControlStateNormal];
    
    [scrollView addSubview:registebutton];
    
    scrollView.contentSize = CGSizeMake(self.view.width, CGRectGetMaxY(registebutton.frame)+80);
}
-(void)addbuton:(UIButton*)btn frame:(CGRect)rect title:(NSString*)title view:(UIScrollView*)scrollView action:(SEL)acton tage2:(int)tage2{
    
    
    
    [btn setImage:[UIImage imageNamed:@"checkBox"] forState:UIControlStateNormal];
    
    btn.frame = rect;
   // btn.backgroundColor = [UIColor redColor];
    [btn setImage:[UIImage imageNamed:@"checkBox_tick"] forState:UIControlStateSelected];
    
    [btn addTarget:self action:acton forControlEvents:UIControlEventTouchUpInside];
    
    [scrollView addSubview:btn];
    
    UIButton * btn2 = [[UIButton alloc]init];
    
    [btn setTitle:title forState:UIControlStateNormal];
    
    btn2.tag = tage2;
    
    [btn2 addTarget:self action:@selector(clickback:) forControlEvents:UIControlEventTouchUpInside];
   
    [btn2 setTitle:title forState:UIControlStateNormal];
    
    [btn2 setTitleColor:fontColor(91, 57, 0) forState:UIControlStateNormal];
    
    btn2.titleLabel.adjustsFontSizeToFitWidth = YES;
    
    btn2.frame = CGRectMake(CGRectGetMaxX(btn.frame)+5, btn.y-5, scrollView.width/3, 30);
    
    [scrollView addSubview:btn2];
    
    
    
}
-(void)clickback:(UIButton*)btn{
    
    if (btn.tag==40) {
        [self.navigationController pushViewController:[ThetermsViewController new] animated:YES];
    }else if (btn.tag==41){
        
         [self.navigationController pushViewController:[PrivacypolicyViewController new] animated:YES];
    }
    NSLog(@"跳转");
    
}
-(void)selectbutton:(UIButton*)btn{
    
    btn.selected = !btn.selected;
    
    
    
}-(void)selectbutton2:(UIButton*)btn{
    
    btn.selected = !btn.selected;
    
    
    
}
-(void)zongbutton{
    
    NSLog(@"总");
}
-(void)button:(UIButton*)sexbutton frame:(CGRect)rect title:(NSString*)title intage:(int)tage scrolleview:(UIScrollView*)scrollView{
    
   // UIButton * sexbutton = [[UIButton alloc]init ];
    
    [sexbutton setTitle:title forState:UIControlStateNormal];
    
    [sexbutton addTarget:self action:@selector(sexButton:) forControlEvents:UIControlEventTouchUpInside];
    
    sexbutton.tag = tage;
    
    sexbutton.frame =rect;
    
    sexbutton.centerX = scrollView.centerX;
    
    sexbutton.titleEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
    
    sexbutton.backgroundColor = [UIColor whiteColor];
    
    [sexbutton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    //  sexbutton.titleLabel.textAlignment= NSTextAlignmentLeft;
    sexbutton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [scrollView addSubview:sexbutton];
    
}
-(void)texttitle:(NSString*)title textframe:(CGRect)frame inttag:(int)i scrolleView:(UIScrollView*)scrollView{
    
    
    UITextField * text = [[UITextField alloc]init];
    
    text.tag = i;
    
    text.backgroundColor = [UIColor whiteColor];
    
    text.frame = frame;
    
    text.centerX = scrollView.centerX;
    
    text.placeholder = title;
    
    text.delegate = self;
    
    text.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, 40)];
    
    text.leftViewMode = UITextFieldViewModeAlways;
    
    [text addTarget:self action:@selector(handtext:) forControlEvents:UIControlEventEditingDidEnd];
    
    [scrollView addSubview:text];
    
    
    
    
}
-(void)addBtutton:(UIButton*)button title:(NSString*)title{
    
    
    
    [button setTitle:title forState:UIControlStateNormal];
    
    [button setTitleColor:fontColor(91, 57, 0) forState:UIControlStateNormal];
    
}
-(void)sexButton:(UIButton*)btn{
     __weak typeof(self) mySelf = self;
    if (btn.tag==16) {
        
        [BRStringPickerView showStringPickerWithTitle:@"性别" dataSource:@[@"男", @"女"] defaultSelValue:@"男" isAutoSelect:YES resultBlock:^(id selectValue) {
            UIButton * button =   [mySelf.view viewWithTag:16];
            
            
            [mySelf addBtutton:button title:selectValue];
            NSLog(@" %@",selectValue);
           
        }];
        
        
    }else if (btn.tag==17) {
       
        [BRDatePickerView showDatePickerWithTitle:@"" dateType:UIDatePickerModeDate defaultSelValue:@"" minDateStr:@"" maxDateStr:[NSDate currentDateString] isAutoSelect:YES resultBlock:^(NSString *selectValue) {
            
         UIButton * button =   [mySelf.view viewWithTag:17];
            
           
            [mySelf addBtutton:button title:selectValue];
            //NSLog(@" %@",selectValue);
        }];
    }else if (btn.tag==18){
        NSString * path = [[NSBundle mainBundle]pathForResource:@"datetime" ofType:@"plist"];
        NSArray * timearray = [NSArray arrayWithContentsOfFile:path];
        
        [BRStringPickerView showStringPickerWithTitle:@"" dataSource:timearray defaultSelValue:@"" isAutoSelect:YES resultBlock:^(id selectValue) {
    
            UIButton * button =   [mySelf.view viewWithTag:18];
     
           [mySelf addBtutton:button title:selectValue];
            }];
    }else if (btn.tag==19){
        
        [BRStringPickerView showStringPickerWithTitle:@"出生时区" dataSource:@[@"男", @"女"] defaultSelValue:@"" isAutoSelect:YES resultBlock:^(id selectValue) {
    
        UIButton * button =   [mySelf.view viewWithTag:19];
            
        [mySelf addBtutton:button title:selectValue];
            
          
        }];
    }
    
}
-(void)handtext:(UITextField*)textfield{
    
    NSLog(@"%@",textfield.text);
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return YES;
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
