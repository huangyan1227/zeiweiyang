//
//  DailyfinancesViewController.m
//  ziweiyang
//
//  Created by bidiao on 2017/10/17.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import "DailyfinancesViewController.h"
#import "ZHDatePickerView.h"
#import "LXKColorChoice.h"
#import "Reg.h"

@interface DailyfinancesViewController ()<ZHDatePickerViewDelegate,LXKColorChoiceDelegate>

@property(nonatomic,weak) UIButton * datebutton;
@property(nonatomic,weak) UIButton * argebutton;
@property(nonatomic,strong) ZHDatePickerView * pickerView;
@property(nonatomic,strong) LXKColorChoice * are;
@property(nonatomic,strong) NSArray * arraArr;

@property(nonatomic,strong) NSString * dateString;

@property(nonatomic,strong) NSString * tstring;

@property(nonatomic,weak) UILabel * textlabel;
@end
#define fontColor(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]

@implementation DailyfinancesViewController
-(NSArray *)arraArr {
    if (!_arraArr) {
        
       // NSString * parth = [[NSBundle mainBundle]pathForResource:@"partTime.plist" ofType:nil];
        
        _arraArr = [Reg dailyLuckArray];
    }
    
    return _arraArr;
    
}
-(ZHDatePickerView *)pickerView {
    if (!_pickerView) {
        _pickerView = [[ZHDatePickerView alloc]initDatePickerWithDefaultDate:nil andDatePickerMode:UIDatePickerModeDate];
        
        _pickerView.delegate = self;
    }
    
    return _pickerView;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addview];
    
  //  self.view.backgroundColor = [UIColor colorWithDisplayP3Red:<#(CGFloat)#> green:<#(CGFloat)#> blue:<#(CGFloat)#> alpha:<#(CGFloat)#>]
    
}
-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    NSLog(@"开始");
}
-(void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    
    NSLog(@"添加");
}
-(void)addview{
    
    UIButton * buttonage= [[UIButton alloc]init];
    
    buttonage.frame = CGRectMake(0, 15, (self.view.width-80), 200);
    
    buttonage.centerX = self.view.centerX;
    
    [self.view addSubview:buttonage];
    
    [buttonage setImage:[UIImage imageNamed:@"predictionHeader"] forState:UIControlStateNormal];
    
    buttonage.imageEdgeInsets = UIEdgeInsetsMake(-10, 0, 0, -buttonage.titleLabel.width);
   // buttonage.backgroundColor = [UIColor yellowColor];
    
    
    [buttonage addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    
    [buttonage setTitle:@"奇门遁甲每日财运简介，請按此" forState:    UIControlStateNormal];
    
    buttonage.titleLabel.font = [UIFont systemFontOfSize:15];
    
    [buttonage setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    
    buttonage.adjustsImageWhenHighlighted = NO;
    
   // buttonage.titleLabel.textAlignment= NSTextAlignmentCenter;
    
    buttonage.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    buttonage.titleEdgeInsets = UIEdgeInsetsMake(buttonage.imageView.height, -(buttonage.imageView.width+buttonage.titleLabel.width), 0, 0);
    
    UILabel * titlelabe = [[UILabel alloc]init];
    
    titlelabe.frame = CGRectMake(0, CGRectGetMaxY(buttonage.frame)+15, (self.view.width-60), 40);
    
    titlelabe.centerX = self.view.centerX;
    
    titlelabe.text = @"請輸入出生年份、年份、月份、日期、時間。";
    
    //titlelabe.textAlignment = NSTextAlignmentCenter;
    // [UIColor colorWithRed:139/255.0 green:94/255.0 blue:145/255.0 alpha:1]
    titlelabe.textColor = fontColor(139,94,145);
    
    [self.view addSubview:titlelabe];
 
    UIButton * datebutton = [[UIButton alloc]init];
 
    [self addbuton:datebutton rect:CGRectMake(0, CGRectGetMaxY(titlelabe.frame)+15, self.view.width-50, 40) image:@"" action:@selector(clickdate) title:@"選擇出生日期"];
    
    datebutton.centerX = self.view.centerX;
    
     self.datebutton = datebutton;
    
    UIButton * regionaldate =[[UIButton alloc]init];
    
    self.argebutton = regionaldate;
    
    [self addbuton:regionaldate rect:CGRectMake(0, CGRectGetMaxY(datebutton.frame)+10, self.view.width-50, 40) image:@"" action:@selector(regionClick) title:@"所在地時間   "];
    
    regionaldate.titleLabel.adjustsFontSizeToFitWidth = YES;
    
    regionaldate.centerX = self.view.centerX;
    
    UIButton * reset =  [[UIButton alloc]init];
    
    reset.frame = CGRectMake(self.view.centerX-10-self.view.width/4, CGRectGetMaxY(regionaldate.frame)+20, self.view.width/4, 40);
    
    [reset addTarget:self action:@selector(reset) forControlEvents:UIControlEventTouchUpInside];
    //[reset setImage:[UIImage imageNamed:@"resetBtn"] forState:UIControlStateNormal];
    
      [reset setBackgroundImage:[UIImage imageNamed:@"resetBtn"] forState:UIControlStateNormal];
    // reset.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:reset];
    
    UIButton * searchbutton = [[UIButton alloc]init];
    
    searchbutton.frame = CGRectMake(self.view.centerX+10, reset.y, reset.width, 40);

    
   // [searchbutton setImage:[UIImage imageNamed:@"enterBtn3"] forState:UIControlStateNormal ];
      [searchbutton setBackgroundImage:[UIImage imageNamed:@"enterBtn3"] forState:UIControlStateNormal];
    
    [searchbutton addTarget:self action:@selector(searchbutton) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:searchbutton];
    
    
    UILabel * textlabel = [[UILabel alloc]init];
    
    textlabel.font = [UIFont systemFontOfSize:22];
    
    textlabel.numberOfLines = 0;
    
    textlabel.textAlignment = NSTextAlignmentCenter;
    
   // CGSize  maxSize = CGSizeMake(self.view.width/2, MAXFLOAT);
    
  //  CGSize  size = [textlabel sizeThatFits:maxSize];
    
    textlabel.frame = CGRectMake(2, CGRectGetMaxY(searchbutton.frame)+20, self.view.width/2, 80);
    
    textlabel.textColor = fontColor(71, 0, 99);
    
    textlabel.centerX = self.view.centerX;
    
    self.textlabel = textlabel;
    
    [self.view addSubview:textlabel];
    
}
-(void)clickdate{
    
    [self.pickerView show:self.view.center];
    
    
}
-(void)pickerView:(ZHDatePickerView *)pickerView didSelectDateString:(NSString *)dateString{
    
    [self setbuttonTie:self.datebutton title:dateString];
    
    self.dateString = dateString;
    
}
-(void)setbuttonTie:(UIButton*)button title:(NSString *)title{
    
    [button setTitle:title forState:UIControlStateNormal];
    
    [button setTitleColor:fontColor(117, 94, 48) forState:UIControlStateNormal];
    
}

-(void)regionClick{
    
    //NSLog(@" %@",self.arraArr);
    _are = [LXKColorChoice makeViewWithMaskDatePicker:self.view.frame setTitle:@"请选择" Arr:self.arraArr];
    self.are.delegate = self;
  
    
}
-(void)getColorChoiceValues:(NSString *)values{
    
    [self setbuttonTie:self.argebutton title:values];
    
    NSArray * valueArrauy = [Reg valueArray];
    
    
    for (int i=0;i <valueArrauy.count;i++) {
        
        
        Reg * reg = valueArrauy[i];
        
        if ([reg.dailyName isEqualToString:values]) {
            
            
              self.tstring = reg.valuedaily;
        }
        
       
        
    }
   
    
    
}
-(void)addbuton:(UIButton*)btn rect:(CGRect)rect image:(NSString*)imageString action:(SEL)action title:(NSString*)title{
                             
   
    btn.frame = rect;
    
    [btn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
    
    //[btn setBackgroundImage:[UIImage imageNamed:@"purTri"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"purTri"] forState:UIControlStateNormal];
    

    [btn setTitle:title forState:UIControlStateNormal];
    
    [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    
   btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    
    btn.titleLabel.textAlignment  = NSTextAlignmentLeft;
    
    btn.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, btn.imageView.width);
    
    btn.backgroundColor = [UIColor whiteColor];
    btn.imageEdgeInsets = UIEdgeInsetsMake(0,btn.width-btn.imageView.width, 0, 0);
    

}
-(void)searchbutton{
    
    if (!self.dateString.length || !self.tstring.length) {
        
        return;
    }
    
    NSLog(@" %@",self.dateString);
    
    NSArray   * time = [self.dateString componentsSeparatedByString:@"-"];
    
    NSString * string = [NSString stringWithFormat:@"%@api_get_daily_predict.php?y=%@&m=%@&d=%@&t=%@&lang=3&token=%@&active=",AppNetWork_Post,time[0],time[1],time[2],self.tstring,AppToken_USER_COOKIE];

    
    
    [NeworkViewModel POST:string parameters:nil completionHandler:^(id responsObj, NSError *or) {
        
      //  NSLog(@" %@",responsObj);
        BOOL issucess = responsObj[@"success"];
        if (issucess) {
            
            self.textlabel.text = [NSString stringWithFormat:@"%@\n\n%@",responsObj[@"out"],responsObj[@"out2"]];
            
        }
        
        
        
        
        
    }];
    
    
}
-(void)reset{
    
    
    [self button:self.datebutton title:@"選擇出生日期"];
    [self button:self.argebutton title:@"所在地時間   "];
    
}
-(void)button:(UIButton*)button title:(NSString*)title{
    
    
    [button setTitle:title forState:UIControlStateNormal];
    
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    
}

-(void)click{
    
    //NSLog(@"点击");
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
