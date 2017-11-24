//
//  MPublicTableViewCell.m
//  ziweiyang
//
//  Created by bidiao on 2017/11/20.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import "MPublicTableViewCell.h"

@implementation MPublicTableViewCell
{
    UILabel * _nameLabel1;
    UILabel * _nameLabel2;
    UILabel * _nameLabel3;
    UILabel * _nameLabel4;
    UILabel * _nameLabel5;
    UILabel * _nameLabeltext1;
    UILabel * _nameLabeltext2;
    UILabel * _nameLabeltext3;
    UILabel * _nameLabeltext4;
    UILabel * _nameLabeltext5;
    
}
#define fontColor(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
    
        UILabel * name1 = [[UILabel alloc]init];
        
        _nameLabel1 = name1;
        
        //[self titlelable:@"" titletitle:<#(NSString *)#>]
        [self.contentView addSubview:name1];
        
        UILabel * name2 = [[UILabel alloc]init];
        
        _nameLabel2 = name2;
        
        [self.contentView addSubview:name2];
        
        UILabel * name3 = [[UILabel alloc]init];
        
        _nameLabel3 = name3;
        
        [self.contentView addSubview:name3];
        
        UILabel * name4 = [[UILabel alloc]init];
        
        _nameLabel4 = name4;
        
        [self.contentView addSubview:name4];
        
        UILabel * name5 = [[UILabel alloc]init];
        
        _nameLabel5 = name5;
        
        [self.contentView addSubview:name5];
        
        
       UILabel * nametext1 = [[UILabel alloc]init];
        
        _nameLabeltext1 = nametext1;
        
        [self.contentView addSubview: nametext1];
        
        UILabel * nametext2 = [[UILabel alloc]init];
        
        _nameLabeltext2 = nametext2;
        
        [self.contentView addSubview: nametext2];
          UILabel * nametext3 = [[UILabel alloc]init];
        _nameLabeltext3 = nametext3;
        
        [self.contentView addSubview: nametext3];
       
        UILabel * nametext4 = [[UILabel alloc]init];
        
        _nameLabeltext4 = nametext4;
        
        [self.contentView addSubview: nametext4];
        
        UILabel * nametext5 = [[UILabel alloc]init];
        
        _nameLabeltext5 = nametext5;
        
        [self.contentView addSubview: nametext5];
        
    }
    
    return self;
}
-(void)titlelable:(UILabel*)label titletitle:(NSString*)title
{
    
    label.text = title;
    
    label.textColor = fontColor(122, 101, 65);
    
  
    
    
    
}
-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    _nameLabel1.frame = CGRectMake(10, 10, self.contentView.frame.size.width/5, 30);
    
    _nameLabel2.frame = CGRectMake(10, CGRectGetMaxY(_nameLabel1.frame), self.contentView.frame.size.width/5, 30);
    
    _nameLabel3.frame = CGRectMake(10,CGRectGetMaxY(_nameLabel2.frame), self.contentView.frame.size.width/5, 30);
    
    _nameLabel4.frame = CGRectMake(10, CGRectGetMaxY(_nameLabel3.frame), self.contentView.frame.size.width/5, 30);
    
    _nameLabel5.frame = CGRectMake(10, CGRectGetMaxY(_nameLabel4.frame), self.contentView.frame.size.width/5, 30);
    
    _nameLabeltext1.frame = CGRectMake(self.contentView.frame.size.width/2-35, 10, self.contentView.frame.size.width/2, 30);
    
     _nameLabeltext2.frame = CGRectMake(self.contentView.frame.size.width/2-35, CGRectGetMaxY(_nameLabeltext1.frame), self.contentView.frame.size.width/2, 30);
    
     _nameLabeltext3.frame = CGRectMake(self.contentView.frame.size.width/2-35, CGRectGetMaxY(_nameLabeltext2.frame), self.contentView.frame.size.width/2, 30);
    
     _nameLabeltext4.frame = CGRectMake(self.contentView.frame.size.width/2-35, CGRectGetMaxY(_nameLabeltext3.frame), self.contentView.frame.size.width/2, 30);
    
     _nameLabeltext5.frame = CGRectMake(self.contentView.frame.size.width/2-35, CGRectGetMaxY(_nameLabeltext4.frame), self.contentView.frame.size.width/2, 30);
    
    
    
}

-(void)setRightmodel:(RightModel *)rightmodel{
    
    _rightmodel = rightmodel;
    
    [self titlelable:_nameLabel1 titletitle:rightmodel.namelabel1];
    [self titlelable:_nameLabel2 titletitle:rightmodel.namelabel2];
    [self titlelable:_nameLabel3 titletitle:rightmodel.namelabel3];
    [self titlelable:_nameLabel4 titletitle:rightmodel.namelabel4];
    [self titlelable:_nameLabel5 titletitle:rightmodel.namelabel5];
    
    
     _nameLabeltext1.text = rightmodel.namelabeltext1;
     _nameLabeltext2.text = rightmodel.namelabeltext2;
     _nameLabeltext3.text = rightmodel.namelabeltext3;
     _nameLabeltext4.text = rightmodel.namelabeltext4;
    
    if (rightmodel.isColor) {
          _nameLabeltext4.textColor = [UIColor lightGrayColor];
    }else{
          _nameLabeltext4.textColor = [UIColor redColor];
    }
  
    _nameLabeltext1.textColor = [UIColor lightGrayColor];
    _nameLabeltext2.textColor = [UIColor lightGrayColor];
    _nameLabeltext3.textColor = [UIColor lightGrayColor];
    _nameLabeltext5.textColor = [UIColor lightGrayColor];
                                 
     _nameLabeltext5.text = rightmodel.namelabeltext5;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
