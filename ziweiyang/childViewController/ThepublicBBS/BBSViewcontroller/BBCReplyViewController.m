//
//  BBCReplyViewController.m
//  ziweiyang
//
//  Created by bidiao on 2017/11/20.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import "BBCReplyViewController.h"
#import "HYTextView.h"
#import "UIViewController+XHPhoto.h"
#import "ZHDatePickerView.h"
#import "ZLShowBigImage.h"
@interface BBCReplyViewController ()<UITextViewDelegate>
@property(nonatomic,strong) HYTextView * textView;
@property(nonatomic,strong) UIImageView * imageView;
@property(nonatomic,strong) NSMutableArray * photoarray;
@property(nonatomic,strong) NSMutableArray * photocount;

@property(nonatomic,weak) UILabel * imagelabel;
@end
#define fontColor(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]

@implementation BBCReplyViewController

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
    
    UIImageView * imageView = [[UIImageView alloc]init];
    
    imageView.frame = self.view.frame;
    
    [self.view insertSubview:imageView atIndex:0 ];
    
    imageView.image = [UIImage imageNamed:@"bgPattern"];
    [self addView];
    // Do any additional setup after loading the view.
}
-(void)addView{
    
    
    UIScrollView * scrollView = [UIScrollView new];
    
    scrollView.frame = self.view.frame;
    
    scrollView.showsVerticalScrollIndicator = NO;
    
    [self.view addSubview:scrollView];
    
    UIImageView * imageView = [[UIImageView alloc]init];
    
    imageView.frame = CGRectMake(39, 10, self.view.width*2/5, self.view.width/5);
   
    imageView.image =[UIImage imageNamed:@"logo"];
    
    imageView.centerX = self.view.centerX;
    
    [scrollView addSubview:imageView];
    
    UILabel * replylabel = [[UILabel alloc]init];
    
    replylabel.frame = CGRectMake(12, CGRectGetMaxY(imageView.frame)+5, imageView.width*2/3, 40);
    
    replylabel.text = @"發佈回復";
    
    replylabel.textAlignment = NSTextAlignmentCenter;
    
    replylabel.centerX =  self.view.centerX;
    
    replylabel.textColor = fontColor(139,94,145);
    
    [scrollView addSubview:replylabel];
    
    HYTextView * textView =[[HYTextView alloc]init];
    if (self.index ==0) {
        NSLog(@"ddf");
        
        textView.frame = CGRectMake(20, CGRectGetMaxY(replylabel.frame)+5, self.view.width-40, self.view.height*2/5-10);
    }else{
        UILabel * tagtitle = [[UILabel alloc]init];
        
        tagtitle.layer.borderWidth =1;
        
        tagtitle.layer.borderColor = [[UIColor lightGrayColor]CGColor];
        
        tagtitle.adjustsFontSizeToFitWidth = YES;
       
        tagtitle.textColor =[UIColor lightGrayColor];
        
        tagtitle.text = [NSString stringWithFormat:@"引用    原贴由 %@於 %@发布",self.bbmodel.nameString,self.bbmodel.dateString];
        [scrollView addSubview:tagtitle];
        
        tagtitle.frame = CGRectMake(2, CGRectGetMaxY(replylabel.frame)+10, self.view.width*4/5, 20);
        
        tagtitle.adjustsFontSizeToFitWidth = YES;
        
        tagtitle.centerX = scrollView.centerX;
        
        UILabel * tagcontitle = [[UILabel alloc]init];
     
        tagcontitle.textColor =[UIColor lightGrayColor];
       
        tagcontitle.layer.borderWidth = 1;
        
        tagcontitle.layer.borderColor = [[UIColor lightGrayColor] CGColor];
        
        //tagcontitle.textAlignment =NSTextAlignmentCenter;
     
        tagcontitle.numberOfLines = 0;
        
        tagcontitle.text = self.bbmodel.contentString;
        
        CGSize maxsize = CGSizeMake(self.view.width*4/5, MAXFLOAT);
        
        [scrollView addSubview:tagcontitle];
        
       // tagcontitle.font = [UIFont systemFontOfSize:13];
        
        CGSize size = [tagcontitle sizeThatFits:maxsize];
        
        tagcontitle.frame = CGRectMake(2, CGRectGetMaxY(tagtitle.frame), size.width+5, size.height);
        
        tagcontitle.centerX = scrollView.centerX;
        
       // NSLog(@"ffssaadd");
        textView.frame = CGRectMake(20, CGRectGetMaxY(tagcontitle.frame)+5, self.view.width-40, self.view.height*2/5-10);
    }
    
    
    
    
    
    
    
    
    
    
    textView.placehoder = @" 內文";
    
    textView.delegate = self;
    
    self.textView =textView;
    
    
    [scrollView addSubview:textView];
    
    
    UIButton * addimagebutton  =[[UIButton alloc]init];
    
    addimagebutton.frame = CGRectMake(20, CGRectGetMaxY(textView.frame)+10, 40, 40);
    
    [addimagebutton setBackgroundImage:[UIImage imageNamed:@"addBtn"] forState:UIControlStateNormal];
    
    [addimagebutton addTarget:self action:@selector(addImagePhoto) forControlEvents:UIControlEventTouchUpInside];
    
    [scrollView addSubview:addimagebutton];
    
    UILabel * imagelabel =[[UILabel alloc]init];
    
    imagelabel.text = @"加入\n圖片";
    
    imagelabel.textColor = [UIColor lightGrayColor];
    
    imagelabel.numberOfLines = 0;
    
    imagelabel.frame = CGRectMake(CGRectGetMaxX(addimagebutton.frame)+5, addimagebutton.y-4, 40, 50);
    
    [scrollView addSubview:imagelabel];
   
    self.imagelabel = imagelabel;
   
    
    UIButton * reset =  [[UIButton alloc]init];
    
    reset.frame = CGRectMake(self.view.centerX-10-self.view.width/4, CGRectGetMaxY(imagelabel.frame)+30, self.view.width/4-10, 40);
    
    [reset addTarget:self action:@selector(reset) forControlEvents:UIControlEventTouchUpInside];
    //  [reset setImage:[UIImage imageNamed:@"resetBtn"] forState:UIControlStateNormal];
    [reset setBackgroundImage:[UIImage imageNamed:@"resetBtn"] forState:UIControlStateNormal];
    // reset.backgroundColor = [UIColor redColor];
    
    [scrollView addSubview:reset];
    
    UIButton * searchbutton = [[UIButton alloc]init];
    
    searchbutton.frame = CGRectMake(self.view.centerX+10, reset.y, reset.width, reset.height);
    
    
    [searchbutton setBackgroundImage:[UIImage imageNamed:@"submitBtn"] forState:UIControlStateNormal];
    
    [searchbutton addTarget:self action:@selector(tiaojiaobutton) forControlEvents:UIControlEventTouchUpInside];
    
    [scrollView addSubview:searchbutton];
    
    
    
    
    
    
    scrollView.contentSize = CGSizeMake(self.view.width, CGRectGetMaxY(searchbutton.frame)+80);
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
    NSLog(@"照片");
}
-(void)tap:(UITapGestureRecognizer*)sender{
  
    UITapGestureRecognizer * tap =(UITapGestureRecognizer*)sender;
    
    
    UIImageView *imageVi = [self.view viewWithTag:tap.view.tag];
   
    NSLog(@"ff电费单 %ld",tap.view.tag);
    
    
    
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
