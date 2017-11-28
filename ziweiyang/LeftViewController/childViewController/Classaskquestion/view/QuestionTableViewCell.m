//
//  QuestionTableViewCell.m
//  ziweiyang
//
//  Created by bidiao on 2017/11/3.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import "QuestionTableViewCell.h"

@implementation QuestionTableViewCell
{
    UILabel * _titlLable;
   // UILabel * _contentlable;
    UIImageView * _nameimageView;
    UILabel * _namelable;
   // UILabel * _taiyinlable;
    UILabel * _chakanlable;
    UILabel * _datelable;
    
    
}
#define fontColor(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        UILabel * titleLable = [[UILabel alloc]init];
        
        _titlLable = titleLable;
        //  _titlLable.backgroundColor = [UIColor redColor];
        
        _titlLable.font = [UIFont systemFontOfSize:18];
        _titlLable.textColor = fontColor(121, 101, 66);
        
        [self.contentView addSubview:titleLable];
        
      //  UILabel * contlable = [[UILabel alloc]init];
        
       // _contentlable = contlable;
        // _contentlable.backgroundColor = [UIColor yellowColor];
        
      //  contlable.textColor = fontColor(117, 118, 109);;
        
      //  [self.contentView addSubview:contlable];
        
        UIImageView * imageView = [[UIImageView alloc]init];
        
        //  imageView.backgroundColor = [UIColor greenColor];
        
        _nameimageView = imageView;
        
        [self.contentView addSubview:imageView];
        
        UILabel * namelable = [[UILabel alloc]init];
        
        //  namelable.backgroundColor = [UIColor blueColor];
        
        _namelable = namelable;
        
        
        _namelable.textColor = fontColor(121, 101, 66);
        
       
        namelable.adjustsFontSizeToFitWidth = YES;
        
        [self.contentView addSubview:namelable];
        
     //   UILabel * tailabel = [[UILabel alloc]init];
        
     //   _taiyinlable = tailabel;
        
        //   tailabel.backgroundColor = [UIColor darkGrayColor];
    //    tailabel.textColor = [UIColor lightGrayColor];
    //    tailabel.adjustsFontSizeToFitWidth =YES;
        
      //  [self.contentView addSubview:tailabel];
        
        UILabel *chancklable = [[UILabel alloc]init];
        
        _chakanlable = chancklable;
        
        //   chancklable.backgroundColor = [UIColor orangeColor];
        
        _chakanlable.textColor = [UIColor lightGrayColor];
        
        _chakanlable.adjustsFontSizeToFitWidth = YES;
        
        _chakanlable.font= [UIFont systemFontOfSize:14];
        [self.contentView addSubview:chancklable];
        
        UILabel * datelable = [[UILabel alloc]init];
        
        _datelable = datelable;
        
        _datelable.textColor = [UIColor lightGrayColor];
        //  _datelable.backgroundColor = [UIColor lightGrayColor];
        _datelable.adjustsFontSizeToFitWidth = YES;
        [self.contentView addSubview:datelable];
        self.selectionStyle= UITableViewCellSelectionStyleNone;
        
        
        
    }
    
    return self;
    
}
-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    _titlLable.frame = CGRectMake(5, 5, self.contentView.width-10, 40);
    
    
  //  if (self.isConten) {
        _nameimageView.frame = CGRectMake(10, CGRectGetMaxY(_titlLable.frame)+20, 40, 40);
        
   /// }else{
     //   _contentlable.frame = CGRectMake(5, CGRectGetMaxY(_titlLable.frame)+2, self.contentView.width-10, 120);
        
    //    _nameimageView.frame = CGRectMake(5, CGRectGetMaxY(_contentlable.frame)+5, 40, 40);
  //  }
    
    
   /// NSLog(@" %fff",self.contentView.width);
    _namelable.frame = CGRectMake(CGRectGetMaxX(_nameimageView.frame)+5, _nameimageView.y+5, self.contentView.width/3, 20);
    _namelable.centerY= _nameimageView.centerY;
    
   // _taiyinlable.frame = CGRectMake(_namelable.x, CGRectGetMaxY(_namelable.frame), self.contentView.width/3, 20);
    
    _chakanlable.frame = CGRectMake(self.contentView.width-85, _namelable.y, 80, 20);
    
    _datelable.frame = CGRectMake(self.contentView.width/2, CGRectGetMaxY(_chakanlable.frame), self.contentView.width/2, 20);
    
    
    
    
}
-(void)setTitleString:(NSString *)titleString{
    _titleString= titleString;
    
    _titlLable.text = titleString;
}
//-(void)setContentString:(NSString *)contentString{
//    _contentString = contentString;
//
//    _contentlable.text = contentString;
//}
-(void)setNameimageString:(NSString *)nameimageString{
    
    _nameimageString = nameimageString;
    
    
    //NSString * string = @"https://www.ziweiyang.com/";
    //头像
    [_nameimageView sd_setImageWithURL:[NSURL URLWithString:[AppNetWork_Post stringByAppendingString:nameimageString]]];
    //_nameimageView.image = [UIImage imageNamed:nameimageString];
    
}

-(void)setNameString:(NSString *)nameString{
    
    _nameString = nameString;
    
    _namelable.text = nameString;
}

//-(void)setTaiyinString:(NSString *)taiyinString{
//
//    _taiyinString = taiyinString;
//    _taiyinlable.text = taiyinString;
//}
-(void)setChakanlagString:(NSString *)chakanlagString{
    
    _chakanlagString = chakanlagString;
    
    _chakanlable.text = [NSString stringWithFormat:@"回復:%@",chakanlagString];
}
-(void)setDateString:(NSString *)dateString{
    
    _dateString = dateString;
    
    // 时间字符串
    
    
    
    
    
    //NSString *string = @"2016-7-16 09:33:22";
    
    // 日期格式化类
    
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    
    // 设置日期格式 为了转换成功
    
    format.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    //yyyy
    // NSString * -> NSDate *
    
    NSDate *data = [format dateFromString:dateString];
    
    NSDateFormatter *formatdate = [[NSDateFormatter alloc]init];
    
    
    
   formatdate.dateFormat = @"MM月dd日yyyy年 HH:mm:ss";
    
    
    NSString *newString = [formatdate stringFromDate:data];
    
    //NSLog(@" %@ffkk%@",dateString,newString);

    _datelable.text =  [NSString stringWithFormat:@"發表日期:%@",newString];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
