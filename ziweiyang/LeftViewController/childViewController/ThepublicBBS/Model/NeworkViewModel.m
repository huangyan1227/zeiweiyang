//
//  NeworkViewModel.m
//  ziweiyang
//
//  Created by bidiao on 2017/11/14.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import "NeworkViewModel.h"
#import "AFNetworking.h"


static AFHTTPSessionManager * mgr = nil;
@implementation NeworkViewModel

+(AFHTTPSessionManager*)sharedAFMarger{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        mgr = [[AFHTTPSessionManager alloc]init];
        
    });
    return mgr;
    
    
    
    
    
}

+(id)POST:(NSString *)path parameters:(NSDictionary *)parametars completionHandler:(void (^)(id, NSError *))completo{
    
     NSString *str1 = [path stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    
    return [[self sharedAFMarger] POST:str1 parameters:parametars progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        completo(responseObject,nil);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        completo(nil,error);
        
    }];
    
    
    
    
}


@end
