//
//  XinTieViewController.m
//  ziweiyang
//
//  Created by bidiao on 2017/11/21.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import "XinTieViewController.h"
#import "HYTextView.h"
#import "UIViewController+XHPhoto.h"
#import "ZLShowBigImage.h"
@interface XinTieViewController ()<UITextViewDelegate>
@property(nonatomic,strong) HYTextView * textView;
@property(nonatomic,strong) UIImageView * imageView;
@property(nonatomic,strong) NSMutableArray * photoarray;
@property(nonatomic,strong) NSMutableArray * photocount;

@property(nonatomic,copy) NSString * fabiaotitle;
@property(nonatomic,copy) NSString * msg;
@property(nonatomic,copy) NSString * fourm;
@property(nonatomic,weak) UILabel * imagelabel;
@property(nonatomic,copy) NSString * member_only;
@property(nonatomic,copy) NSString * selectTag;

@property(nonatomic) BOOL isHuiyuan;
@end
#define fontColor(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
@implementation XinTieViewController
-(NSMutableArray *)photocount {
    if (!_photocount) {
        _photocount = [NSMutableArray array];
    }
    
    return _photocount;
    
}
-(NSMutableArray *)photoarray {
    if (!_photoarray) {
        _photoarray = [NSMutableArray array];
    }
    
    return _photoarray;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.isHuiyuan = NO;
    
    UIImageView * imageView = [[UIImageView alloc]init];
    
    imageView.frame = self.view.frame;
    
    [self.view insertSubview:imageView atIndex:0 ];
    
    imageView.image = [UIImage imageNamed:@"bgPattern"];
    // Do any additional setup after loading the view.
    
    [self addView];
}-(void)addView{
    
    UIScrollView * scrollview =[UIScrollView new];
    
    scrollview.frame = self.view.frame;
    
    scrollview.showsVerticalScrollIndicator = NO;
    [self.view addSubview:scrollview];
    
    UIImageView * imageView = [[UIImageView alloc]init];
    
    imageView.frame = CGRectMake(39, 10, self.view.width*2/5, self.view.width/5);
    
    imageView.image =[UIImage imageNamed:@"logo"];
    
    imageView.centerX = self.view.centerX;
    
    [scrollview addSubview:imageView];
    
    UILabel * replylabel = [[UILabel alloc]init];
    
    replylabel.frame = CGRectMake(12, CGRectGetMaxY(imageView.frame)+5, imageView.width*2/3, 40);
    
    replylabel.text = @"發佈新帖";
    
    replylabel.textAlignment = NSTextAlignmentCenter;
    
    replylabel.centerX =  self.view.centerX;
    
    replylabel.textColor = fontColor(139,94,145);
    
    [scrollview addSubview:replylabel];
    
    UITextField * textfiled  =[[UITextField alloc]init];
    
    textfiled.placeholder = @"主題";
    
    textfiled.frame = CGRectMake(20, CGRectGetMaxY(replylabel.frame)+5, self.view.width-40, 40);
    textfiled.backgroundColor = [UIColor whiteColor];
    
    [textfiled addTarget:self action:@selector(texfiled:) forControlEvents:UIControlEventEditingChanged];
    
    [scrollview addSubview:textfiled];
    
    
    
    
    HYTextView * textView =[[HYTextView alloc]init];
    
    textView.frame = CGRectMake(20, CGRectGetMaxY(textfiled.frame)+5, self.view.width-40, self.view.height*2/5-10);
    
    textView.placehoder = @" 內文";
    
    textView.delegate = self;
    
    self.textView =textView;
    
    
    [scrollview addSubview:textView];
    
    
    UIButton * addimagebutton  =[[UIButton alloc]init];
    
    addimagebutton.frame = CGRectMake(20, CGRectGetMaxY(textView.frame)+10, 40, 40);
    
    [addimagebutton setBackgroundImage:[UIImage imageNamed:@"addBtn"] forState:UIControlStateNormal];
    
    [addimagebutton addTarget:self action:@selector(addImagePhoto) forControlEvents:UIControlEventTouchUpInside];
    
    [scrollview addSubview:addimagebutton];
    
    UILabel * imagelabel =[[UILabel alloc]init];
    
    imagelabel.text = @"加入圖片";
    
    imagelabel.textColor = [UIColor lightGrayColor];
    
    //imagelabel.numberOfLines = 0;
    imagelabel.adjustsFontSizeToFitWidth = YES;
    imagelabel.frame = CGRectMake(CGRectGetMaxX(addimagebutton.frame)+5, addimagebutton.y-4, 60, 50);
    
    [scrollview addSubview:imagelabel];
    
    self.imagelabel = imagelabel;
    
    UILabel *huiyuanlabel = [UILabel new];
    
    huiyuanlabel.text = @"直供會員閱讀";
    
    huiyuanlabel.adjustsFontSizeToFitWidth = YES;
    huiyuanlabel.frame = CGRectMake(10, CGRectGetMaxY(imagelabel.frame)+30, self.view.width/4+20, 30);
    
    [scrollview addSubview:huiyuanlabel];
    
    UISwitch * switchapp = [[UISwitch alloc]init];
    
    [switchapp addTarget:self action:@selector(switchon:) forControlEvents:UIControlEventValueChanged];
    
    switchapp.frame  = CGRectMake(CGRectGetMaxX(huiyuanlabel.frame)+20, huiyuanlabel.y, 50, 40);
    
    [scrollview addSubview:switchapp];
    
    UIButton * reset =  [[UIButton alloc]init];
    
    reset.frame = CGRectMake(self.view.centerX-10-self.view.width/4, CGRectGetMaxY(huiyuanlabel.frame)+30, self.view.width/4-10, 40);
    
    [reset addTarget:self action:@selector(reset) forControlEvents:UIControlEventTouchUpInside];
    //  [reset setImage:[UIImage imageNamed:@"resetBtn"] forState:UIControlStateNormal];
    [reset setBackgroundImage:[UIImage imageNamed:@"resetBtn"] forState:UIControlStateNormal];
    // reset.backgroundColor = [UIColor redColor];
    
    [scrollview addSubview:reset];
    
    UIButton * searchbutton = [[UIButton alloc]init];
    
    searchbutton.frame = CGRectMake(self.view.centerX+10, reset.y, reset.width, reset.height);
    
    
    [searchbutton setBackgroundImage:[UIImage imageNamed:@"submitBtn"] forState:UIControlStateNormal];
    
    [searchbutton addTarget:self action:@selector(tiaojiaobutton) forControlEvents:UIControlEventTouchUpInside];
    
    [scrollview addSubview:searchbutton];
    
    scrollview.contentSize = CGSizeMake(self.view.width, CGRectGetMaxY(searchbutton.frame)+reset.height+60);
}
-(void)switchon:(UISwitch*)se{
    
    if (se.isOn) {
        NSLog(@"會員");
        self.isHuiyuan = YES;
    }else{
        
        self.isHuiyuan = NO;
    }
    
}
-(void)reset{
    
    if (self.textView.text) {
        
        self.textView.text = nil;
    }
    [self.photoarray removeAllObjects];
    for (int i=0; i<self.photocount.count; i++) {
        
        
        
        [[self.view viewWithTag:[self.photocount[i] integerValue]] removeFromSuperview];
    }
    
}

