//
//  ThehomeTableViewCell.m
//  ziweiyang
//
//  Created by bidiao on 2017/10/18.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import "ThehomeTableViewCell.h"
@implementation ThehomeTableViewCell
{
    UILabel * _lable;
    UILabel * _datelabe;
    UIImageView * _imageView;
    
    
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
       
        UILabel * labe =[[UILabel alloc]init];
        
        _lable = labe;
        
        _lable.textColor = [UIColor colorWithDisplayP3Red:128/255.0 green:32/255.0 blue:140/255.0 alpha:1];
       // _lable.backgroundColor = [UIColor redColor];
        
        [self.contentView addSubview:labe];
        
        UILabel * datelabe = [[UILabel alloc]init];
        
        [self.contentView addSubview:datelabe];
        
        _datelabe = datelabe;
        
        _datelabe.textColor = [UIColor colorWithDisplayP3Red:100/255.0 green:100/255.0 blue:98/255.0 alpha:1];
      //  _datelabe.backgroundColor = [UIColor blueColor];
        
        UIImageView * imageView = [[UIImageView alloc]init];
        
        [self.contentView addSubview:imageView];
        
        _imageView = imageView;
        
      //  imageView.backgroundColor =[UIColor yellowColor];
        
        self.selectionStyle  = UITableViewCellSelectionStyleNone;
        
       // UIView * view = [UIView new];
        
        //view.backgroundColor = [UIColor redColor];
        
        //view.frame = CGRectMake(0, 0, 10, 10);
        
        
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        //self.accessoryView = view;
      // self.backgroundColor = [UIColor colorWithDisplayP3Red:250/255.0 green:243/255.0 blue:231/255.0 alpha:1];
        self.backgroundColor = [UIColor clearColor];
        
    }
    
    
    
    return self;
    
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    _imageView.frame = CGRectMake(5, 5, self.contentView.frame.size.width*1.4/3, self.contentView.frame.size.height-10);
    
    _lable.frame = CGRectMake(CGRectGetMaxX(_imageView.frame)+10, 5, self.contentView.frame.size.width/5*2.3-20, _imageView.frame.size.height/3);
    
    _datelabe.frame = CGRectMake(CGRectGetMaxX(_imageView.frame)+10, CGRectGetMaxY(_lable.frame)+5, self.contentView.frame.size.width/5*2-20, _imageView.frame.size.height/3);
    
}

-(void)setConstNString:(NSString *)constNString{
    
    _constNString = constNString;
    
    _lable.text = constNString;
    
}

-(void)setDateNstring:(NSString *)dateNstring{
    
    
    _dateNstring = dateNstring;
    
    _datelabe.text = dateNstring;
    
}
-(void)setImageUrlString:(NSString *)imageUrlString{
    
    
    _imageUrlString = imageUrlString;
    
   // [[SDWebImageDownloader sharedDownloader] setShouldDecompressImages:NO];
    
    [_imageView sd_setImageWithURL:[NSURL URLWithString:imageUrlString]];
    
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
