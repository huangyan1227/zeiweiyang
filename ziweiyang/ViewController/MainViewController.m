//
//  MainViewController.m
//  ziweiyang
//
//  Created by bidiao on 2017/10/17.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import "MainViewController.h"
#import "LeftView.h"
#import "UIBarButtonItem+Extension.h"
#import "Contenct.h"
#import "MainNavigationViewController.h"
#import "LogViewController.h"
#import "RightMainViewController.h"
@interface MainViewController ()<LeftViewDeleaget,RightViewDeleage>
@property(nonatomic,weak) LeftView * lefView;

@property(nonatomic,weak) MainNavigationViewController * shownavigationCotroller;
@property(nonatomic,strong) RightMainViewController * righVc;
@property(nonatomic,strong) UIButton * clickbutton;

@property(nonatomic,assign) NSInteger forminterger;
@end

#define  HYNavShowAnimDuration 0.5
#define  HYCoverTag 100
#define kDevice_Is_iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self imageBackView];
    
    [self addChildViewController];
    
    [self addlefView];
   
    [self addRightView];
    
}
-(void)addRightView{
    
    RightMainViewController * rihtVc  = [RightMainViewController new];
    
    rihtVc.view.x = self.view.width-rihtVc.view.width;
    
    [self.view insertSubview:rihtVc.view atIndex:1];
    
    rihtVc.rigdeleage = self;
    
    self.righVc = rihtVc;
    
    
}
//先不用
-(void)notion{
    
    
     // [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveNotification:) name:@"plick" object:nil];
}
-(void)receiveNotification:(NSNotification*)gn{
    
  //  [self lefMenu:self.lefView didSelectedButtonFromindex:0 toIndex:7];
    NSLog(@"通知");
    
}
-(void)imageBackView{
    
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:self.view.frame];
   // imageView.image =[UIImage imageNamed:@"sidebar_bg"];
    imageView.image = [UIImage imageWithColor:[UIColor colorWithDisplayP3Red:221/255.0 green:211/255.0 blue:186/255.0 alpha:1]];
    [self.view addSubview:imageView];
    // NSLog(@"%f",[UIScreen mainScreen].bounds.size.width);
    
}
-(void)addlefView{
    
    LeftView * leftView = [[LeftView alloc]initWithFrame:CGRectMake(0, 11, 200, self.view.frame.size.height-11)];
      self.lefView = leftView;

    leftView.backgroundColor = [UIColor colorWithDisplayP3Red:241/255.0 green:242/255.0 blue:242/255.0 alpha:1];
    leftView.leftdelegate = self;
    
    [self.view insertSubview:leftView atIndex:1];
    
   
    
   
}
-(void)addChildViewController{
    //主页
    ThehomePageViewController * home = [ThehomePageViewController new];
    [self addoneChildVc:home title:@"主页"];
    
    home.main = self;
    
    DailyfinancesViewController * dailyfian = [DailyfinancesViewController new];
    [self addoneChildVc:dailyfian title:@"每日财运"];
    
    ThelatestnewsViewController * thelast = [ThelatestnewsViewController new];
    [self addoneChildVc:thelast title:@"最新消息"];
    
    IntroductiontotheViewController * intion = [IntroductiontotheViewController new];
    [self addoneChildVc:intion title:@"简介"];
    
    ThecompanyViewController * company = [ThecompanyViewController new];
    [self addoneChildVc:company title:@"公司简介"];
    
    SpecialViewController * special = [SpecialViewController new];
    
    [self addoneChildVc:special title:@"奇门简介"];
    
    CrapemyrtleViewController * crap = [CrapemyrtleViewController new];
    
    [self addoneChildVc:crap title:@"紫薇命盘"];
    
    CalendarViewController * calendar = [CalendarViewController new];
    
    [self addoneChildVc:calendar title:@"万年历"];
    
    TheclassroomViewController * class = [TheclassroomViewController new];
    [self addoneChildVc:class title:@"教室"];
    
    ShopViewController * shop = [ShopViewController new];
    
    [self addoneChildVc:shop title:@"商店"];
    
    PublicBBSViewController * public = [PublicBBSViewController new];
    
    [self addoneChildVc:public title:@"公众论坛"];
    
    ClasstoaskquestionsViewController * askclass = [ClasstoaskquestionsViewController new];
    [self addoneChildVc:askclass title:@"课程提问"];
    
    ContactViewController * conta = [ContactViewController new];
    
    [self addoneChildVc:conta title:@"联络我们"];
    
    ThetermsViewController * terms = [ThetermsViewController new];
    
    [self addoneChildVc:terms title:@"条款及细则"];
    
    PrivacypolicyViewController * priv = [PrivacypolicyViewController new];
    
    [self addoneChildVc:priv title:@"隐私政策"];
    
    BasicinformationViewController * basicinformation =[BasicinformationViewController new];
    
    [self addoneChildVc:basicinformation title:@"基本资料"];
    
    TransactionrecordsViewController * jiao =[TransactionrecordsViewController new];

    [self addoneChildVc:jiao title:@"交易记录"];
    
    RecordstoreViewController * stroe = [RecordstoreViewController new];
    
    [self addoneChildVc:stroe title:@"商店记录"];
    
    TheclassroomrecordViewController * theroom = [TheclassroomrecordViewController new];
    
    [self addoneChildVc:theroom title:@"教室记录"];
    
    TheentityrecordViewController * theentity = [TheentityrecordViewController new];
    
    [self addoneChildVc:theentity title:@"实体记录"];
    
    BBSrecordViewController * bbsrecore = [BBSrecordViewController new];
    
    [self addoneChildVc:bbsrecore title:@"论坛纪录"];
    
    QuestionsrecordViewController * question = [QuestionsrecordViewController new];
    
    [self addoneChildVc:question title:@"提问纪录"];
    
    
    
    
    
}

