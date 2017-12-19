//
//  ThecClassroomChildViewController.m
//  ziweiyang
//
//  Created by bidiao on 2017/11/28.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import "ThecClassroomChildViewController.h"
#import "CoursecontentViewController.h"
@interface ThecClassroomChildViewController ()
@property(nonatomic,strong) UILabel * detailabel;
@property(nonatomic,strong) UIImageView * imageView;
@property(nonatomic,strong) UILabel * datelabel;
@property(nonatomic,strong) UILabel * kengLabel;
@end

@implementation ThecClassroomChildViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor = fontColor(66, 66, 64);
   
    self.title = @"课程资料";
   
    //[self addView];
    [self addNework];
    // Do any additional setup after loading the view.
}
-(void)addNework{
    
    
    NSString * string = [NSString stringWithFormat:@"%@api_get_coursebook.php?id=%@&username=%@&token=%@&active=",AppNetWork_Post,self.classroomModel.course_id,AppUserName_USER,AppToken_USER_COOKIE];
    
    DefinmySelf;
    [NeworkViewModel POST:string parameters:nil completionHandler:^(id responsObj, NSError *or) {
        
        NSArray * arrt =[RightModel classroomdataModel:responsObj];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            RightModel * rightModel = arrt[0];
           
           
            [mySelf addView:rightModel];
            
            
            
        });
    }];
    
    
    
    
    
}
-(void)addView:(RightModel*)rightModel{
    
    
     DefinmySelf;
    UIScrollView * scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, mySelf.view.width, mySelf.view.height-60)];
    
    [self.view addSubview:scrollView];
    
    
    
    UIImageView * imageView = [UIImageView new];
    
    imageView.frame = CGRectMake(10, 60, mySelf.view.width/2-20, mySelf.view.height*1.5/5+20);
    
    imageView.centerX = mySelf.view.centerX;
    
    //self.imageView = imageView;
    
    
    [imageView sd_setImageWithURL:[NSURL URLWithString:[AppNetWork_Post stringByAppendingString:rightModel.bookimagurl]]];
    
    [scrollView addSubview:imageView];
    
    //NSString * string = @"https://www.ziweiyang.com/";
    
    
  //  [imageView sd_setImageWithURL:[NSURL URLWithString:[AppNetWork_Post stringByAppendingString:self.model.imagebook]]];
    
     //imageView.image = [UIImage imageNamed:@"book"];
    
    UILabel * namlable = [[UILabel alloc]init];
    
    namlable.frame = CGRectMake(10, CGRectGetMaxY(imageView.frame)+30, mySelf.view.width-10, 40);
    
    namlable.text = [NSString stringWithFormat:@"课程名称: %@",mySelf.classroomModel.namelabeltext1];
    namlable.textColor = [UIColor whiteColor];
    
    [scrollView addSubview:namlable];
    
    UILabel * dateLable = [[UILabel alloc]init];
    
    dateLable.frame = CGRectMake(10, CGRectGetMaxY(namlable.frame)+10, mySelf.view.width-10, 40);
    // mySelf.datelabel.text = rightModel.bookuploaddate;
    
    dateLable.text =  [NSString stringWithFormat:@"上传时间: %@", rightModel.bookuploaddate];
    
    //self.datelabel = dateLable;
    
    dateLable.textColor = [UIColor whiteColor];
    
    [scrollView addSubview:dateLable];
    
    
    UILabel *kecheng = [[UILabel alloc]init];

    kecheng.frame = CGRectMake(10, CGRectGetMaxY(dateLable.frame)+10, 80, 40);

   
   // self.kengLabel = kecheng;
    
    
    
    kecheng.textColor = [UIColor whiteColor];

    [scrollView addSubview:kecheng];

    UILabel * neirong = [[UILabel alloc]init];

    //self.datelabel = neirong;
    
     //neirong.text = @"";
    if (rightModel.bookdetail.length >0) {
        
        
        kecheng.text = @"课程简介:";
        
        
         neirong.text = rightModel.bookdetail;
        
        
    }
   
    CGSize maximunLabsize = CGSizeMake(mySelf.view.width-kecheng.width-10-30, MAXFLOAT);
    
    neirong.textColor = [UIColor whiteColor];
    
    neirong.numberOfLines = 0;
    
    neirong.font = [UIFont systemFontOfSize:14];
    
    neirong.adjustsFontSizeToFitWidth = YES;
    
    neirong.lineBreakMode = NSLineBreakByTruncatingTail;
    
    
    CGSize size = [neirong sizeThatFits:maximunLabsize];
    
    
    
    neirong.frame = CGRectMake(CGRectGetMaxX(kecheng.frame)+1,CGRectGetMaxY(dateLable.frame)+20 , size.width, size.height);
    
    [scrollView addSubview:neirong];

  
    [scrollView addSubview:neirong];

    
    UIButton * button = [[UIButton alloc]init];
    
    button.frame =CGRectMake(40, CGRectGetMaxY(neirong.frame)+20, mySelf.view.width-80, 30);
    
    [button addTarget:self action:@selector(clickback) forControlEvents:UIControlEventTouchUpInside];
    
    [button setBackgroundImage:[UIImage imageNamed:@"readBtn_course"] forState:UIControlStateNormal];
    
    [scrollView addSubview:button];
    
    scrollView.contentSize = CGSizeMake(mySelf.view.width, CGRectGetMaxY(button.frame)+20);
}
-(void)clickback{
    
    CoursecontentViewController*coursecont =   [CoursecontentViewController new];
   
    coursecont.api_bookcourse = @"api_get_coursebook_detail.php";
    
    coursecont.idmycoursBook = self.classroomModel.course_id;
    
   // NSLog(@"888 %@",self.classroomModel.course_id);
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
