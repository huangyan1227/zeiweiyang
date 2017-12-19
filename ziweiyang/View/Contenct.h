//
//  Contenct.h
//  ziweiyang
//
//  Created by bidiao on 2017/10/17.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#ifndef Contenct_h
#define Contenct_h
//主页
#import "ThehomePageViewController.h"
//每日财运
#import "DailyfinancesViewController.h"
//最新消息
#import "ThelatestnewsViewController.h"
//简介
#import "IntroductiontotheViewController.h"
//公司简介
#import "ThecompanyViewController.h"
//奇门简介
#import "SpecialViewController.h"
//紫薇命盘
#import "CrapemyrtleViewController.h"
//万年历
#import "CalendarViewController.h"
//教室
#import "TheclassroomViewController.h"
//商店
#import "ShopViewController.h"
//公众论坛
#import "PublicBBSViewController.h"
//课程提问
#import "ClasstoaskquestionsViewController.h"
//联络我们
#import "ContactViewController.h"
//条款及细则
#import "ThetermsViewController.h"
//隐私政策
#import "PrivacypolicyViewController.h"
//基本资料
#import "BasicinformationViewController.h"
//交易记录
#import "TransactionrecordsViewController.h"
//商店记录
#import "RecordstoreViewController.h"
//教室记录
#import "TheclassroomrecordViewController.h"
//实体纪录
#import "TheentityrecordViewController.h"
//论坛纪录
#import "BBSrecordViewController.h"
//提问纪录
#import "QuestionsrecordViewController.h"
//退出


#define HYRandomColor  [UIColor colorWithRed:(arc4random_uniform(256))/255.0 green:(arc4random_uniform(256))/255.0 blue:(arc4random_uniform(256))/255.0 alpha:1.0]

#define fontColor(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]


#define kNaHeight ([[UIApplication sharedApplication] statusBarFrame].size.height>20?20:0)
#define DefinmySelf __weak typeof(self) mySelf = self

#define urlpath [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]

#endif /* Contenct_h */
