//
//  CrapemyrtleViewController.m
//  ziweiyang
//
//  Created by bidiao on 2017/10/17.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import "CrapemyrtleViewController.h"

@interface CrapemyrtleViewController ()
@property(nonatomic,weak) UIView * zhuview;
@property(nonatomic,weak) UIView * shuview;
@property(nonatomic,strong)  NSArray * titlarray;
@property(nonatomic,strong)  NSArray * zhongtitle;
@property(nonatomic,strong)  NSArray* leftArray;
@property(nonatomic,strong)  NSArray* rightArray;
@property(nonatomic,strong)  NSArray *zuiArray;
@property(nonatomic,assign)  CGFloat h;

@end
#define fontColor(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]

@implementation CrapemyrtleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addView];
    // Do any additional setup after loading the view.
}
-(void)addView{
    self.titlarray =@[@"天\n机",@"紫\n薇",@"",@"破\n军",@"七\n杀",@"",@"天太\n梁阳",@"天廉\n府贞",@"天武禄\n相曲存",@"巨天\n门同",@"贪\n狼",@"太\n阴"];
    
   self.zhongtitle = @[@"文 破 天 劫 恩\n曲 碎 厨 杀 恩",@"天 天\n哭 虚",@"台 天 天 大\n辅 官 钺 耗",@"天\n刑",@"龙 华 阴\n池 盖 煞",@"天 咸 天 天 文\n喜 池 福 德 昌",@"擎火  左 红 封\n羊 星  辅 鸾 诰",@"地 解 寡 凤\n空 神 宿 阁",@"八天孤天天天\n座月辰马空巫",@"陀   天 天\n罗   魁 贵",@"天 地 天 三\n才 劫 姚 台",@"铃    右\n星    弼"];
 
    self.leftArray = @[ @"小小\n耗耗",@"将大\n军耗",@"奏龙\n书德",@"飞白\n廉虎",@"青官\n龙符",@"喜天\n神德",@"力贯\n士索",@"病吊\n符客",@"博丧\n士门",@"官嗨\n符气",@"伏太\n兵岁",@"太病\n耗符"];
   
    self.rightArray = @[ @"已巳\n奴仆",@"康迁\n午移",@"辛疾\n未厄",@"壬财\n申帛",@"戊官\n辰禄",@"癸子\n酉女",@"丁田\n卯宅",@"甲夫小\n戍妻限",@"丙福身\n寅德宫",@"丁父\n丑母",@"丙命\n子宫",@"乙兄\n亥弟"];
   
    self.zuiArray = @[ @"(52至61)",@"(62至71)",@"(72至81)",@"(82至91)",@"(42至51)",@"(92至101)",@"(32至41)",@"(102至111)",@"(22至31)",@"(12至21)",@"(2至11)",@"(112至121)"];
    
    
     CGFloat w = self.view.width/4;
     CGFloat h = (self.view.height-60)/4;
    
    self.h = h;
    NSLog(@"geee %f,",[[UIApplication sharedApplication] statusBarFrame].size.height);
    NSInteger a = 1;
    NSInteger b = 0;
    for (int d = 0; d<4; d++) {

    for (int i = 0; i<4; i++) {
        
        
        if ((d==1 && i==1) ||( d==1 && i==2) ||(d==2&&i==1) ||(d==2&i==2)) {
            
            if(d==1&&i==1){
                NSLog(@" %fklllk",h);
                
                [self addViewrect:CGRectMake(w, h, 2*w, 2*h)];
                
            }
            
          
            
        }else {
            
            [self addviewframex:w*i farmey:d*h view:nil tag:a title:_titlarray[b] zhongjiantitle:_zhongtitle[b] lefttitle:_leftArray[b] rightString:_rightArray[b] zuiString:_zuiArray[b] isbooL:NO];
            b++;
            a++;
            
        }
            
        
        
       
    }
    
        
    }
    
    
    
    
    
}
-(void)addViewrect:(CGRect)rect{
    
    CGFloat w = self.view.width/4*2;
    CGFloat h = (self.view.height-60)/4*2;
  
    UIView*  view = [[UIView alloc]initWithFrame:rect];
    
    view.backgroundColor = [UIColor clearColor];
    
    self.zhuview = view;
    
    [self.view addSubview:view];
    
    UIImageView * lefimageView = [[UIImageView alloc]init];
    
    lefimageView.frame = CGRectMake(5, 5, w-10, w/4);
    
    lefimageView.image = [UIImage imageNamed:@"chart_mid"];
    
  //  lefimageView.backgroundColor = [UIColor yellowColor];
    
    [view addSubview:lefimageView];
    
//    UILabel * rightimageView = [[UILabel alloc]init];
//
//    rightimageView.frame = CGRectMake(CGRectGetMaxX(lefimageView.frame)+10, 20, view.width/2-25, h/10);
//
//    rightimageView.backgroundColor = fontColor(108, 37, 126);
//
//    rightimageView.text = @"天 盘";
//
//    rightimageView.textAlignment = NSTextAlignmentCenter;
//
//    rightimageView.textColor = [UIColor whiteColor];
//
//    [view addSubview:rightimageView];
    
    UILabel * titlelable = [[UILabel alloc]init];
    
    titlelable.frame = CGRectMake(10, CGRectGetMaxY(lefimageView.frame)+10, view.width/2+20, view.height/2-h/10);
    
    titlelable.centerX = view.width/2;
    
    [view addSubview:titlelable];
    
    titlelable.textAlignment = NSTextAlignmentCenter;
    
    titlelable.adjustsFontSizeToFitWidth = YES;
    
    titlelable.numberOfLines = 0;
    
    titlelable.textColor = fontColor(140,122,96);
    
      NSString * textNstring = @"盧生 鸿造\n西历一九八五年\n一月三十日\n上午一时\n农历甲子年\n十二月初十日\n丑时";

  //  NSString * textNstring = rightString;
    NSMutableAttributedString * string = [[NSMutableAttributedString alloc] initWithString:textNstring];
    
    [string addAttribute:NSForegroundColorAttributeName value:fontColor(0,0,0) range:NSMakeRange(2,3)];
    [string addAttribute:NSForegroundColorAttributeName value:fontColor(117,53,132) range:NSMakeRange(6,2)];
    [string addAttribute:NSForegroundColorAttributeName value:fontColor(117,53,132) range:NSMakeRange(24,3)];
    
     titlelable.attributedText = string;
    
    UILabel * leftlable = [[UILabel alloc]init];
    
    leftlable.frame = CGRectMake(10,view.height-90,view.width/4+10, 30);
    
    leftlable.text = @"水二局";
    
    leftlable.adjustsFontSizeToFitWidth = YES;
    
    [view addSubview:leftlable];
    
    leftlable.textColor = fontColor(140,122,96);
    
    [self addvie:view wcgret:CGRectMake(10, CGRectGetMaxY(leftlable.frame)+2, view.width/6, 20) textString:@"贪狼" imageString:@"fateLead"];
    
    
     [self addvie:view wcgret:CGRectMake(10, view.height-30, view.width/6, 20) textString:@"铃星" imageString:@"bodyLead"];
    
   
    [self addLableView:view textrightstring:@"不论节气" othterString:@"乙己丁甲\n丑巳丑子" rectfarme:CGRectMake(view.width-60, view.height-view.height/4-45, 40, 20)];
    
    [self addLableView:view textrightstring:@"节气四柱" othterString:@"乙己丁甲\n丑巳丑子" rectfarme:CGRectMake(view.width-60, view.height -view.height/8-25, 40, 20)];
    
    
}
-(void)addLableView:(UIView*)view textrightstring:(NSString*)textstring othterString:(NSString*)otrhtestring rectfarme:(CGRect)rect{
    
    UILabel * rightlabel  =[[UILabel alloc]init];
    
    rightlabel.frame = rect;
    
    rightlabel.text =textstring ;
    
    rightlabel.textAlignment = NSTextAlignmentCenter;
    
    rightlabel.adjustsFontSizeToFitWidth = YES;
    
    rightlabel.textColor = [UIColor lightGrayColor];
    
    [view addSubview:rightlabel];
    
    UILabel * riage =[[UILabel alloc]init];
    
    riage.frame  =CGRectMake(view.width-70, CGRectGetMaxY(rightlabel.frame), 60, view.height/8);
    
    riage.adjustsFontSizeToFitWidth = YES;
    riage.textAlignment = NSTextAlignmentCenter;
    riage.text = otrhtestring;
    riage.numberOfLines = 0;
    riage.adjustsFontSizeToFitWidth = YES;
    [view addSubview:riage];
    
    
    
    
    
}
-(void)addvie:(UIView*)viewa wcgret:(CGRect)rect textString:(NSString *)textstrin imageString:(NSString*)string {
    
    UIImageView * mingzhu =[[UIImageView alloc]init];
    
    mingzhu.frame =rect;
    
    mingzhu.image = [UIImage imageNamed:string];
    
    [viewa addSubview:mingzhu];
    
    
    UILabel * minglabel = [[UILabel alloc]init];
    
    minglabel.frame = CGRectMake(CGRectGetMaxX(mingzhu.frame)+5, mingzhu.y-5, 40, 30);
    
    //minglabel.backgroundColor = [UIColor redColor];
    minglabel.textColor =fontColor(140,122,96);
    
    minglabel.text = textstrin;
    
    [viewa addSubview:minglabel];
    
}

