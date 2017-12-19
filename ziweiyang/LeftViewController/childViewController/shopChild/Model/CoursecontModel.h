//
//  CoursecontModel.h
//  ziweiyang
//
//  Created by bidiao on 2017/11/28.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CoursecontModel : NSObject

@property(nonatomic,copy ) NSString * total_page;

@property(nonatomic,copy) NSString * prev_page;

@property(nonatomic,copy) NSString * next_page;

@property(nonatomic,copy) NSString * page_section;

@property(nonatomic,copy) NSString * page_section2;

@property(nonatomic,copy) NSString * detail;

+(NSArray*)addModel:(NSArray*)resportion;

@end
