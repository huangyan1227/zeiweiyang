//
//  BookModel.m
//  ziweiyang
//
//  Created by bidiao on 2017/11/15.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import "BookModel.h"

@implementation BookModel
+(NSArray*)addbookModel:(NSArray*)array{
    
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
        
       BookModel * mode = [BookModel new];
        
        mode.idbook = arr[0][@"id"];
        
        mode.namebook = arr[0][@"name"];
        
        mode.datebook =arr[0][@"date"];
        
        mode.detailbook = arr[0][@"detail"];
        
        mode.imagebook =arr[0][@"photo_list"][0];
        
        NSString *aa = [NSString stringWithFormat:@"%@",arr[0][@"bought"]];
        BOOL isbool = [aa isEqualToString:@"0"]?NO:YES;
        mode.isbought = isbool;
        
      
        
        [muarray addObject:mode];
        
        
    }
    
    
    
    
    
    
    
    
    
    return [muarray copy];
}
@end
