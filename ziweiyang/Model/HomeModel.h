//
//  HomeModel.h
//  ziweiyang
//
//  Created by bidiao on 2017/11/6.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeModel : NSObject
@property(nonatomic,copy) NSString * name;

@property(nonatomic,copy) NSString * date;

@property(nonatomic,strong) NSString * detail;

@property(nonatomic,copy) NSString * photourl;


+(NSArray*)addHomeModel:(NSArray*)array;
@end
