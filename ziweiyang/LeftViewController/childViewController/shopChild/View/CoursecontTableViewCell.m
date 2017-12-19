//
//  CoursecontTableViewCell.m
//  ziweiyang
//
//  Created by bidiao on 2017/11/28.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import "CoursecontTableViewCell.h"

@implementation CoursecontTableViewCell
{
    UILabel * _contLable1;
    
    UILabel * _contLable2;
    
    
    
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        
        UILabel * cont1label = [UILabel new];
        
        _contLable1 = cont1label;
        
        _contLable1.font =[UIFont systemFontOfSize:20];
        
        _contLable1.textAlignment = NSTextAlignmentCenter;
        
      //  cont1label.backgroundColor = [UIColor blueColor];
        UILabel *cont2label = [UILabel new];
        
        _contLable2 = cont2label;
        
        _contLable2.textAlignment = NSTextAlignmentCenter;
        
    //    cont2label.backgroundColor = [UIColor yellowColor];
        [self.contentView sd_addSubviews:@[_contLable1,_contLable2]];
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        _contLable1.sd_layout.topSpaceToView(self.contentView, 5).leftSpaceToView(self.contentView, 10).rightSpaceToView(self.contentView, 10).autoHeightRatio(0);
        
        _contLable2.sd_layout.leftSpaceToView(self.contentView, 10).rightSpaceToView(self.contentView, 10).topSpaceToView(cont1label, 5).heightIs(30);
        
        [self setupAutoHeightWithBottomView:_contLable2 bottomMargin:10];
        
    }
    
    
    return self;
    
}

//-(void)setCoursModel:(CoursecontModel *)coursModel{
//
//    _coursModel = coursModel;
//
//   // NSLog(@" %@",coursModel.total_page);
//
//
//}
-(void)setCoursModel:(CoursecontModel *)coursModel{

    _coursModel = coursModel;

//    NSLog(@"%@ffgg",coursModel.detail);
   _contLable1.text = coursModel.page_section;
//
    _contLable2.text = coursModel.page_section2;



   //  [self setupAutoHeightWithBottomView:_contLable2 bottomMargin:10];

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
