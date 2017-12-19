//
//  Reg.h
//  ziweiyang
//
//  Created by bidiao on 2017/12/7.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Reg : NSObject
@property(nonatomic,copy) NSString * username;
@property(nonatomic,copy) NSString * password;
@property(nonatomic,copy) NSString * agsinpassword;
@property(nonatomic,copy) NSString * name;
@property(nonatomic,copy) NSString * contact_no;
@property(nonatomic,copy) NSString * gender;
@property(nonatomic,copy) NSString * birth;
@property(nonatomic,copy) NSString * birth_timeslot;
@property(nonatomic,copy) NSString * calendar_timezone;
@property(nonatomic,copy) NSString * address;
@property(nonatomic,copy) NSString * delivery_address;
@property(nonatomic,copy) NSString * referral;
@property(nonatomic,copy) NSString * token;

@property(nonatomic,copy) NSString * dateName;
@property(nonatomic,copy) NSString * iddate;
//每日财运
@property(nonatomic,copy) NSString * dailyName;
@property(nonatomic,copy) NSString * valuedaily;
+(NSArray*)addBrithzone;

+(NSArray*)dateArray;

+(NSArray*)iddateArray;

//每日财运
+(NSArray*)dailyLuckArray;

+(NSArray*)valueArray;
@end
