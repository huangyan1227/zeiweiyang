//
//  TransactionTableViewCell.m
//  ziweiyang
//
//  Created by bidiao on 2017/11/20.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import "TransactionTableViewCell.h"

@implementation TransactionTableViewCell

{
    UILabel * _zhengdanLabel;
    UILabel * _dinashuLabel;
    UILabel * _jiaoyixingLabel;
    UILabel * _dateLabel;
    
    UILabel * _zhengdanLabeltext;
    UILabel * _dinashuLabeltext;
    UILabel * _jiaoyixingLabeltext;
    UILabel * _dateLabeltext;
}
#define fontColor(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        UILabel * zhenglabel = [[UILabel alloc]init];
        
        _zhengdanLabel = zhenglabel;
        
        [self titlelable:zhenglabel titletitle:@"账单号码:"];
        
        [self.contentView addSubview:zhenglabel];
        
        UILabel * dianshulabel = [[UILabel alloc]init];
        
        _dinashuLabel =dianshulabel;
        
        [self titlelable:dianshulabel titletitle:@"点数:"];
        
        [self.contentView addSubview:dianshulabel];
        
        UILabel * jiaoyilabel = [[UILabel alloc]init];
        
        _jiaoyixingLabel = jiaoyilabel;
        
        [self titlelable:jiaoyilabel titletitle:@"交易详情:"];
        
        [self.contentView addSubview:jiaoyilabel];
        
        UILabel * datelabel = [[UILabel alloc]init];
        
        [self titlelable:datelabel titletitle:@"交易日期:"];
        
        _dateLabel = datelabel;
        
        
        [self.contentView addSubview:datelabel];
        
     
        
        UILabel * zhenglabeltext = [[UILabel alloc]init];
        
        _zhengdanLabeltext = zhenglabeltext;
        
        [self.contentView addSubview:zhenglabeltext];
        
        zhenglabeltext.textColor = fontColor(125, 124, 116);
        
        UILabel * dianshulabeltext = [[UILabel alloc]init];
        
        _dinashuLabeltext =dianshulabeltext;
        
        
        
        [self.contentView addSubview:dianshulabeltext];
        
        UILabel * jiaoyilabeltext = [[UILabel alloc]init];
        
        _jiaoyixingLabeltext = jiaoyilabeltext;
        
         jiaoyilabeltext.textColor = fontColor(125, 124, 116);
        
        [self.contentView addSubview:jiaoyilabeltext];
        
        UILabel * datelabeltext = [[UILabel alloc]init];
        
        
        _dateLabeltext = datelabeltext;
        
        _dateLabeltext.textColor = fontColor(125, 124, 116);
        
        [self.contentView addSubview:datelabeltext];
        
        
        
        
    }
    
    
    
    
    
    
    
    return self;
    
}
-(void)titlelable:(UILabel*)label titletitle:(NSString*)title{
    
    label.text = title;
    
    label.textColor = fontColor(122, 101, 65);
    
    
    
}
-(void)layoutSubviews{
    
    [super layoutSubviews];
    
      _zhengdanLabel.frame = CGRectMake(10, 10, self.contentView.frame.size.width/6+20, 30);
    
      _dinashuLabel.frame = CGRectMake(10, CGRectGetMaxY(_zhengdanLabel.frame), self.contentView.frame.size.width/6+20, 30);
    
      _jiaoyixingLabel.frame = CGRectMake(10, CGRectGetMaxY(_dinashuLabel.frame), self.contentView.frame.size.width/6+20, 30);
    
      _dateLabel.frame = CGRectMake(10, CGRectGetMaxY(_jiaoyixingLabel.frame), self.contentView.frame.size.width/6+20, 30);
    
     _zhengdanLabeltext.frame = CGRectMake(self.contentView.frame.size.width/2-35, 10, self.contentView.frame.size.width/2, 30);
    
     _dinashuLabeltext.frame = CGRectMake(self.contentView.frame.size.width/2-35, CGRectGetMaxY(_zhengdanLabeltext.frame), self.contentView.frame.size.width/2, 30);
    
     _jiaoyixingLabeltext.frame = CGRectMake(self.contentView.frame.size.width/2-35,CGRectGetMaxY(_dinashuLabeltext.frame), self.contentView.frame.size.width/2, 30);
    
     _dateLabeltext.frame = CGRectMake(self.contentView.frame.size.width/2-35,CGRectGetMaxY(_jiaoyixingLabeltext.frame), self.contentView.frame.size.width/2, 30);

}
-(void)setRightmodel:(RightModel *)rightmodel{
    
    
    
    _rightmodel = rightmodel;
    
    
    _zhengdanLabeltext.text = rightmodel.zhangdao;
    
    _dinashuLabeltext.text = rightmodel.dianshu;
    
    _jiaoyixingLabeltext.text = rightmodel.jiaoyi;
    
    _dateLabeltext.text = rightmodel.date;
    
    if ([rightmodel.dianshu intValue]>0) {
        
        _dinashuLabeltext.textColor = fontColor(0, 172, 0);
        
    }else{
        _dinashuLabeltext.textColor = [UIColor redColor];
        
        
    }
    
   
    
    
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
