//
//  BBSModel.h
//  ziweiyang
//
//  Created by bidiao on 2017/11/13.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BBSModel : NSObject
@property(nonatomic,copy) NSString * icoimageName;
@property(nonatomic,copy) NSString * name;
@property(nonatomic,copy) NSString * tianname;
@property(nonatomic,copy) NSString * dateName;
@property(nonatomic,copy) NSString * picName;
@property(nonatomic,copy) NSString * cantame;
@property(nonatomic,copy) NSString * detail;
//公共
@property(nonatomic,copy) NSString * total_page;
@property(nonatomic,copy) NSString * prev_page;
@property(nonatomic,copy) NSString * next_page;
//@property(nonatomic,copy) NSString * picName;

//hot
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
//引用
@property(nonatomic,copy) NSString * tagnameString;
@property(nonatomic,copy) NSString * tagcontString;
@property(nonatomic,copy) NSString * tagdateString;

//目前沒用
@property(nonatomic,copy) NSString *forumtitleString;
@property(nonatomic,copy) NSString *forumcontentString;
@property(nonatomic,copy) NSString *forumnameimageString;
@property(nonatomic,copy) NSString *forumnameString;
@property(nonatomic,copy) NSString *forumtaiyinString;
@property(nonatomic,copy) NSString *forumscore;
@property(nonatomic,copy) NSString *forumchakanlagString;
@property(nonatomic,copy) NSString *forumreplyString;
@property(nonatomic,copy) NSString *forumdateString;

@property(nonatomic,copy) NSString *forumcon_id;


+(NSArray*)addBBSomeModel:(NSArray*)array;
+(NSArray*)addBBChildSomeModel:(NSArray*)array imageString:(NSString*)imagestring tieimage:(NSString*)titamge model:(BBSModel*)oldmod;

//论坛纪录 我的问题
+(NSArray*)recordaddBBSomeModel:(NSArray*)array;
//我的回复
+(NSArray*)recordaddBBReplySomeModel:(NSArray*)array;
//建基
//cell.isConten = YES;
//cell.titleString = @"会员优惠";
//// cell.contentString = @"此貼是特別開放給 有關已購買閱讀之人";
//cell.nameimageString =@"fb";
//cell.nameString = @"毛毛";
//cell.taiyinString = @"太陰4 積分687";
//cell.chakanlagString = @"查看437 回復：27";
//cell.dateString = @"最後發表：10月17日 2017年05：39pm";
@end
