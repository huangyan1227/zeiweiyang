//
//  RightModel.h
//  ziweiyang
//
//  Created by bidiao on 2017/11/20.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RightModel : NSObject
//基本资料
@property(nonatomic,copy) NSString * zhangdao;
@property(nonatomic,copy) NSString * dianshu;
@property(nonatomic,copy) NSString * jiaoyi;
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
@end