-(void)addoneChildVc:(UIViewController*)chilVc title:(NSString*)title{
    
    chilVc.title = title;
    
    
    
    if (kDevice_Is_iPhoneX) {
        [chilVc.tabBarItem setTitlePositionAdjustment:UIOffsetMake(-12, -12)];
    };
    
     chilVc.view.backgroundColor =HYRandomColor;
    UIImageView * imageView = [[UIImageView alloc]init];
    
    imageView.frame = chilVc.view.frame;
    
    [chilVc.view insertSubview:imageView atIndex:0 ];
    
    imageView.image = [UIImage imageNamed:@"bgPattern"];
    
    UILabel * label = [[UILabel alloc]init];
    
    label.frame = CGRectMake(0, 0, 88, 65);
    
    label.text =title;
    
    label.textAlignment = NSTextAlignmentCenter;
    chilVc.navigationItem.titleView = label;
    
    chilVc.navigationItem.leftBarButtonItem  = [UIBarButtonItem itemWithImageName:@"top_navigation_menuicon" target:self action:@selector(lefMen)];
    
    chilVc.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"登入" style:UIBarButtonItemStylePlain target:self action:@selector(rightMen)];
    
//    UIButton * rightbutton = [[UIButton alloc]init];
//
//    rightbutton.frame = CGRectMake(0, 0,60, 40);
//
//    [rightbutton addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
//    //[self.navigationBar addSubview:rightbutton];
//    [rightbutton setTitle:@"登 录" forState:UIControlStateNormal];
//
//    chilVc.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightbutton];
    
    
    MainNavigationViewController * navation = [[MainNavigationViewController alloc]initWithRootViewController:chilVc];
    //navation.maind = self;
    [self addChildViewController:navation];
    
}
-(void)click:(UIButton*)bg{
    
//    NSLog(@"登ff录");
//    UINavigationController *na = [[UINavigationController alloc]initWithRootViewController:[LogViewController new]];
//    
//    [self.navigationController pushViewController:[LogViewController new] animated:YES];
//    
//    [self.navigationController pushViewController:[LogViewController new] animated:YES];
//    
//    [self presentViewController:na animated:YES completion:nil];
//    
    
}
-(void)rightMen{

    self.righVc.view.hidden = NO;
    
    self.lefView.hidden = YES;
    
    
    [UIView animateWithDuration:HYNavShowAnimDuration animations:^{
        
        UIView *view=self.shownavigationCotroller.view;
        CGFloat navi=[UIScreen mainScreen].bounds.size.height- 2*60;
        CGFloat scale = navi/ [UIScreen mainScreen].bounds.size.height;
        // 菜单左边的间距
        CGFloat leftMenuMargin = [UIScreen mainScreen].bounds.size.width*(1-scale)*0.5;
        CGFloat translateX = 200- leftMenuMargin;
        //CGFloat topMargin = [UIScreen mainScreen].bounds.size.height *(1-scale)*0.5;
      //  CGFloat translateY = topMargin-60;
        //缩放
        CGAffineTransform scaleForm =CGAffineTransformMakeScale(1, 1);
        //平移
        CGAffineTransform translateForm =CGAffineTransformTranslate(scaleForm, -translateX, 0);
        view.transform =translateForm;
        //遮盖
        UIButton *cover =[[UIButton alloc]init];
        [cover addTarget:self action:@selector(coverClick:) forControlEvents:UIControlEventTouchUpInside];
        cover.frame=view.bounds;
        cover.tag=HYCoverTag;
        [view addSubview:cover];
        
        
    } completion:^(BOOL finished) {
       // [self.rightVc didShow];
    }];
   // UINavigationController*a =[[UINavigationController alloc]initWithRootViewController:[LogViewController new]];
    
    //[self.navigationController pushViewController:[LogViewController new] animated:YES];
   /// [self presv]
   // NSLog(@"fffssaa");
}
-(void)lefMen{
    
    self.lefView.hidden = NO;
   self.righVc.view.hidden = YES;
    
    [UIView animateWithDuration:HYNavShowAnimDuration animations:^{
       
        UIView * view =self.shownavigationCotroller.view;
        CGFloat navi =[UIScreen mainScreen].bounds.size.height -2*60;
        CGFloat scale =navi/[UIScreen mainScreen].bounds.size.height;
        CGFloat leftMenuMargin =[UIScreen mainScreen].bounds.size.width*(1-scale)*0.5;
        
        
        CGFloat translateX = 200-leftMenuMargin;
        CGFloat topMargin =[UIScreen mainScreen].bounds.size.height *(1-scale)*0.5;
        CGFloat translateY =topMargin -60;
        
        //缩放
        CGAffineTransform scaleForm = CGAffineTransformMakeScale(1, 1);
        //平移
        CGAffineTransform translateForm =CGAffineTransformTranslate(scaleForm, translateX/scale, translateY/scale);
        view.transform =translateForm;
        //遮盖
        UIButton * cover =[[UIButton alloc]init];
        [cover addTarget:self action:@selector(coverClick:) forControlEvents:UIControlEventTouchUpInside];
        cover.frame = view.bounds;
        cover.tag =HYCoverTag;
        
        [view addSubview:cover];
        
        
        
        
        
        
        
    }];
  ///  NSLog(@"fffff");
    
    
}

