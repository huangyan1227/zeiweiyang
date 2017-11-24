//
//  BookModel.h
//  ziweiyang
//
//  Created by bidiao on 2017/11/15.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BookModel : NSObject

@property(nonatomic,copy) NSString * idbook;
@property(nonatomic,copy) NSString * imagebook;
@property(nonatomic,copy) NSString * namebook;
@property(nonatomic,copy) NSString * datebook;
@property(nonatomic,copy) NSString * detailbook;
@property(nonatomic) BOOL isbought;
+(NSArray*)addbookModel:(NSArray*)array;
@end
