//
//  BasicTableViewCell.m
//  ziweiyang
//
//  Created by bidiao on 2017/11/27.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import "BasicTableViewCell.h"

@implementation BasicTableViewCell
{
    UIImageView * _icomImageView;
    
    UILabel *  nameLabel;
    
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
//-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
//    
//    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
//    
//    
//    if (self) {
//        
//     //   UIImageView * iconmageView = [UIImageView new];
//        
//     //   iconmageView.backgroundColor = [UIColor yellowColor];
//        
//        UILabel * namelabel = [[UILabel alloc]init];
//        
//        namelabel.backgroundColor = [UIColor redColor];
//        
//        
//        
//        
//        
//    }
//    
//    
//    
//    
//    
//    return self;
//    
//    
//}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
