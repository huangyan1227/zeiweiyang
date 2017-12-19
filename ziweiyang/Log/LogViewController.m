//
//  LogViewController.m
//  ziweiyang
//
//  Created by bidiao on 2017/10/19.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import "LogViewController.h"
#import "RetrievethepasswordViewController.h"
#import "RegisteredViewController.h"

@interface LogViewController ()<UITextFieldDelegate>
{
    UITextField * textUser;
    UITextField * textPwd;
    UIImageView * imageView;
    UIView      * vlogin;
    
    
}
@property(nonatomic,weak) UIButton * jbutton;

@property(nonatomic,strong) NSString * path;
#define mainSize    [UIScreen mainScreen].bounds.size
@end

@implementation LogViewController
-(NSString *)path {
    if (!_path) {
        
        _path = [urlpath stringByAppendingPathComponent:@"username.plist"];
    }
    
    return _path;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.button.hidden =YES;
  //  self.view.backgroundColor = [UIColor colorWithDisplayP3Red:253/255.0 green:243/255.0 blue:224/255.0 alpha:1];
    
    UIImageView * imageView = [[UIImageView alloc]init];
    
    imageView.frame = self.view.frame;
    
    [self.view insertSubview:imageView atIndex:0 ];
    
    imageView.image = [UIImage imageNamed:@"bgPattern"];
    
    [self logView];
    
    [self addNotionfication];
    
    
    [self initDataByPlist];
   
    //self.navigationItem.rightBarButtonItem =[]
    // Do any additional setup after loading the view.
}
-(void)addNotionfication{
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(appenbackgrund) name:UIApplicationDidEnterBackgroundNotification object:[UIApplication sharedApplication]];
    
    
    
}
-(void)appenbackgrund{
    
    NSString *nameStr = textUser.text;
    
    NSString *pwdStr = textPwd.text;
    
    NSDictionary *dic = @{@"name":nameStr,@"pass":pwdStr};
    
    [dic writeToFile:self.path atomically:YES];
    
    
}
-(void)initDataByPlist{
    
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:self.path]) {
        
        NSDictionary * dataDic = [NSDictionary dictionaryWithContentsOfFile:self.path];
        
        self.jbutton.selected = YES;
        
        textUser.text =[dataDic objectForKey:@"name"];
        
        textPwd.text =[dataDic objectForKey:@"pass"];
        
        
    }
    
    
    
    
}
-(void)addView{
    
    UIButton *bu = [[UIButton alloc]init];
    
    
    bu.frame =CGRectMake(0, 0, 60, 40);
    
    [bu addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    
    [bu setTitle:@"返回" forState:UIControlStateNormal];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:bu];
    
    
    
}

-(void)back{
    
    
    NSArray * arry= self.navigationController.navigationBar.subviews;
    
   // NSLog(@"%@",arry);
    for (int i = 0;i<arry.count; i++) {
        
        if ([arry[i] isKindOfClass: [UIButton class]]) {
            
            UIButton * button = arry[i];
            button.hidden = NO;
        }
        
    }
    [self.navigationController popViewControllerAnimated:YES];
    
    
    
    
    
}

