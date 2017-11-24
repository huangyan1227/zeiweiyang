//
//  HYTextView.m
//  ziweiyang
//
//  Created by bidiao on 2017/11/3.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import "HYTextView.h"
#import "UIView+Extension.h"
@interface HYTextView()<UITextViewDelegate>

@property(nonatomic,weak) UILabel * placehoderLabel;
@end


@implementation HYTextView

-(id)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
       // self.backgroundColor = [UIColor clearColor];
        
        UILabel * place = [[UILabel alloc]init];
        
        place.numberOfLines = 0;
        
        place.backgroundColor = [UIColor clearColor];
        
        [self addSubview:place];
        
        
        self.placehoderLabel = place;
        
        
        self.placehoderColor = [UIColor lightGrayColor];
        
        self.font = [UIFont systemFontOfSize:14];
        
      //  self.layer.borderColor = [UIColor blackColor].CGColor;
        
       // self.layer.borderWidth = 1;
        
      //  self.layer.cornerRadius = 6;
        
       // self.layer.masksToBounds = YES;
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChange) name:UITextViewTextDidChangeNotification object:self];
        
        
        
        
        
        
    }
    
    return self;
}

-(void)dealloc{
    
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
-(void)textDidChange{
    
    
    
    
     self.placehoderLabel.hidden = (self.text.length != 0);
    
}


#pragma mark =======公共方法=======
-(void)setText:(NSString *)text{
    [super setText:text];
    
    [self textDidChange];
    
    [self setNeedsLayout];
    
}

-(void)setPlacehoder:(NSString *)placehoder{
    
    
    _placehoder = [placehoder copy];
    
    self.placehoderLabel.text = placehoder;
    
    
    //重新计算控件frame
    
    [self setNeedsLayout];
    
    
    
    
}

-(void)setPlacehoderColor:(UIColor *)placehoderColor{
    
    _placehoderColor = placehoderColor;
    
    self.placehoderLabel.textColor= placehoderColor;
}

-(void)setFont:(UIFont *)font{
    
    
    [super setFont:font];
    
    self.placehoderLabel.font = font;
    
    
    [self setNeedsLayout];
    
    
}

-(void)layoutSubviews{
    
    
    [super layoutSubviews];
    
    
    self.placehoderLabel.x = 5;
    self.placehoderLabel.y = 8;
    
    self.placehoderLabel.width = self.width- 2 * self.placehoderLabel.x;
    
    CGSize size = CGSizeMake(self.placehoderLabel.width, MAXFLOAT);
    
    CGFloat font = self.placehoderLabel.font.descender;
    
    CGRect rest = [self.placehoder boundingRectWithSize:size options:NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font]} context:nil];
    
    
    self.placehoderLabel.height = rest.size.height;
    
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