-(void)coverClick:(UIView *)cover{
    
    [UIView animateWithDuration:HYNavShowAnimDuration animations:^{
        self.shownavigationCotroller.view.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        [cover removeFromSuperview];
    }];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}
//当界面从内存中删除掉的时候，需要去掉通知中心中的注册
- (void)dealloc{
    
    //这个方法，在对象从内存中删除时，自动执行，我们可以重写，来掌握这个时间点
   // [[NSNotificationCenter defaultCenter] removeObserver:self];
}



- (void)lefMenu:(LeftView *)menu didSelectedButtonFromindex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex { 
    
    
//    MainNavigationViewController *ildNav =self.childViewControllers[fromIndex];
//    //ildNav.dd =self;
//    [ildNav.view removeFromSuperview];
//  MainNavigationViewController *nave =self.childViewControllers[toIndex];
//    [self.view addSubview:nave.view];
//    
//    nave.view.transform =ildNav.view.transform;
//    nave.view.layer.shadowColor=[UIColor blackColor].CGColor;
//    nave.view.layer.shadowOffset = CGSizeMake(-3, 0);
//    nave.view.layer.shadowOpacity = 0.4;
//    
//    self.shownavigationCotroller = nave;
//    [self coverClick:[nave.view viewWithTag:HYCoverTag]];
    
   // self.forminterger = toIndex;
    [self didSelectedButtonFromindex:self.forminterger toIndex:toIndex];
    
   // NSLog(@"%ldffffffffff",(long)fromIndex);
}
-(void)rightMenudidSelectedButtonFromindex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex{
   // NSLog(@"右边");
    
    //self.forminterger = fromIndex;
    
   // if (self.forminterger>14) {
    //     [self didSelectedButtonFromindex:fromIndex toIndex:toIndex];
  //  }else{
    [self didSelectedButtonFromindex:self.forminterger toIndex:toIndex];
        
        //self.forminterger =toIndex;
   // }
    
    
    
}
-(void)didSelectedButtonFromindex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex{
    MainNavigationViewController *ildNav =self.childViewControllers[fromIndex];
    //ildNav.dd =self;
    [ildNav.view removeFromSuperview];
    MainNavigationViewController *nave =self.childViewControllers[toIndex];
    
    self.forminterger = toIndex;
    [self.view addSubview:nave.view];
    
    nave.view.transform =ildNav.view.transform;
    nave.view.layer.shadowColor=[UIColor blackColor].CGColor;
    nave.view.layer.shadowOffset = CGSizeMake(-3, 0);
    nave.view.layer.shadowOpacity = 0.4;
    
    self.shownavigationCotroller = nave;
    [self coverClick:[nave.view viewWithTag:HYCoverTag]];
    
    
    
    
}

- (void)encodeWithCoder:(nonnull NSCoder *)aCoder { 
    
}

- (void)traitCollectionDidChange:(nullable UITraitCollection *)previousTraitCollection { 
    
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(nonnull id<UIContentContainer>)container { 

}


- (void)systemLayoutFittingSizeDidChangeForChildContentContainer:(nonnull id<UIContentContainer>)container { 
    
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(nonnull id<UIViewControllerTransitionCoordinator>)coordinator { 
    
}

- (void)willTransitionToTraitCollection:(nonnull UITraitCollection *)newCollection withTransitionCoordinator:(nonnull id<UIViewControllerTransitionCoordinator>)coordinator { 
    
}

- (void)didUpdateFocusInContext:(nonnull UIFocusUpdateContext *)context withAnimationCoordinator:(nonnull UIFocusAnimationCoordinator *)coordinator { 
    
}

- (void)setNeedsFocusUpdate { 
    
}



- (void)updateFocusIfNeeded { 
    
}

@end
