//
//  PhyModel.h
//  ziweiyang
//
//  Created by bidiao on 2017/11/22.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PhyModel : NSObject
@property(nonatomic,copy) NSString * idName;
@property(nonatomic,copy) NSString * titleName;
@property(nonatomic,copy) NSString * bianName;
@property(nonatomic,copy) NSString * coinName;
@property(nonatomic,copy) NSString * detaileName;
@property(nonatomic,copy) NSString * weightName;
@property(nonatomic,copy) NSString * soldName;

@property(nonatomic,) BOOL isBought;

@property(nonatomic,strong) NSArray * photolist;

+(NSArray*)addPhyModel:(NSArray*)array;
@end
