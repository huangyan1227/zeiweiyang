//
//  AppNetwork.h
//  ziweiyang
//
//  Created by bidiao on 2017/11/24.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppNetwork : NSObject
extern NSString* const AppInfo_APP_LOG;                    //登录路径
extern NSString* const AppNetWork_Post;                    // 主路径
extern NSString* AppInfo_PRODUCTION_SERVER_DOMAIN;    // production server
extern NSString* const AppInfo_USER_COOKIE;
extern const NSString *AppToken_USER_COOKIE;
extern const NSString *AppUserName_USER;
extern const NSString *AppPassword_PASSWORD;
extern const NSString *Appapi_get_coursebook_detail;

extern const NSInteger RecordPerpage;
extern  BOOL   AppLog_State;


@end
