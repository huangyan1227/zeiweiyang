//
//  LeftView.h
//  ziweiyang
//
//  Created by bidiao on 2017/10/17.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LeftView;

@protocol LeftViewDeleaget <NSObject>

-(void)lefMenu:(LeftView*)menu didSelectedButtonFromindex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex;
@end

@interface LeftView : UIView


@property(nonatomic,weak) id<LeftViewDeleaget> leftdelegate ;
@end
