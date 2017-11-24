//
//  Question.h
//  ziweiyang
//
//  Created by bidiao on 2017/11/20.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Question : NSObject
@property(nonatomic,copy) NSString * titleString;
//@property(nonatomic,strong) NSString * contentString;
@property(nonatomic,copy) NSString * nameimageString;
@property(nonatomic,copy) NSString * nameString;
//@property(nonatomic,strong) NSString * taiyinString;
@property(nonatomic,copy) NSString * chakanlagString;
@property(nonatomic,copy) NSString * dateString;
@property(nonatomic,copy) NSString * conid;
+(NSArray*)addQuestionModel:(NSArray*)array;
@end
