//
//  HomeModel.m
//  ziweiyang
//
//  Created by bidiao on 2017/11/6.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import "HomeModel.h"

@implementation HomeModel
+(NSArray*)addHomeModel:(NSArray*)array{
    
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
        
            HomeModel * mode = [HomeModel new];
            
        mode.name = arr[0][@"name"];
        
        mode.date =arr[0][@"date"];
        
        mode.detail = arr[0][@"detail"];
        
        mode.photourl =arr[0][@"photo_list_in_list"][0];
            
            
       // }
      
        
        [muarray addObject:mode];
        
        
    }
   
    
    
    
    
    
    
    
    
    return [muarray copy];
}
@end
