//
//  PhyModel.m
//  ziweiyang
//
//  Created by bidiao on 2017/11/22.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import "PhyModel.h"

@implementation PhyModel
+(NSArray*)addPhyModel:(NSDictionary*)dict{
    
    NSMutableArray * muarray = [NSMutableArray array];
    //
    //    NSArray * arr = responseObject[1];
    //
    //    NSDictionary * arr2 = arr[0];
    //
    //    // NSArray * arrr =arr[1];
    //
    //    NSDictionary * diat = arr2[@"name"];
    
    NSArray * array = dict[@"data_list"];
    
    for (int i=1; i<array.count; i++) {
        
        NSArray * arr = array[i];
        
        // for (int j=0; j<arr.count; j++) {
        
        PhyModel * mode = [PhyModel new];
        
        mode.titleName = arr[0][@"name"];
        
        mode.idName =  arr[0][@"name"];
        
        mode.bianName = arr[0][@"name2"];
        
        mode.coinName = arr[0][@"coin"];
        
        mode.detaileName = arr[0][@"detail"];
       // mode.date =arr[0][@"date"];
        mode.isBought = arr[0][@"false"];
        
        mode.weightName = arr[0][@"weight"];
        
       // mode.detail = arr[0][@"detail"];
        
        mode.photolist =arr[0][@"photo_list"];
        
        
        // }
        
        
        [muarray addObject:mode];
        
        
    }
    
    
    
    
    
    
    
    
    
    return [muarray copy];
}
@end
