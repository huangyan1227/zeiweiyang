//
//  RightMainViewController.h
//  ziweiyang
//
//  Created by bidiao on 2017/11/14.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RightMainViewController;

@protocol RightViewDeleage<NSObject>

-(void)rightMenudidSelectedButtonFromindex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex;
@end
@interface RightMainViewController : UIViewController
@property(nonatomic,weak) id <RightViewDeleage>rigdeleage;
@end
