//
//  ClassshopCollectionViewCell.m
//  ziweiyang
//
//  Created by bidiao on 2017/10/25.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import "ClassshopCollectionViewCell.h"



#define fontColor(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]

@implementation ClassshopCollectionViewCell
{
    UIImageView * _imageView;
    UIImageView * _nameImagView;
    UILabel * _labled;
    UILabel * _nalabled;
    UILabel * _datelabe;
    UILabel * _showlable;
    UIImageView * _staImage;
}

-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        
//        if (self.isShow) {
//
//            UILabel * showlable = [[UILabel alloc]init];
//
//            _showlable = showlable;
//
//            [self addSubview:showlable];
//
//            showlable.text =@"暂无记录";
//
//
//        }else{
        
            //_showlable.hidden = YES;
            
        UIImageView *imagView = [[UIImageView alloc]init];
        
        _imageView = imagView;
       
      
        
        [self.contentView addSubview:imagView];
        
        UIImageView * sat = [[UIImageView alloc]init];
        
        [self.contentView addSubview:sat];
        
       
        
       // sat.backgroundColor = [UIColor yellowColor];
        _staImage = sat;
        
//        UILabel * label  =[[UILabel alloc]init];
//
//        label.backgroundColor = [UIColor redColor];
//
//
//        label.layer.masksToBounds = YES;
//        _labled = label;
//
//
//
//        label.numberOfLines = 0;
//
//        label.textAlignment = NSTextAlignmentCenter;
//
//        label.font = [UIFont systemFontOfSize:10];
//
//        label.textColor = [UIColor whiteColor];
//
//        label.adjustsFontSizeToFitWidth = YES;
        //_labled.backgroundColor = [UIColor redColor];
      
        
        //[self.contentView addSubview:label];
        
     
        
        UIImageView *nameImagView = [[UIImageView alloc]init];
        
        _nameImagView = nameImagView;
       //
    _nameImagView.image = [UIImage imageNamed:@"bookshelves2"];
       
        [self.contentView addSubview:nameImagView];
        
        
        
        UILabel * nalabel  =[[UILabel alloc]init];
        
    //    nalabel.backgroundColor = [UIColor yellowColor];
        
        _nalabled = nalabel;
        
        nalabel.textAlignment = NSTextAlignmentCenter;
        
        nalabel.adjustsFontSizeToFitWidth = YES;
       
        nalabel.textColor =fontColor(139,94,145);
        
        [self.contentView addSubview:nalabel];
        
        
        UILabel * datelabel  =[[UILabel alloc]init];
        
      // datelabel.backgroundColor = [UIColor yellowColor];
        
        _datelabe = datelabel;
        
        datelabel.textAlignment = NSTextAlignmentCenter;
        
        [self.contentView addSubview:datelabel];
        
        //[self.contentView addSubview:label];
      
        }
//    }
    return self;
}
-(void)layoutSubviews{
    
    [super layoutSubviews];
//    if (self.isShow) {
//
//        _showlable.frame = CGRectMake(100, 100, 100, 80);
//
//        _showlable.center = CGPointMake(self.center.x, self.center.y);
//
//
//    }else{
    
    CGFloat h = (self.frame.size.height -60)/8;
    
    _staImage.frame = CGRectMake(self.frame.size.width-45, 2, 40, 40);
    
      //_labled.layer.cornerRadius = 20;
    
      //_staImage.hidden = self.isShow;
    
    _imageView.frame = CGRectMake(15, CGRectGetMaxY(_staImage.frame)-10, self.frame.size.width*0.7, 4*self.frame.size.width*0.7/3);
    
      _nameImagView.frame = CGRectMake(0, CGRectGetMaxY(_imageView.frame)-5, self.frame.size.width, 20);
    
    _nalabled.frame  = CGRectMake(0, CGRectGetMaxY(_nameImagView.frame), self.frame.size.width, 1.3*h);
    //_nalabled.backgroundColor = [UIColor yellowColor];
    
    _datelabe.frame = CGRectMake(0, CGRectGetMaxY(_nalabled.frame)+10, self.frame.size.width, _nalabled.frame.size.height+10);
  //  _datelabe.backgroundColor = [UIColor redColor];
    
   // }
    
}
-(void)setDateString:(NSString *)dateString{
    _dateString = dateString;
    
    _datelabe.text = dateString;
    
}
-(void)setStatnameString:(NSString *)statnameString{
    
    _statnameString = statnameString;
    
     _staImage.image = [UIImage imageNamed:statnameString];
    
    //_nameImagView.image = [UIImage imageNamed:@"bookshelves2"];
    
    
}
-(void)setImageString:(NSString *)imageString{
    
    _imageString = imageString;
    
    
    _imageView.image = [UIImage imageNamed:imageString];
    
 //  _nameImagView.image = [UIImage imageNamed:@"bookshelves2"];
    
}
-(void)setUrlImage:(NSString *)urlImage{
    
    _urlImage = urlImage;
    
     [_imageView sd_setImageWithURL:[NSURL URLWithString:urlImage] placeholderImage:[UIImage imageNamed:@"bookShading2"]];
    
   
    //_nameImagView.image = [UIImage imageNamed:@"bookshelves"];
    
}
-(void)setBooknameString:(NSString *)booknameString{
    
    _booknameString = booknameString;
    
    _nalabled.text = booknameString;
}
-(void)updateConstraints{
    // _labled.frame = CGRectMake(5, 2, self.frame.size.width-10, self.frame.size.height-20);
    [super updateConstraints];
    
    
}
@end
