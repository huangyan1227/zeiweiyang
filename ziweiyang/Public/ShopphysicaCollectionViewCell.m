//
//  ShopphysicaCollectionViewCell.m
//  ziweiyang
//
//  Created by bidiao on 2017/10/30.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import "ShopphysicaCollectionViewCell.h"

#define fontColor(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
@implementation ShopphysicaCollectionViewCell
{
    UIImageView * _imageView;
    UIImageView * _nameImagView;
    UILabel * _labled;
    UILabel * _nalabled;
    UILabel * _dianshulabe;
    UILabel * _bianhaolable;
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
        
     
        
        UIImageView *nameImagView = [[UIImageView alloc]init];
        
        _nameImagView = nameImagView;
        _nameImagView.image = [UIImage imageNamed:@"bookshelves2"];
        
        
        [self.contentView addSubview:nameImagView];
        
        
        
        UILabel * nalabel  =[[UILabel alloc]init];
        
        //    nalabel.backgroundColor = [UIColor yellowColor];
        
        _nalabled = nalabel;
        
        nalabel.textAlignment = NSTextAlignmentCenter;
        
        nalabel.textColor =fontColor(139,94,145);
        
        [self.contentView addSubview:nalabel];
        
        UILabel * bianhao = [[UILabel alloc]init];
        
        _bianhaolable = bianhao;
        
        bianhao.textColor = fontColor(93, 61, 0);
        
        [self.contentView addSubview:bianhao];
        
        
        
        
        UILabel * dianlabel  =[[UILabel alloc]init];
        
        // datelabel.backgroundColor = [UIColor yellowColor];
        
        _dianshulabe= dianlabel;
        
        _dianshulabe.textColor = fontColor(115, 115, 110);
        
        dianlabel.textAlignment = NSTextAlignmentCenter;
        
        [self.contentView addSubview:dianlabel];
        
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
    
  //  _staImage.frame = CGRectMake(self.frame.size.width-45, 2, 40, 40);
    
    //_labled.layer.cornerRadius = 20;
    
    //_staImage.hidden = self.isShow;
    
    _imageView.frame = CGRectMake(15, 0, self.frame.size.width*0.7, 4*self.frame.size.width*0.7/3+20);
    
    _nameImagView.frame = CGRectMake(0, CGRectGetMaxY(_imageView.frame)-5, self.frame.size.width, 20);
    
    _nalabled.frame  = CGRectMake(0, CGRectGetMaxY(_nameImagView.frame), self.frame.size.width, 1.3*h);
    
    _bianhaolable.frame = CGRectMake(0, CGRectGetMaxY(_nalabled.frame), self.frame.size.width, _nalabled.frame.size.height);
    
    _dianshulabe.frame = CGRectMake(0, CGRectGetMaxY(_bianhaolable.frame), self.frame.size.width, _nalabled.frame.size.height);
    
    
    // }
    
}

-(void)setDianString:(NSString *)dianString{
    
    _dianString = dianString;
    
    _dianshulabe.text = dianString;
    
    
    
}
-(void)setBianhaoString:(NSString *)bianhaoString{
    
    _bianhaoString = bianhaoString;
    
    _bianhaolable.text = bianhaoString;
    
    
}
-(void)setStatnameString:(NSString *)statnameString{
    
    _statnameString = statnameString;
    
    _staImage.image = [UIImage imageNamed:statnameString];
    
    
    
}
-(void)setImageString:(NSString *)imageString{
    
    _imageString = imageString;
    
   // [[SDWebImageDownloader sharedDownloader] setShouldDecompressImages:NO];
    
  //  SDImageCache *choa =[SDImageCache sharedImageCache];

    
   // [_imageView sd_setImageWithURL:[NSURL URLWithString:imageString] placeholderImage:[UIImage imageNamed:@""] options:SDWebImageProgressiveDownload];
   // _imageView.image = [UIImage imageNamed:imageString];
    
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
