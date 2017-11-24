//
//  Question.m
//  ziweiyang
//
//  Created by bidiao on 2017/11/20.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import "Question.h"

@implementation Question
+(NSArray*)addQuestionModel:(NSArray*)array{
    
    NSMutableArray * muarray = [NSMutableArray array];
    //
    //    NSArray * arr = responseObject[1];
    //
    //    NSDictionary * arr2 = arr[0];
    //
    //    // NSArray * arrr =arr[1];
    //
    //    NSDictionary * diat = arr2[@"name"];
    
    
    for (int i=1; i<array.count; i++) {
        
        NSArray * arr = array[i];
        
        // for (int j=0; j<arr.count; j++) {
        
        
        Question * mode = [Question new];
        
         mode.conid = arr[0][@"id"];
        
        mode.titleString = arr[0][@"name"];
        
      //  mode.contentString =arr[0][@"detail"];
        
        mode.nameimageString = arr[0][@"create_by_member_img"];
        
        mode.nameString =arr[0][@"create_by_member_name"];
        
      //  mode.taiyinString =arr[0][@"create_by_member_member_category"];
        
     //   mode.score = arr[0][@"create_by_member_score"];
        
        mode.chakanlagString = arr[0][@"count_reply"];
        
        mode.dateString = arr[0][@"date"];
        
       // mode.replyString = arr[0][@"count_reply"];
        // }
        
        
        [muarray addObject:mode];
        
        
    }
    
    
    
    
    
    
    
    
    
    return [muarray copy];
}
@end
