//
//  TitleSlider.m
//  slide
//
//  Created by bidiao on 2017/10/24.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import "TitleSlider.h"


@interface TitleSlider()<UIScrollViewDelegate>

@property(nonatomic,strong) UIScrollView * titleView;
@property(nonatomic,strong) UIScrollView * contentScrollView;
@property(nonatomic,weak) UIButton * selTitleButton;
@property(nonatomic,strong) NSMutableArray * buttons;
@property(nonatomic,strong) UIViewController * selfViewController;
@end
static CGFloat const titleH = 44;
static CGFloat const navBarH = 64;

#define kNaHeight ([[UIApplication sharedApplication] statusBarFrame].size.height>20?20:0)
#define HYKScreenW [UIScreen mainScreen].bounds.size.width
#define HYKScreenH [UIScreen mainScreen].bounds.size.height
#define fontColor(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]

@implementation TitleSlider
-(NSMutableArray *)buttons{
    if (!_buttons) {
        _buttons = [NSMutableArray array];
    }
    return _buttons;
}
-(void)adduiViewcontroll:(UIViewController *)vc title:(NSArray *)title addvieController:(NSArray *)vcArray{
    
    self.selfViewController = vc;
    
    
    [self addTitleView];
    
    [self addChildView:vcArray title:title];
    
    [self setupContentScrollview];
    
    [self setupTitle];
    
    //self.contentScrollView.delegate = vc;
    
}
-(void)addTitleView{
    
    CGFloat y = self.selfViewController.navigationController ? navBarH+kNaHeight:0;
    
    CGRect  rect = CGRectMake(0, y, HYKScreenW, titleH);
    
    UIScrollView * view = [[UIScrollView alloc]initWithFrame:rect];
    
    [self.selfViewController.view addSubview:view];
    
    
    self.titleView = view;
    
    self.titleView.backgroundColor = fontColor(250, 223, 169);
    
}
-(void)setupContentScrollview{
    
    
    CGFloat y = CGRectGetMaxY(self.titleView.frame);
    CGRect rect = CGRectMake(0, y, HYKScreenW, HYKScreenH-108);
    
    UIScrollView *contentScrollView = [[UIScrollView alloc]initWithFrame:rect];
    
    
    self.contentScrollView.backgroundColor = [UIColor redColor];
    [self.selfViewController.view addSubview:contentScrollView];
    
    self.contentScrollView= contentScrollView;
    
    contentScrollView.contentSize = CGSizeMake(self.selfViewController.childViewControllers.count*HYKScreenW, 0);
    contentScrollView.pagingEnabled = YES;
    contentScrollView.showsHorizontalScrollIndicator = NO;
    contentScrollView.alwaysBounceHorizontal = NO;
    contentScrollView.delegate = self;
}
-(void)addChildView:(NSArray*)vcArray title:(NSArray*)title{
    
    UIViewController * ziyei = [UIViewController new];
    ziyei.view.backgroundColor = [UIColor redColor];
    
    
    for (int i=0; i<vcArray.count; i++) {
        
         [self addchild:title[i] vicontroller:vcArray[i]];
    }
   
 
    
}
-(void)addchild:(NSString*)title vicontroller:(UIViewController*)vc{
    
    vc.title = title;
    
    [self.selfViewController addChildViewController:vc];
    
    
}
-(void)setupTitle{
    
    NSUInteger conut = self.selfViewController.childViewControllers.count;
    
    CGFloat x= 20;
    CGFloat w= (HYKScreenW-40)/conut;
    
    CGFloat h = titleH;
    
    for (int i =0 ; i<conut; i++) {
        
        UIViewController * vc =self.selfViewController.childViewControllers[i];
        
        UIButton *btn = [[UIButton alloc] init];
        
        
        
        
        btn.tag = i;
        [btn setTitle:vc.title forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        
        [btn addTarget:self action:@selector(chick:) forControlEvents:UIControlEventTouchDown];
        
        [self.buttons addObject:btn];
        [self.titleView addSubview:btn];
        
        if (i == 0)
        {
            [self chick:btn];
            
            
            
        }else{
            x = i * w+20;
        }
        CGRect rect = CGRectMake(x, 0, w, h);
        btn.frame =rect;
        // btn.backgroundColor = [UIColor yellowColor];
        // btn.titleLabel.textAlignment = NSTextAlignmentCenter;
        
        
        
        
        
        
    }
    
    self.titleView.contentSize = CGSizeMake(conut * w, 0);
    self.titleView.showsHorizontalScrollIndicator = NO;
}
- (void)chick:(UIButton *)btn
{
    //NSLog(@"dianji ");
    [self selTitleBtn:btn];
    
    NSUInteger i = btn.tag;
    CGFloat x = i * HYKScreenW;
    
    [self setUpOneChildViewController:i];
    self.contentScrollView.contentOffset = CGPointMake(x, 0);
    
}
- (void)selTitleBtn:(UIButton *)btn
{
    
    
    [self.selTitleButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //self.selTitleButton.transform = CGAffineTransformIdentity;
    [self.selTitleButton setBackgroundColor:fontColor(250, 223, 169)];
    [btn setTitleColor: fontColor(139,94,145) forState:UIControlStateNormal];
    [btn setBackgroundColor:fontColor(248, 243, 235)];
    //btn.transform = CGAffineTransformMakeScale(maxTitleScale, maxTitleScale);
    
    self.selTitleButton = btn;
    [self setupTitleCenter:btn];
}
- (void)setUpOneChildViewController:(NSUInteger)a
{
    
    
  //  NSLog(@"%lu",(unsigned long)a);
    
    
    NSInteger  concut= self.selfViewController.childViewControllers.count;
    
    for (int i=0; i<concut; i++) {
        
        
        
        CGFloat x = i * HYKScreenW;
        
        UIViewController *vc = self.selfViewController.childViewControllers[i];
        
        
        
        if (vc.view.superview) {
            return;
        }
        vc.view.frame = CGRectMake(x, 0, HYKScreenW, HYKScreenH - self.contentScrollView.frame.origin.y);
        
        [self.contentScrollView addSubview:vc.view];
    };
    
    
    
    
    
}
- (void)setupTitleCenter:(UIButton *)btn
{
    CGFloat offset = btn.center.x - HYKScreenW * 0.5;
    
    if (offset < 0)
    {
        offset = 0;
    }
    
    
    CGFloat maxOffset = self.titleView.contentSize.width - HYKScreenW;
    if (offset > maxOffset)
    {
        offset = maxOffset;
    }
    
    // [self.titleView setContentOffset:CGPointMake(offset, 0) animated:YES];
    
    
}


#pragma mark - UIScrollViewDelegate


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{ // NSLog(@"dddg");
    
    
    NSUInteger i = self.contentScrollView.contentOffset.x / HYKScreenW;
    [self selTitleBtn:self.buttons[i]];
    [self setUpOneChildViewController:i];
    
    
}
@end
