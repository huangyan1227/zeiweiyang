//
//  HotChildViewController.h
//  ziweiyang
//
//  Created by bidiao on 2017/11/13.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BBSModel.h"
@interface HotChildViewController : UIViewController
@property(nonatomic,strong) BBSModel * model;
@property(nonatomic,copy) NSString * formid;
@property(nonatomic) BOOL isCellone ;
@end