-(void)logView{
    
    
    vlogin = [[UIView alloc]initWithFrame:CGRectMake(10, 10, mainSize.width-20, mainSize.height*3/4)];
    
    [self.view addSubview:vlogin];
    
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(vlogin.centerX, 10, vlogin.width*2/4, 120)];
    
    imageView.image = [UIImage imageNamed:@"logo"];
    
    imageView.centerX = vlogin.centerX;
    
    [self.view addSubview:imageView];
    
   // imageView.backgroundColor = [UIColor yellowColor];
    
    textUser = [[UITextField alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(imageView.frame)+20, vlogin.width, 40)];
    
    [self testfiled:textUser string:@"" placeholder:@"请输入账号"];
    
    textPwd = [[UITextField alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(textUser.frame)+10, vlogin.width, 40)];
    
    [self testfiled:textPwd string:@"" placeholder:@"请输入密码"];
    
    textPwd.secureTextEntry = YES;
    
    UIButton * jbu = [[UIButton alloc]init];

    //jbu.backgroundColor = [UIColor redColor];
 
    [self addbuton:jbu frame:CGRectMake(0, CGRectGetMaxY(textPwd.frame)+10, 20, 20) view:vlogin sel:@selector(jibutton:) title:@""];
    self.jbutton = jbu;
    [jbu setBackgroundImage:[UIImage imageNamed:@"checkBox.png"] forState:UIControlStateNormal];
   
    jbu.adjustsImageWhenHighlighted = NO;
    
    [jbu setBackgroundImage:[UIImage imageNamed:@"checkBox_tick.png"] forState:UIControlStateSelected];
    
 
    UILabel * labetext =[[UILabel alloc]init];
    
    labetext.frame = CGRectMake(CGRectGetMaxX(jbu.frame)+8, jbu.y, 80, 20);
    
    labetext.text =@"记着密码";
    
    labetext.textColor =  [UIColor colorWithDisplayP3Red:104/255.0 green:79/255.0 blue:35/255.0 alpha:1];
    
    [vlogin addSubview:labetext];
    

    UIButton * wangjm = [[UIButton alloc]init];
    
    [wangjm setTitleColor:[UIColor colorWithDisplayP3Red:104/255.0 green:79/255.0 blue:35/255.0 alpha:1] forState:UIControlStateNormal];
   
    
     [self addbuton:wangjm frame:CGRectMake(vlogin.width-80, CGRectGetMaxY(textPwd.frame)+10, 80, 20) view:vlogin sel:@selector(wangjimima) title:@"忘记密码"];
    
    
    
    
    
    
    UIButton * denglu = [[UIButton alloc]init];
    [self addbuton:denglu frame:CGRectMake(0, CGRectGetMaxY(jbu.frame)+10, vlogin.width, 40) view:vlogin sel:@selector(denglu:) title:@""];

   
     [denglu setBackgroundImage:[UIImage imageNamed:@"signin.png"] forState:UIControlStateNormal];
    UIButton * zhuce = [[UIButton alloc]init];
    [self addbuton:zhuce frame:CGRectMake(0, CGRectGetMaxY(denglu.frame)+10, vlogin.width, 40) view:vlogin sel:@selector(zhuce:) title:@""];
   // zhuce.backgroundColor = [UIColor greenColor];
    [zhuce setBackgroundImage:[UIImage imageNamed:@"signup.png"] forState:UIControlStateNormal];
   
}
-(void)zhuce:(UIButton*)zhbu{
    
    RegisteredViewController * registe = [RegisteredViewController new];
    
    
    registe.buttona = self.button;
    
    //self.button.hidden =YES;
    
    [self.navigationController pushViewController:registe animated:YES];
    //NSLog(@"注册");
}

