//
//  RightModel.h
//  ziweiyang
//
//  Created by bidiao on 2017/11/20.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RightModel : NSObject

//公共
@property(nonatomic,copy) NSString * total_page;
@property(nonatomic,copy) NSString * prev_page;
@property(nonatomic,copy) NSString * next_page;
//基本资料
@property(nonatomic,copy) NSString * code;
@property(nonatomic,copy) NSString * detail;
@property(nonatomic,copy) NSString * coin;
@property(nonatomic,copy) NSString * date;


//公共
@property(nonatomic,copy) NSString * namelabel1;
@property(nonatomic,copy) NSString * namelabel2;
@property(nonatomic,copy) NSString * namelabel3;
@property(nonatomic,copy) NSString * namelabel4;
@property(nonatomic,copy) NSString * namelabel5;
//教室值
@property(nonatomic) BOOL  isColor;
@property(nonatomic,copy) NSString * namelabeltext1;
@property(nonatomic,copy) NSString * namelabeltext2;
@property(nonatomic,copy) NSString * namelabeltext3;
@property(nonatomic,copy) NSString * namelabeltext4;
@property(nonatomic,copy) NSString * namelabeltext5;
@property(nonatomic,copy) NSString * course_id;
@property(nonatomic,copy) NSString * uploaddate;
//课程
@property(nonatomic,copy) NSString * bookName;
@property(nonatomic,copy) NSString * bookuploaddate;
@property(nonatomic,copy) NSString * bookdetail;
@property(nonatomic,copy) NSString * bookimagurl;
//商店
@property(nonatomic,copy) NSString * storebookName;
@property(nonatomic,copy) NSString * storedate;
@property(nonatomic,copy) NSString * storebookid;
@property(nonatomic,copy) NSString * storeimageurl;
@property(nonatomic,copy) NSString * storedetail;
//实体记录
@property(nonatomic,copy) NSString * entitytransaction_id;
@property(nonatomic,copy) NSString * entitycreate_date;
@property(nonatomic,copy) NSString * entityproduct_id;
@property(nonatomic,copy) NSString * entityproduct_code;
@property(nonatomic,copy) NSString * entityproduct_name;
@property(nonatomic,copy) NSString * entityqty;
@property(nonatomic,copy) NSString * entitycoin;

//话题
//標題
@property(nonatomic,copy) NSString *titleString;
//內容
@property(nonatomic,copy) NSString *contentString;
//名字圖片
@property(nonatomic,copy) NSString *nameimageString;
//名字
@property(nonatomic,copy) NSString *nameString;
//太陰
@property(nonatomic,copy) NSString *taiyinString;
//分數
@property(nonatomic,copy) NSString *score;
//查看回復
@property(nonatomic,copy) NSString *chakanlagString;
@property(nonatomic,copy) NSString *replyString;
//日期
@property(nonatomic,copy) NSString *dateString;
//id
@property(nonatomic,copy) NSString * conid;
//內容圖片
@property(nonatomic,copy) NSString * contimageString;
//本地图片
@property(nonatomic,copy) NSString * tieimage;
//论坛纪录 我的问题
+(NSArray*)recordaddBBSomeModel:(NSArray*)array;
//我的回复
+(NSArray*)recordaddBBReplySomeModel:(NSArray*)array;

+(NSArray*)transactionrecModel:(NSArray*)respoint;

+(NSArray*)classroomModel:(NSArray*)respoint;
//课程资料
+(NSArray*)classroomdataModel:(NSArray*)respoint;
//商店
+(NSArray*)addrightMybookModel:(NSArray*)array;
//实体记录
+(NSArray*)addEntityModel:(NSArray*)respoint;
//基本资料
+(NSArray*)addBaseModel:(NSArray*)respoint;
@end
