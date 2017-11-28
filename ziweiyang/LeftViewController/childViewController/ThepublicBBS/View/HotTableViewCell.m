//
//  HotTableViewCell.m
//  ziweiyang
//
//  Created by bidiao on 2017/10/31.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import "HotTableViewCell.h"

@implementation HotTableViewCell
{
    UILabel * _titlLable;
    UILabel * _contentlable;
    UIImageView * _nameimageView;
    UILabel * _namelable;
    UILabel * _taiyinlable;
    UILabel * _chakanlable;
    UILabel * _datelable;
    
    
}
#define fontColor(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if(self){
        
        UILabel * titleLable = [[UILabel alloc]init];
        
        _titlLable = titleLable;
    
        
        _titlLable.font = [UIFont systemFontOfSize:18];
        _titlLable.textColor = fontColor(121, 101, 66);
        
        [self.contentView addSubview:titleLable];
        
        UILabel * contlable = [[UILabel alloc]init];
        
        _contentlable = contlable;
      
        contlable.textColor = fontColor(117, 118, 109);;
        
        [self.contentView addSubview:contlable];
        
        UIImageView * imageView = [[UIImageView alloc]init];
        
     
        _nameimageView = imageView;
        
        [self.contentView addSubview:imageView];
        
        UILabel * namelable = [[UILabel alloc]init];
        
      
        _namelable = namelable;
        
        namelable.textColor = [UIColor lightGrayColor];
        namelable.adjustsFontSizeToFitWidth = YES;
        
        [self.contentView addSubview:namelable];
        
        UILabel * tailabel = [[UILabel alloc]init];
        
        _taiyinlable = tailabel;
        
   
        tailabel.textColor = [UIColor lightGrayColor];
        tailabel.adjustsFontSizeToFitWidth =YES;
        
        [self.contentView addSubview:tailabel];
        
        UILabel *chancklable = [[UILabel alloc]init];
        
        _chakanlable = chancklable;

        
        _chakanlable.textColor = [UIColor lightGrayColor];
        
          _chakanlable.adjustsFontSizeToFitWidth = YES;
        [self.contentView addSubview:chancklable];
        
        UILabel * datelable = [[UILabel alloc]init];
        
        _datelable = datelable;
        
        _datelable.textColor = [UIColor lightGrayColor];
     
        _datelable.adjustsFontSizeToFitWidth = YES;
        [self.contentView addSubview:datelable];
        self.selectionStyle= UITableViewCellSelectionStyleNone;
        
    }
    
    return self;
    
}
-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    _titlLable.frame = CGRectMake(5, 5, self.contentView.width-10, 40);
    
    
    if (self.isConten) {
          _nameimageView.frame = CGRectMake(5, CGRectGetMaxY(_titlLable.frame)+20, 40, 40);
    
    }else{
    _contentlable.frame = CGRectMake(5, CGRectGetMaxY(_titlLable.frame)+2, self.contentView.width-10, 120);
        
      _nameimageView.frame = CGRectMake(5, CGRectGetMaxY(_contentlable.frame)+5, 40, 40);
    }
   
    
   
    _namelable.frame = CGRectMake(50, _nameimageView.y, self.contentView.width/3, 20);
    
    _taiyinlable.frame = CGRectMake(_namelable.x, CGRectGetMaxY(_namelable.frame), self.contentView.width/3, 20);
    
    _chakanlable.frame = CGRectMake(self.contentView.width-85, _namelable.y, 80, 20);
    
    _datelable.frame = CGRectMake(self.contentView.width-165, CGRectGetMaxY(_chakanlable.frame), 160, 20);
    
    
    
    
}
-(void)setTitleString:(NSString *)titleString{
    _titleString= titleString;
    
    _titlLable.text = titleString;
}
-(void)setContentString:(NSString *)contentString{
    _contentString = contentString;
    
    _contentlable.text = contentString;
}
-(void)setNameimageString:(NSString *)nameimageString{
    
    _nameimageString = nameimageString;
    
    [_nameimageView sd_setImageWithURL:[NSURL URLWithString:nameimageString] placeholderImage:[UIImage imageNamed:@"user"]];
    
   
}

-(void)setNameString:(NSString *)nameString{
    
    _nameString = nameString;
    
    _namelable.text = nameString;
}

-(void)setTaiyinString:(NSString *)taiyinString{
    
    _taiyinString = taiyinString;
    _taiyinlable.text = taiyinString;
}
-(void)setChakanlagString:(NSString *)chakanlagString{
    
    _chakanlagString = chakanlagString;
    
    _chakanlable.text = chakanlagString;
}
-(void)setDateString:(NSString *)dateString{
    
    _dateString = dateString;
    
    _datelable.text = dateString;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
