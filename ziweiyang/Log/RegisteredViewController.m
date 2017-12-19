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
#import "Reg.h"
@interface RegisteredViewController ()<UITextFieldDelegate>
@property(nonatomic,strong) Reg * reg;
@property(nonatomic,weak) UIButton * tiaokuang;
@property(nonatomic,weak) UIButton * yingsi;
@property(nonatomic,strong) UIView * viewa;
@end

@implementation RegisteredViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.reg = [Reg new];
    
    self.buttona.hidden = NO;
    
    UIView * view = [[UIView alloc]init];
    
    view.frame = CGRectMake(self.view.width-130, 0, 130, 50);
   // view.backgroundColor = [UIColor yellowColor];
    
    //self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:view];
    self.viewa = view;
    [self.navigationController.navigationBar addSubview:view];
    
 NSArray * suble = self.navigationController.navigationBar.subviews;
    NSLog(@" ------%@",suble);
    
    for (int i=0; i<suble.count; i++) {
        
        if ([suble[i] isKindOfClass:[UIButton class]]) {
            
            self.buttona =   suble[i];
            
           // [button removeFromSuperview];
           // button.isHidden = YES;
           // button.hidden = YES;
            
           self.buttona.hidden= YES;
            //[button setTitle:@"" forState:UIControlStateNormal];
             NSLog(@" ------%@",suble[i]);
          //  button ;
        }
        
        
        
        
    }
    
    self.title = @"会员资料";
    // Do any additional setup after loading the view.
    UIImageView * imageView = [[UIImageView alloc]init];
    
    imageView.frame = self.view.frame;
    
    [self.view insertSubview:imageView atIndex:0 ];
    
    imageView.image = [UIImage imageNamed:@"bgPattern"];
    
    [self addView];
}
-(void)viewWillDisappear:(BOOL)animated{
    
    NSLog(@"消息");
    [self.viewa removeFromSuperview];
    
    [super viewWillDisappear:animated];
    
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
    self.tiaokuang = selebuttontiao;
    
    UIButton * selecbuttontiao2 =[[UIButton alloc]init];
    
    [self addbuton:selecbuttontiao2 frame:CGRectMake(scrollView.width/3, CGRectGetMaxY(selebuttontiao.frame)+10, 20, 20) title:@"我同意隐私政策" view:scrollView action:@selector(selectbutton2:) tage2:41];
    
    // CGRectGetMaxY(selecbuttontiao2.frame)+60;
    
    self.yingsi = selecbuttontiao2;
    
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
    
    self.tiaokuang = btn;
    
    
    
}-(void)selectbutton2:(UIButton*)btn{
    
    btn.selected = !btn.selected;
    
    self.yingsi =btn;
    
}
-(void)zongbutton{
    
    
    if(!self.reg.username.length  || !self.reg.password.length) {
        
        [self enterAsiin:@"提醒" messag:@"用户名或密码没有写"];
        
        return;
    }
    
    
    
  //  NSLog(@" %@  %@",self.reg.password ,self.reg.agsinpassword);
    if (![self.reg.password isEqualToString:self.reg.agsinpassword]) {
        
        //NSLog(@" %@",self.reg.password ,self.reg.agsinpassword);
       [self enterAsiin:@"提醒" messag:@"密码不一样"];
        
        return;
    }
    
    if(!self.tiaokuang.selected  || !self.yingsi.selected) {
        
        [self enterAsiin:@"提醒" messag:@"条款和隐私"];
        
        return;
    }
    
    
    
  
    MBProgressHUD * hud  = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    hud.label.text = @"正在注册....";
    
    
    NSString * string = [NSString stringWithFormat:@"%@api_member_mobile_register.php?username=%@&password=%@&name=%@&contact_no=%@&gender=%@&birth=%@&birth_timeslot=%@&calendar_timezone=%@&address=%@&delivery_address=%@&referral=%@&token=&active=",AppNetWork_Post,self.reg.username,self.reg.password,self.reg.name,self.reg.contact_no,self.reg.gender,self.reg.birth,self.reg.birth_timeslot,self.reg.calendar_timezone,self.reg.address,self.reg.delivery_address,self.reg.referral];
    DefinmySelf;
    [NeworkViewModel POST:string parameters:nil completionHandler:^(id responsObj, NSError *or) {
      
        
        BOOL isSucess = responsObj[@"success"];
        
        NSString * open = responsObj[@"activate_link"];
        
        [hud hideAnimated:YES];
        
        if (isSucess) {
            
            [mySelf enterAsiin:@"提醒" messag:@"注册成功"];
            
            if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:open]]) {
                
                [[UIApplication sharedApplication ] openURL:[NSURL URLWithString:open] options:@{} completionHandler:nil];
                
                
            }
            
            [self.navigationController popViewControllerAnimated:YES];
            
           
            //NSLog(@"成功");
        }else{
            
            NSString *  string = responsObj[@"err_msg"];
            [mySelf enterAsiin:@"提醒" messag: [NSString stringWithFormat:@"注册失败%@",string]];
        }
        
    }];
    
 
    
   // NSLog(@"总");
}
-(void)enterAsiin:(NSString*)title messag:(NSString*)messg{
    
    UIAlertController * aler = [UIAlertController alertControllerWithTitle:title message:messg preferredStyle:UIAlertControllerStyleAlert];
    
    [self presentViewController:aler animated:YES completion:nil];
    
    UIAlertAction * acation = [UIAlertAction actionWithTitle:@"確定" style:UIAlertActionStyleDefault handler:nil];
    
    [aler addAction:acation];
    
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
    
    if (i==1 || i==2) {
        
        text.secureTextEntry = YES;
    }
    
    text.backgroundColor = [UIColor whiteColor];
    
    text.frame = frame;
    
    text.centerX = scrollView.centerX;
    
    text.placeholder = title;
    
    text.delegate = self;
    
    text.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, 40)];
    
    text.leftViewMode = UITextFieldViewModeAlways;
    
    [text addTarget:self action:@selector(handtext:) forControlEvents:UIControlEventEditingChanged];
    
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
            
            if ([selectValue isEqualToString:@"男"]) {
                
                self.reg.gender = @"1";
            }else{
                
                self.reg.gender = @"2";
            }
            
            
            [mySelf addBtutton:button title:selectValue];
          
           
        }];
        
        
    }else if (btn.tag==17) {
       
        [BRDatePickerView showDatePickerWithTitle:@"" dateType:UIDatePickerModeDate defaultSelValue:@"" minDateStr:@"" maxDateStr:[NSDate currentDateString] isAutoSelect:YES resultBlock:^(NSString *selectValue) {
            
         UIButton * button =   [mySelf.view viewWithTag:17];
            
            self.reg.birth = selectValue;
           
            [mySelf addBtutton:button title:selectValue];
            //NSLog(@" %@",selectValue);
        }];
    }else if (btn.tag==18){
//        NSString * path = [[NSBundle mainBundle]pathForResource:@"datetime" ofType:@"plist"];
//        NSArray * timearray = [NSArray arrayWithContentsOfFile:path];
//
        
        NSArray * arr =[Reg dateArray];
        [BRStringPickerView showStringPickerWithTitle:@"" dataSource:arr defaultSelValue:@"" isAutoSelect:YES resultBlock:^(id selectValue) {
#warning 时区
            NSArray * date = [Reg iddateArray];
            
            for (int i=0; i<date.count; i++) {
               
                Reg  *name =date[i];
                if ([selectValue isEqualToString:name.dateName]) {
                    
                    self.reg.birth_timeslot = name.iddate;
                    NSLog(@" %@",self.reg.birth_timeslot);
                }
            }
            
            
            
            UIButton * button =   [mySelf.view viewWithTag:18];
     
           [mySelf addBtutton:button title:selectValue];
            }];
    }else if (btn.tag==19){
       
        NSArray * array =  [Reg addBrithzone];
        
        [BRStringPickerView showStringPickerWithTitle:@"出生时区" dataSource:array defaultSelValue:@"" isAutoSelect:YES resultBlock:^(id selectValue) {
    
        UIButton * button =   [mySelf.view viewWithTag:19];
            self.reg.calendar_timezone = selectValue;
        [mySelf addBtutton:button title:selectValue];
            
          
        }];
    }
    
}
-(void)handtext:(UITextField*)textfield{
    
    if (textfield.tag==0) {
        
        self.reg.username = textfield.text;
        
    }else if (textfield.tag==1){
        
        self.reg.password = textfield.text;
        
    }else if (textfield.tag==2){
        
        self.reg.agsinpassword = textfield.text;
         ///NSLog(@" %@  %@",self.reg.password ,self.reg.agsinpassword);
        
    }else if (textfield.tag==3){
        
        self.reg.name = textfield.text;
        
    }else if (textfield.tag==4){
        
        self.reg.contact_no = textfield.text;
        
    }else if (textfield.tag==5){
        
        self.reg.address = textfield.text;
        
    }else if (textfield.tag==6){
        
        self.reg.delivery_address = textfield.text;
    }else if (textfield.tag ==8){
        
        self.reg.referral = textfield.text;
    }
   // NSLog(@"%@",textfield.text);
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
