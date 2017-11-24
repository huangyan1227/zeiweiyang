//
//  MainNavigationViewController.h
//  ziweiyang
//
//  Created by bidiao on 2017/10/18.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"
@interface MainNavigationViewController : UINavigationController
-(void)click:(UIButton*)bg;

@property(nonatomic,strong) MainViewController * maind;
@end