-(void)tiaojiaobutton{
    
    NSLog(@"发表");
    [self addNework];
}
-(void)addNework{
#warning 传值
//forum资深和建设厂区别
    
    
    
    NSLog(@" %@  %@",self.fabiaotitle,self.msg);
    return;
    
    NSString * string = [NSString stringWithFormat:@"%@api_post_forum.php?username=%@&title=%@&msg=%@&img=%@&token=%@&active=&forum_type=%@&member_only=%@&tag=%@",AppNetWork_Post,AppUserName_USER,self.fabiaotitle,self.msg,@"",AppToken_USER_COOKIE,self.fourm,self.member_only,self.selectTag];
    
    
    [NeworkViewModel POST:string parameters:nil completionHandler:^(id responsObj, NSError *or) {
        
        
        
        
        
        
        
        
    }];
    
    
    
    
    
}
-(void)addImagePhoto{
    
    
    __weak typeof(self) myself = self;
    [self showCanEdit:YES photo:^(UIImage *photo) {
        
        [myself.photoarray addObject:photo];
        for (int i = 0; i<myself.photoarray.count; i++) {
            UIImageView * imageVi = [[UIImageView alloc]init];
            
            imageVi.frame = CGRectMake(CGRectGetMaxX(_imagelabel.frame)+4+i*40, _imagelabel.y, 40, 40);
            
            imageVi.image = myself.photoarray[i];
            
            imageVi.userInteractionEnabled = YES;
            
            imageVi.tag = i+100;
            //对象
            NSNumber * nu =[NSNumber numberWithInteger:imageVi.tag];
            
            [myself.photocount addObject:nu];
            
            UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:myself action:@selector(tap:)];
            
            tap.numberOfTapsRequired =1;
            
            tap.numberOfTouchesRequired =1;
            
            [imageVi addGestureRecognizer:tap];
            
            [myself.view addSubview:imageVi];
            
        }
        
    }];
   // NSLog(@"照片");
}

-(void)textViewDidChange:(UITextView *)textView{
    
    
    self.msg = textView.text;
    
    
}
-(void)texfiled:(UITextField*)tectfield{
    
    
    self.fabiaotitle = tectfield.text;
}
-(void)tap:(UITapGestureRecognizer*)sender{
    
    UITapGestureRecognizer * tap =(UITapGestureRecognizer*)sender;
    
    
    UIImageView *imageVi = [self.view viewWithTag:tap.view.tag];
    
    //NSLog(@"ff电费单 %ld",tap.view.tag);
    
    
    
    [ZLShowBigImage showBigImage:imageVi];
    
    
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
