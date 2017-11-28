//
//  AnnotationsViewController.m
//  ziweiyang
//
//  Created by bidiao on 2017/10/30.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import "AnnotationsViewController.h"

@interface AnnotationsViewController ()
#define fontColor(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
@end

@implementation AnnotationsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addImageView];
}
-(void)addImageView{
    
    UIImageView * imageView =[[UIImageView alloc]init];
    
    imageView.frame = CGRectMake(10, 10, self.view.frame.size.width*2/3, 40);
    
    imageView.image = [UIImage imageNamed:@"chartInfo1"];
    
    [self.view addSubview:imageView];
    
    UILabel * textlable = [[UILabel alloc]init];
    
    CGSize maximumLabelSize = CGSizeMake(self.view.frame.size.width-20, MAXFLOAT);
    
    textlable.lineBreakMode = NSLineBreakByTruncatingTail;
    
  
    
    textlable.text = @"十二建除就是我們農民曆 上常見的「建、除、滿、平、定、執、破、危、成、收、開、閉」十二個字。又稱為十二建星或十二神。\n\n十二建除的由來已久，考古上「九店楚簡」和其它《日書》的出現，使得十二建除的歷史可往前推到兩千多年前的春秋戰國時代，古代的《日書》記載的就是日子時辰吉凶的選擇，使用的對象是一般平民百姓的日常活動，跟現代我們常見的農民曆和通書的功能是一樣。";
    
    textlable.numberOfLines = 0;
    
   CGSize size = [textlable sizeThatFits:maximumLabelSize];
    
    textlable.frame = CGRectMake(10, CGRectGetMaxY(imageView.frame)+10, size.width, size.height);
    
    [self.view addSubview:textlable];
    
    UIImageView *four = [[UIImageView alloc]init];
    
     four.frame = CGRectMake(10, CGRectGetMaxY(textlable.frame)+20, self.view.frame.size.width*2/3, 40);
    
    four.image = [UIImage imageNamed:@"24_fest"];
    
    [self.view addSubview:four];
    
    CGFloat  y  =  CGRectGetMaxY(four.frame)+15;
    
    [self addTextlable:nil imageString:@"spring" labletext:@"春季\n立春 雨水 惊蛰 春分 清明 谷雨" image:four y:y];
    
    [self addTextlable:nil imageString:@"summer" labletext:@"夏季\n立夏 小滿 芒種 夏至 小暑 大暑" image:four y:y+50];
    
    [self addTextlable:nil imageString:@"autumn" labletext:@"秋季\n立秋 處暑 白露 秋分 寒露 霜降" image:four y:y+100];
    
    [self addTextlable:nil imageString:@"winter" labletext:@"冬季\n立冬 大雪 小雪 冬至 小寒 大寒" image:four y:y+150];
    
    
}
-(void)addTextlable:(UILabel*)lable imageString:(NSString*)imageString labletext:(NSString*)textNstring image:(UIImageView*)imageV y:(CGFloat)y{
    
    
    
    UIImageView * image = [[UIImageView alloc]init];
    
    image.image = [UIImage imageNamed:imageString];
    
    image.frame = CGRectMake(imageV.frame.size.width/2-40, y, 40, 40);
    
    //image.backgroundColor = [UIColor yellowColor];
    
    [self.view addSubview:image];
    
    UILabel * textlable = [[UILabel alloc]init];
    
    
    
    NSMutableAttributedString * string = [[NSMutableAttributedString alloc] initWithString:textNstring];
    
    [string addAttribute:NSForegroundColorAttributeName value:fontColor(139,94,145) range:NSMakeRange(2,textNstring.length-2)];
    
    CGSize maximumLabelSize = CGSizeMake(self.view.frame.size.width/2+20, MAXFLOAT);
    
    //textlable.backgroundColor = [UIColor yellowColor];
   
    
    textlable.attributedText = string;
    
    textlable.numberOfLines = 2;
    
    textlable.adjustsFontSizeToFitWidth = YES;
    
    CGSize size = [textlable sizeThatFits:maximumLabelSize];
    
    textlable.frame = CGRectMake(CGRectGetMaxX(image.frame)+5, image.frame.origin.y, size.width, size.height);
    
   // textlable.textColor =fontColor(139,94,145);
    
    textlable.lineBreakMode = NSLineBreakByTruncatingTail;
    
    
 
    
    
   // textlable.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:textlable];
    
    
    
    
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
