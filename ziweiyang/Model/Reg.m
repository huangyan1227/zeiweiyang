//
//  Reg.m
//  ziweiyang
//
//  Created by bidiao on 2017/12/7.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import "Reg.h"

@implementation Reg
+(NSArray*)addBrithzone{
    
    NSMutableArray * array = [NSMutableArray array];
    
    NSString *strPath = [[NSBundle mainBundle] pathForResource:@"jeson" ofType:nil];
    NSString *parseJason = [[NSString alloc] initWithContentsOfFile:strPath encoding:NSUTF8StringEncoding error:nil];
    
 //  NSArray  *arrayd = [parseJason componentsSeparatedByString:@","];//分隔符逗号
    
    NSString * stringdd = [NSString stringWithString:parseJason];
    
     NSData *resData = [[NSData alloc] initWithData:[stringdd dataUsingEncoding:NSUTF8StringEncoding]];
  
    NSArray * arraya =   [NSJSONSerialization JSONObjectWithData:resData options:NSJSONReadingMutableLeaves error:nil];
    
    for (int i =0; i<arraya.count; i++) {
        
        NSString *det = arraya[i][0][@"name"];
        
        
        
        
        [array addObject:det];
        
        
        
    }
    
    
    
    
    
    return array;
}
+(NSArray*)dateArray{
    
    
    NSMutableArray * array = [NSMutableArray array];
    
    NSString *strPath = [[NSBundle mainBundle] pathForResource:@"datetime" ofType:@"plist"];
   
    
    NSArray * arraya = [NSArray arrayWithContentsOfFile:strPath];
    
    for (int i =0; i<arraya.count; i++) {
        
        NSString *det = arraya[i][@"name"];
        
        
        NSString * ida = arraya[i][@"id"];
        
        
        [array addObject:det];
        
        
        
    }
    
    
    
    
    
    return array;
    
    
    
    
    
    
    
    
    
}

+(NSArray*)iddateArray{
    
    
    NSMutableArray * array = [NSMutableArray array];
    
    NSString *strPath = [[NSBundle mainBundle] pathForResource:@"datetime" ofType:@"plist"];
    
    
    NSArray * arraya = [NSArray arrayWithContentsOfFile:strPath];
    
    for (int i =0; i<arraya.count; i++) {
        
        
        Reg * reg =[ Reg new];
        
        NSString *det = arraya[i][@"name"];
        
        
        NSString * ida = arraya[i][@"id"];
        
        reg.dateName = det;
        
        reg.iddate = ida;
        
        [array addObject:reg];
        
        
        
    }
    
    
    
    
    
    return array;
    
   
    
}
+(NSArray*)dailyLuckArray{
    
    
    
    NSMutableArray * array = [NSMutableArray array];
    NSString *strPath = [[NSBundle mainBundle] pathForResource:@"date" ofType:nil];
    NSString *parseJason = [[NSString alloc] initWithContentsOfFile:strPath encoding:NSUTF8StringEncoding error:nil];
    
    NSString * stringdd = [NSString stringWithString:parseJason];
    
    NSData *resData = [[NSData alloc] initWithData:[stringdd dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSArray * arraya =   [NSJSONSerialization JSONObjectWithData:resData options:NSJSONReadingMutableLeaves error:nil];
    for (int i =0; i<arraya.count; i++) {
        
        
        
        
        
        NSString *det = arraya[i][0][@"name"];
        
        
      //  NSString * ida = arraya[i][@"value"];
        
        
        [array addObject:det];
        
        
        
        
        
    }
    //NSLog(@" %@f",array);
    
    return array;
    
    
    
    
    
}
+(NSArray*)valueArray{
    
    
    
    
    NSMutableArray * array = [NSMutableArray array];
    NSString *strPath = [[NSBundle mainBundle] pathForResource:@"date" ofType:nil];
    NSString *parseJason = [[NSString alloc] initWithContentsOfFile:strPath encoding:NSUTF8StringEncoding error:nil];
    
    NSString * stringdd = [NSString stringWithString:parseJason];
    
    NSData *resData = [[NSData alloc] initWithData:[stringdd dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSArray * arraya =   [NSJSONSerialization JSONObjectWithData:resData options:NSJSONReadingMutableLeaves error:nil];
    for (int i =0; i<arraya.count; i++) {
        
        
        Reg * reg =[ Reg new];
        
        reg.dailyName = arraya[i][0][@"name"];
        
        reg.valuedaily = arraya[i][0][@"value"];
        //  NSString * ida = arraya[i][@"value"];
        
        
        [array addObject:reg];
        
        
        
        
        
    }
    //NSLog(@" %@f",array);
    
    return array;
    
    
    
    
    
    
    
    
    
}
@end
