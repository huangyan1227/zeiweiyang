//
//  RetrievethepasswordViewController.m
//  ziweiyang
//
//  Created by bidiao on 2017/10/20.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import "RetrievethepasswordViewController.h"
@interface RetrievethepasswordViewController ()<UITextFieldDelegate>
{
    UITextField * textUser;
    UITextField * textPwd;
    UIImageView * imageView;
    UIView      * vlogin;
    
    
}
@property(nonatomic,strong) UIView * viewa;
#define mainSize    [UIScreen mainScreen].bounds.size
@end

@implementation RetrievethepasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.logbutton.hidden=YES;
    
    
    UIView * view = [[UIView alloc]init];
    
    view.frame = CGRectMake(self.view.width-130, 0, 130, 50);
    // view.backgroundColor = [UIColor yellowColor];
    
    //self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:view];
    self.viewa = view;
    [self.navigationController.navigationBar addSubview:view];
    
    
  //  self.view.backgroundColor = [UIColor colorWithDisplayP3Red:(CGFloat)253/255.0 green:247/255.0 blue:227/255.0 alpha:1];
    // Do any additional setup after loading the view.
    UIImageView * imageView = [[UIImageView alloc]init];
    
    imageView.frame = self.view.frame;
    
    [self.view insertSubview:imageView atIndex:0 ];
    
    imageView.image = [UIImage imageNamed:@"bgPattern"];
    
    [self addview];
}
-(void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    
    [self.viewa removeFromSuperview];
}
-(void)addview{
    vlogin = [[UIView alloc]initWithFrame:CGRectMake(10, 10, mainSize.width-20, mainSize.height*3/4)];
    
    [self.view addSubview:vlogin];
    
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(vlogin.centerX, 10, vlogin.width*2/4, 120)];
    
    imageView.image = [UIImage imageNamed:@"logo"];
    
    imageView.centerX = vlogin.centerX;
    
    UILabel * labe = [[UILabel alloc]init];
    
    labe.frame = CGRectMake(10, CGRectGetMaxY(imageView.frame)+10, vlogin.width-60, 40);
    
    labe.centerX= imageView.centerX;
    
    labe.textColor = [UIColor colorWithDisplayP3Red:132/255.0 green:80/255.0 blue:140/255.0 alpha:1];
    labe.text = @"取回密码-通过注册邮箱取回密码";
    
    labe.textAlignment = NSTextAlignmentCenter;
    
    [vlogin addSubview:labe];
    
    [self.view addSubview:imageView];
    
    // imageView.backgroundColor = [UIColor yellowColor];
    
    textUser = [[UITextField alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(labe.frame)+20, vlogin.width, 40)];
    
    [self testfiled:textUser string:@"" placeholder:@"请输入邮箱"];
    
    UIButton * tijiao = [[UIButton alloc]init];
    
    tijiao.frame = CGRectMake(0, CGRectGetMaxY(textUser.frame)+10, vlogin.width, 40);
    
    [tijiao setBackgroundImage:[UIImage imageNamed:@"submitEmail"] forState:UIControlStateNormal];
    
    [vlogin addSubview:tijiao];
    
    [tijiao addTarget:self action:@selector(tijiao) forControlEvents:UIControlEventTouchUpInside];
    
}
-(void)tijiao{
    
    [self.navigationController popViewControllerAnimated:YES];
   // NSLog(@"地那就");
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