-(void)addviewframex:(CGFloat)x farmey:(CGFloat)y view:(UIView*)view tag:(NSInteger)tag title:(NSString*)title zhongjiantitle:(NSString*)zhongtitle lefttitle:(NSString*)leftting rightString:(NSString*)rightString zuiString:(NSString*)zuiString isbooL:(BOOL)isbool{
    
    
    
    CGFloat h ;
    
    CGFloat w ;
    
    if (isbool) {
        
        //self.zhuview =view;
         h = (self.view.height-60)/2;
        
         w = self.view.width/2;
    }else{
          view = [[UIView alloc]init];
          h = (self.view.height-60)/4;
        
          w = self.view.width/4;
        
        view.tag = tag;
        
        view.frame = CGRectMake(x, y, w, h);
      
        view.backgroundColor = [UIColor clearColor];
        
        view.layer.borderColor = [UIColor lightGrayColor].CGColor;
        
        view.layer.borderWidth = 1;
        
        [self.view addSubview:view];
    }
    
    

    
  
    
  
    

    
    UILabel * titlelable = [[UILabel alloc]init];
    
    titlelable.frame = CGRectMake(0, 10, view.width*2/3, view.height/5);
    
    titlelable.numberOfLines = 0;
    
    
    titlelable.adjustsFontSizeToFitWidth = YES;
    
    titlelable.textAlignment = NSTextAlignmentCenter;
    
    titlelable.centerX= view.width/2;
    
    titlelable.text = title;
    
    [view addSubview:titlelable];

    UILabel * lable = [[UILabel alloc]init];
   
  
   
    lable.frame = CGRectMake(5, CGRectGetMaxY(titlelable.frame),view.width-20, view.height/5);

    lable.textAlignment = NSTextAlignmentCenter;
    
    lable.text = zhongtitle;
    
    lable.numberOfLines = 0;
    
    lable.adjustsFontSizeToFitWidth = YES;
    
    [view addSubview:lable];
    
    UILabel * leflable = [[UILabel alloc]init];
    
    leflable.numberOfLines = 0;
    
    
    
    leflable.frame = CGRectMake(10, CGRectGetMaxY(lable.frame)+10, view.width/3, view.height/5);
    
    leflable.text = leftting;
    
    leflable.adjustsFontSizeToFitWidth = YES;
    
    [view addSubview:leflable];
    
    UILabel * jilable  = [[UILabel alloc]init];
    
    jilable.frame = CGRectMake(CGRectGetMaxX(leflable.frame)+10, leflable.y, view.width/2, view.height/5);
    
    jilable.numberOfLines = 0;
    
    jilable.adjustsFontSizeToFitWidth = YES;
    
    NSString * textNstring = rightString;
    
    NSMutableAttributedString * string = [[NSMutableAttributedString alloc] initWithString:textNstring];
    
    [string addAttribute:NSForegroundColorAttributeName value:fontColor(227,127,145) range:NSMakeRange(4,1)];
     [string addAttribute:NSForegroundColorAttributeName value:fontColor(227,127,45) range:NSMakeRange(1,1)];
    [string addAttribute:NSForegroundColorAttributeName value:fontColor(139,94,145) range:NSMakeRange(3,1)];
    jilable.attributedText = string;
    
    [view addSubview:jilable];
    
    UILabel * shujilable =[[UILabel alloc]init];
    
   
    
    shujilable.adjustsFontSizeToFitWidth= YES;
    
    shujilable.textColor = fontColor(140, 124, 97);
    
    shujilable.text = zuiString;
    
    [view addSubview:shujilable];
  
    if (!isbool) {
        
         shujilable.frame = CGRectMake(view.width*2/3-15, view.height-view.height/5-5 , view.width/3+10, view.height/5);
        
        leflable.font = [UIFont systemFontOfSize:12];
        
        titlelable.font = [UIFont systemFontOfSize:13];
        
        lable.font = [UIFont systemFontOfSize:11];
        
        jilable.font = [UIFont systemFontOfSize:12];
        
        UIButton * button =[[UIButton alloc]init];
        
        button.frame = CGRectMake(0, 0, view.width, view.height);
        
        [view addSubview:button];
        
        button.tag = tag+100;
        
        button.backgroundColor = [UIColor clearColor];
        
        [button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        
    }else{
        
         shujilable.frame = CGRectMake(view.width*2/3-15, view.height-view.height/5-30 , view.width/3+10, view.height/5);
        
        UIButton * backbutton = [[UIButton alloc]init];
        
        backbutton.frame = CGRectMake(10, view.height-35, view.width/2, 25);
        
        backbutton.centerX = view.width/2;
        
        [backbutton addTarget:self action:@selector(backselect) forControlEvents:UIControlEventTouchUpInside];
        
        [backbutton setBackgroundImage:[UIImage imageNamed:@"buttonBg"] forState:UIControlStateNormal];
        
        [view addSubview:backbutton];
        
        [backbutton setTitleColor:fontColor(130, 79, 41) forState:UIControlStateNormal];
        
        [backbutton setTitle:@"返回天盤" forState:UIControlStateNormal];
    }
   
}

-(void)backselect{
    
    CGFloat w = self.view.width/4;

     self.shuview.backgroundColor = [UIColor clearColor];

    [self.zhuview removeFromSuperview];
    
    [self addViewrect:CGRectMake(w, self.h, 2*w, 2*self.h)];
   
    
}
-(void)click:(UIButton*)btn{
    
    self.shuview.backgroundColor = [UIColor clearColor];
    
    UIView * view = [self.view viewWithTag:btn.tag -100];
    
    self.shuview = view;
    
    view.backgroundColor =fontColor(231, 217, 215);
   
    self.zhuview.backgroundColor =fontColor(231, 217, 215);
    
   
    
    [self.zhuview.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    
    
    CGFloat w = self.view.width/4;
  
    CGFloat h = (self.view.height-60)/4;
    
    [self addviewframex:w farmey:h view:self.zhuview tag:0 title:self.titlarray[btn.tag-101] zhongjiantitle:self.zhongtitle[btn.tag-101] lefttitle:self.leftArray[btn.tag-101] rightString:self.rightArray[btn.tag-101] zuiString:self.zuiArray[btn.tag-101] isbooL:YES];

   
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