-(void)addbuton:(UIButton*)btn frame:(CGRect)rect view:(UIView*)view sel:(SEL)action title:(NSString*)title{
    
    btn.frame =  rect;
    
    [btn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    
    [btn setTitle:title forState:UIControlStateNormal];
    
    //btn.backgroundColor = [UIColor greenColor];
    
    [vlogin addSubview:btn];
    
    
    
    
    
}

-(void)denglu:(UIButton *)deg{
    //https://www.ziweiyang.com/api_get_login.php?u=bigmeo2013@gmail.com&p=password
    //bigmeo2013@gmail.com
    //password
    
    textUser.text = @"bigmeo2013@gmail.com";
    
    textPwd.text =@"password";
    
    if (textUser.text.length==0) {
        
        [self enterAsiin:@"提醒" messag:@"密碼或賬號空 請重新輸入"];
        
        return;
    }
    
    MBProgressHUD * hup =[MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    hup.label.text =@"正在登錄";
    
    NSString * string =[NSString stringWithFormat:@"%@api_get_login.php?u=%@&p=%@",AppNetWork_Post,textUser.text,textPwd.text];
    
    
    DefinmySelf;
    [NeworkViewModel POST:string parameters:nil completionHandler:^(id responsObj, NSError *or) {
    
        
        if (or) {
            [hup hideAnimated:YES];
            
            //[myslef enterAgsin:@"提醒" messag:@"請檢查網絡"];
            [mySelf enterAsiin:@"提醒" messag:@"請檢查網絡"];
            NSLog(@"失败");
            return ;
            
        }
        NSDictionary * ditct = responsObj;
        
       // AppLog_State = true;\
        
        BOOL state =ditct[@"success"];
        
        if (state) {
            
            if (mySelf.jbutton.selected) {
             
                [mySelf appenbackgrund];
                
            }
      
   
        AppLog_State = state;
        
        AppToken_USER_COOKIE = ditct[@"token"];
        
        AppUserName_USER = textUser.text;
        
        AppPassword_PASSWORD = textPwd.text;
            
        [hup hideAnimated:YES];
            
        dispatch_async(dispatch_get_main_queue(), ^{
            
           //   self.button.hidden = NO;
                
        [mySelf.navigationController popViewControllerAnimated:YES];
           
        });
            
        }else{
            
               [mySelf enterAsiin:@"提醒" messag:@"密码和用户名错误"];
            
        }
        
         [hup hideAnimated:YES];
       
    }];
   
    
}
-(void)wangjimima{
    
    //[self dismissViewControllerAnimated:YES completion:nil];
    
    RetrievethepasswordViewController*retrieve =   [RetrievethepasswordViewController new];
    
    retrieve.logbutton = self.button;
    [self.navigationController pushViewController:retrieve animated:true];
  //  NSLog(@"忘记");
    
}
-(void)jibutton:(UIButton*)bg{
    
    bg.selected = !bg.selected;
    NSLog(@"记住米每秒");
    if (bg.selected) {
        [self appenbackgrund];
    }else{
        
        //移除
        [self reomveFile];
    }
    
}
-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    self.button.hidden =YES;
    
}
//移除
-(void)reomveFile{
    
    NSFileManager * filer = [NSFileManager defaultManager];
    
    if ([filer fileExistsAtPath:self.path]){
       // NSLog(@"ddd");
        self.jbutton.selected = NO;
        
        [filer removeItemAtPath:self.path error:nil];
        
    }
}
-(void)viewWillDisappear:(BOOL)animated{
    
    self.button.hidden = NO;
    if (AppLog_State) {
        
        [self.button setTitle:@"成功登录" forState:UIControlStateNormal];
    }else{
        
         [self.button setTitle:@"登录" forState:UIControlStateNormal];
        
    }
    
    [super viewWillDisappear:animated];
   // NSLog(@"简要小时");
}

-(void)enterAsiin:(NSString*)title messag:(NSString*)messg{
    
    UIAlertController * aler = [UIAlertController alertControllerWithTitle:title message:messg preferredStyle:UIAlertControllerStyleAlert];
    
    [self presentViewController:aler animated:YES completion:nil];
    
    UIAlertAction * acation = [UIAlertAction actionWithTitle:@"確定" style:UIAlertActionStyleDefault handler:nil];
    
    [aler addAction:acation];
    
}
-(void)testfiled:(UITextField *)textfiled string:(NSString *)text placeholder:(NSString *)placeholdertext{
    
    textfiled.delegate = self;
    
    //[textfiled setTextColor:[UIColor whiteColor]];
    
     textfiled.backgroundColor = [UIColor whiteColor];
    
    textfiled.placeholder = placeholdertext;
    
    textfiled.clearButtonMode =UITextFieldViewModeWhileEditing;
    
    textfiled.leftViewMode = UITextFieldViewModeAlways;
    
    textfiled.leftView =[[UIView alloc]initWithFrame:CGRectMake(0, 0, 60, 44)];
    
    // textfiled.layer.shadowOffset = CGSizeMake(1, 1);
    
    //textfiled.layer.shadowColor = [UIColor blackColor].CGColor;
    
    //textfiled.layer.shadowOpacity = 0.8;
    
    [vlogin addSubview:textfiled];
    
    //阴影
//    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
//    gradientLayer.colors = @[(__bridge id)[UIColor colorWithRed:29/255.0 green:129/255.0 blue:72/255.0 alpha:1].CGColor, (__bridge id)[UIColor colorWithRed:125/255.0 green:201/255.0 blue:134/255.0 alpha:1].CGColor];
//
//    gradientLayer.locations = @[@0.1, @1.0];
//
//    gradientLayer.startPoint = CGPointMake(0, 0);
//
//    gradientLayer.endPoint = CGPointMake(1.0, 0);
//
//    gradientLayer.frame = CGRectMake(0, 0, textfiled.width,textfiled.height);
//
//    gradientLayer.cornerRadius =5;
//
//    gradientLayer.shadowOffset =CGSizeMake(1, 1);
//    gradientLayer.shadowColor = [UIColor blackColor].CGColor;
//    gradientLayer.shadowOpacity = 0.8;
//
//    [textfiled.layer addSublayer:gradientLayer];
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textUser resignFirstResponder];
    
    [textPwd resignFirstResponder];
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
