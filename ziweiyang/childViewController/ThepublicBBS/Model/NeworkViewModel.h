//
//  NeworkViewModel.h
//  ziweiyang
//
//  Created by bidiao on 2017/11/14.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NeworkViewModel : NSObject
+(id)POST:(NSString*)path parameters:(NSDictionary*)parametars completionHandler:(void(^)(id responsObj,NSError*or))completo;
@end
