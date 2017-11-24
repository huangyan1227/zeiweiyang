//
//  HotChiledTableViewCell.h
//  ziweiyang
//
//  Created by bidiao on 2017/11/13.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BBSModel.h"
@interface HotChiledTableViewCell : UITableViewCell
@property(nonatomic,strong) UIButton * didseletbutton;

@property(nonatomic,strong) BBSModel * bbmodel;

@property (nonatomic, copy) NSString *text;

@property(nonatomic, copy) NSString * imageSrccont;

@property(nonatomic, copy) NSString * buttonimageString;

@property(nonatomic) BOOL isCellone ;
@end
