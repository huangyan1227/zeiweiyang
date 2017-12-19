//
//  AppNetwork.m
//  ziweiyang
//
//  Created by bidiao on 2017/11/24.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import "AppNetwork.h"

@implementation AppNetwork


NSString* const AppInfo_APP_LOG = @"http://makeitmobile.com.hk/MRTTree/index.php/Tree/Common/getLogin";
//NSString* const AppInfo_APP_LOG = @"http://192.168.2.12/MRTTree/index.php/Tree/Common/getLogin";

//http://192.168.2.12/TreeMap/index.php/Tree/Common/getLogin
// comment these before a release build is made
//NSString* const AppInfo_PRODUCTION_SERVER_DOMAIN = @"192.168.28.189";           //DEBUG DOMAIN(Terence's PC)

//NSString* const AppInfo_USER_MAI = @"http://makeitmobile.com.hk/gm/index.php/Home/User/actlogin";
NSString* const AppNetWork_Post = @"https://www.ziweiyang.com/";


// remove comment before a release build is made.
NSString*  AppInfo_PRODUCTION_SERVER_DOMAIN = @"makeitmobile.com.hk";       // PRODUCTION DOMAIN

NSString* const AppInfo_USER_COOKIE =@"http://192.168.2.12/TreeMap/index.php";

const NSString *Appapi_get_coursebook_detail =@"api_get_coursebook_detail.php";
 const NSString * AppToken_USER_COOKIE = nil;
 const NSString * AppUserName_USER = nil;
 const NSString * AppPassword_PASSWORD = nil;

  BOOL  AppLog_State =false;

const NSInteger RecordPerpage = 8;


@end
