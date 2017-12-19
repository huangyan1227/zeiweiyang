//
//  RecoChildeViewController.m
//  ziweiyang
//
//  Created by bidiao on 2017/11/28.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import "RecoChildeViewController.h"
#import "CoursecontentViewController.h"
@interface RecoChildeViewController ()

@end

@implementation RecoChildeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.view.backgroundColor = fontColor(66, 66, 64);
    [self addView];
    // Do any additional setup after loading the view.
}
-(void)addView{
    
    UIScrollView * scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height-60)];
    
    [self.view addSubview:scrollView];
    
    
    
    UIImageView * imageView = [UIImageView new];
    
    imageView.frame = CGRectMake(10, 15, self.view.width/2-20, self.view.height*1.5/5+20);
    
    imageView.centerX = self.view.centerX;
    
    [scrollView addSubview:imageView];
    
    //NSString * string = @"https://www.ziweiyang.com/";
    
    
    [imageView sd_setImageWithURL:[NSURL URLWithString:[AppNetWork_Post stringByAppendingString:self.rightmodel.storeimageurl]]];
    
    // imageView.image = [UIImage imageNamed:@"book"];
    
    UILabel * namlable = [[UILabel alloc]init];
    
    namlable.frame = CGRectMake(10, CGRectGetMaxY(imageView.frame)+30, self.view.width-10, 40);
    
    namlable.text = [NSString stringWithFormat:@"课程名称: %@",self.rightmodel.storebookName];
    namlable.textColor = [UIColor whiteColor];
    
    [scrollView addSubview:namlable];
    
    UILabel * dateLable = [[UILabel alloc]init];
    
    dateLable.frame = CGRectMake(10, CGRectGetMaxY(namlable.frame)+10, self.view.width-10, 40);
   
    dateLable.text =  [NSString stringWithFormat:@"上传时间: %@",self.rightmodel.storedate ];
    
    dateLable.textColor = [UIColor whiteColor];
    
    [scrollView addSubview:dateLable];
    
    
    UILabel *kecheng = [[UILabel alloc]init];

    kecheng.frame = CGRectMake(10, CGRectGetMaxY(dateLable.frame)+10, 80, 40);

  

    kecheng.textColor = [UIColor whiteColor];

    [scrollView addSubview:kecheng];

    UILabel * neirong = [[UILabel alloc]init];
    
    if (self.rightmodel.storedetail.length>0) {
          kecheng.text = @"课程简介:";
        neirong.text = self.rightmodel.storedetail;
    }
   // neirong.text = self.model.detailbook;

    CGSize maximunLabsize = CGSizeMake(self.view.width-kecheng.width-10-30, MAXFLOAT);

    neirong.textColor = [UIColor whiteColor];

    neirong.numberOfLines = 0;

    neirong.adjustsFontSizeToFitWidth = YES;

    neirong.lineBreakMode = NSLineBreakByTruncatingTail;


    CGSize size = [neirong sizeThatFits:maximunLabsize];



    neirong.frame = CGRectMake(CGRectGetMaxX(kecheng.frame)+1,CGRectGetMaxY(dateLable.frame)+20 , size.width, size.height);

    [scrollView addSubview:neirong];
    
    
    UIButton * button = [[UIButton alloc]init];
    
    button.frame =CGRectMake(30, CGRectGetMaxY(dateLable.frame)+10, self.view.width-100, 30);
    
    [button addTarget:self action:@selector(clickback) forControlEvents:UIControlEventTouchUpInside];
    
    [button setBackgroundImage:[UIImage imageNamed:@"readBtn"] forState:UIControlStateNormal];
    
    [scrollView addSubview:button];
    
    scrollView.contentSize = CGSizeMake(self.view.width, CGRectGetMaxY(button.frame)+20);
}
-(void)clickback{
    
    CoursecontentViewController * coursecont = [CoursecontentViewController new];
    
    coursecont.api_bookcourse = @"api_get_ebook_detail.php";
    
    coursecont.idmycoursBook = self.rightmodel.storebookid;
    [self.navigationController pushViewController:coursecont animated:YES];
    
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
