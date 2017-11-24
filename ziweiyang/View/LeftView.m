//
//  LeftView.m
//  ziweiyang
//
//  Created by bidiao on 2017/10/17.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import "LeftView.h"
#import "LeftButton.h"


@interface LeftView()

@property(nonatomic,weak) LeftButton * selectebutton;


@end


@implementation LeftView


-(id)initWithFrame:(CGRect)frame{
    
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self setupBtnWithtitle:@"首页"];
        
        [self setupBtnWithtitle:@"每日财运"];
      
        [self setupBtnWithtitle:@"最新消息"];
        
        [self setupBtnWithtitle:@"简介"];
        
        [self setupBtnWithtitle:@"公司简介"];
        
        [self setupBtnWithtitle:@"奇门简介"];
        
        [self setupBtnWithtitle:@"紫薇命盘"];
        
        [self setupBtnWithtitle:@"万年历"];
        
        [self setupBtnWithtitle:@"教室"];
        
        [self setupBtnWithtitle:@"商店"];
        
        [self setupBtnWithtitle:@"公众论坛"];
        
        [self setupBtnWithtitle:@"课程提问"];
        
        [self setupBtnWithtitle:@"联络我们"];
        
        [self setupBtnWithtitle:@"条款及细则"];
        
        [self setupBtnWithtitle:@"隐私政策"];
        
        
        
        
        
        
       
    }
    
    return self;
}

-(LeftButton*)setupBtnWithtitle:(NSString*)title{
    
    LeftButton * btn = [[LeftButton alloc]init];
    
    btn.tag = self.subviews.count;
    
   
    [self addSubview:btn];
    
    [btn addTarget:self action:@selector(buttonclick:) forControlEvents:UIControlEventTouchUpInside];
    
    [btn setTitle:title forState:UIControlStateNormal];
    
    [btn setTitleColor:[UIColor colorWithDisplayP3Red:104/255.0 green:79/255.0 blue:35/255.0 alpha:1] forState:UIControlStateNormal];
    
    btn.titleLabel.adjustsFontSizeToFitWidth = YES;
    
    [btn setBackgroundImage:[UIImage imageWithColor:[UIColor blueColor]] forState:UIControlStateSelected];
    
    btn.adjustsImageWhenHighlighted = NO;
    
    btn.contentHorizontalAlignment =UIControlContentHorizontalAlignmentLeft;
    
    
    return btn;
    
    
    
}
-(void)layoutSubviews{
    
    
    NSUInteger btnCount = self.subviews.count;
    
    CGFloat btnW = self.frame.size.width-10;
    
    CGFloat btnH = self.frame.size.height/btnCount;
    
    for (int i=0; i<btnCount; i++) {
        
        LeftButton * btn = self.subviews[i ];
        
        btn.width= btnW;
        
        btn.height = btnH;
        
        btn.y = i*btnH;
        
        
        btn.x =10;
        
        
        
    }
    
}
-(void)setLeftdelegate:(id<LeftViewDeleaget>)leftdelegate{
    
    
    _leftdelegate = leftdelegate;
    
    [self buttonclick:[self.subviews firstObject]];
    
}
-(void)buttonclick:(LeftButton*)btn{
    
    if ([self.leftdelegate respondsToSelector:@selector(lefMenu:didSelectedButtonFromindex:toIndex:)]) {
        
        [self.leftdelegate lefMenu:self didSelectedButtonFromindex:self.selectebutton.tag toIndex:btn.tag];
        
        
    }
    
    self.selectebutton.selected = NO;
    
    btn.selected = YES;
    
    
    self.selectebutton  =btn;
    
    
    
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
