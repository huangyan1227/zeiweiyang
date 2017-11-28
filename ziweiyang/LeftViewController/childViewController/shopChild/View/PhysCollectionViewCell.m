//
//  PhysCollectionViewCell.m
//  ziweiyang
//
//  Created by bidiao on 2017/11/22.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import "PhysCollectionViewCell.h"

@implementation PhysCollectionViewCell
{
    
    UIImageView * _imageView;
}
-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        
        UIImageView * imageView = [[UIImageView alloc]init];
        
        [self.contentView addSubview:imageView];
        _imageView = imageView;
        
    }
    
    
    
    return self;
}

-(void)layoutSubviews{
    
    
    [super layoutSubviews];
    
    _imageView.frame = self.contentView.frame;
    
    
    
    
}
-(void)setImagurl:(NSString *)imagurl{
    
    _imagurl = imagurl;
    
   // _imageView.image=
}
@end
