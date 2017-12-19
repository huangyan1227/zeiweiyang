//
//  RightModel.m
//  ziweiyang
//
//  Created by bidiao on 2017/11/20.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import "RightModel.h"

@implementation RightModel
+(NSArray*)transactionrecModel:(NSArray *)respoint{
    
    NSMutableArray * mutable = [NSMutableArray array];
    
    
    for (int i=1;i<respoint.count;i++) {
        
        
        
        
        
        RightModel * model = [RightModel new];
        
        model.total_page = respoint[0][0][@"total_page"];
        
        model.prev_page  = respoint[0][0][@"prev_page"];
       
        model.next_page  = respoint[0][0][@"next_page"];
        
        model.date = respoint[i][0][@"date"];
       
        model.detail = respoint[i][0][@"detail"];
       
        model.code = respoint[i][0][@"code"];
       
        model.coin = respoint[i][0][@"coin"];
        
        [mutable addObject:model];
        
        
    }
    
    
    
    return mutable;
    
    
}
+(NSArray*)classroomModel:(NSArray *)respoint{
    
    NSMutableArray * mutable = [NSMutableArray array];
    
    
    for (int i = 1; i<respoint.count; i++) {
        
        
        RightModel * model = [RightModel new];
        
        
        model.namelabel1 = @"課程名稱:";
        model.namelabel2 = @"課程章節:";
        model.namelabel3 = @"購買日期:";
        model.namelabel4 = @"已付點數:";
        model.namelabel5 = @"課程種類:";
        
        model.total_page = respoint[0][0][@"total_page"];
        
        model.prev_page  = respoint[0][0][@"prev_page"];
        
        model.next_page  = respoint[0][0][@"next_page"];
        
        model.namelabeltext3 = respoint[i][0][@"buy_date"];
        
        model.namelabeltext4 = respoint[i][0][@"used_coin"];
        
        model.namelabeltext1 = respoint[i][0][@"name"];
        
        model.namelabeltext2 = respoint[i][0][@"name2"];
        
        model.course_id  = respoint[i][0][@"course_id"];
        
        model.uploaddate = respoint[i][0][@"date"];
        
        model.namelabeltext5 = @"課程書籍";
        
        [mutable addObject:model];
        
        
    }
    
    return mutable;
    
}
+(NSArray*)classroomdataModel:(NSArray *)respoint{
    
    NSMutableArray * array = [NSMutableArray array];
    
    for (int i=1; i<respoint.count; i++) {
        
        RightModel * right = [RightModel new];
        
        right.bookName = respoint[i][0][@"name"];
        
        right.bookdetail = respoint[i][0][@"detail"];
        
        right.bookuploaddate = respoint[i][0][@"date"];
        
        right.bookimagurl = respoint[i][0][@"thumb_list"][0];
        
  
        [array addObject:right];
        
    }
    
    
    
    return array;
    
}

+(NSArray*)addrightMybookModel:(NSArray*)array{
    
    NSMutableArray * muarray = [NSMutableArray array];
  
    for (int i=1; i<array.count; i++) {
        
        NSArray * arr = array[i];
        
        // for (int j=0; j<arr.count; j++) {
        
        RightModel * mode = [RightModel new];
        
        mode.total_page = array[0][0][@"tatal_page"];
        
        mode.next_page = array[0][0][@"next_page"];
        
        mode.storebookid = arr[0][@"id"];
        
        mode.storebookName = arr[0][@"name"];
        
        mode.storedate = arr[0][@"date"];
        
        mode.storedetail = arr[0][@"detail"];
        
       // mode.detailbook = arr[0][@"detail"];
        
        mode.storeimageurl =arr[0][@"thumb_list"][0];
        
       
        
        
        [muarray addObject:mode];
        
        
    }
    
    
    
    
    
    
    
    
    
    return [muarray copy];
}


+(NSArray*)addEntityModel:(NSArray *)respoint{
    
    
    NSMutableArray * array = [NSMutableArray array];
    
    
    for (int i =1; i<respoint.count; i++) {
        
        RightModel * model = [RightModel new];
        
        
        model.namelabel1 = @"购买日期:";
       
        model.namelabel2 = @"产品编号:";
       
        model.namelabel3 = @"产品名称:";
       
        model.namelabel4 = @"数量:";
        
        model.namelabel5 = @"点数:";
        
        model.total_page = respoint[0][0][@"total_page"];
        
        model.prev_page = respoint[0][0][@"prev_page"];
        
        model.next_page = respoint[0][0][@"next_page"];
        
        
        model.entitytransaction_id = respoint[i][0][@"transaction_id"];
        
        model.entitycreate_date = respoint[i][0][@"create_date"];
        
        model.entityproduct_code = respoint[i][0][@"product_code"];
        
        model.entityproduct_id = respoint[i][0][@"product_id"];
        
        model.entityproduct_name = respoint[i][0][@"product_name"];
        
        model.entityqty = respoint[i][0][@"qty"];
        
        model.entitycoin = [NSString stringWithFormat:@"%@",respoint[i][0][@"coin"]];
        
        NSLog(@"----%@",model.entitycoin);
        
        [array addObject:model];
    }
    
    return array;
}
+(NSArray*)addBaseModel:(NSArray *)respoint{
    
    
    NSMutableArray * mutableArray = [NSMutableArray array];
    
    
    [mutableArray addObject: respoint[0][0][@"thumb_list"][0]];
    
    [mutableArray addObject: respoint[0][0][@"name"]];
    
    [mutableArray addObject: respoint[0][0][@"gender"]];
    
    [mutableArray addObject: respoint[0][0][@"contact_no"]];
    
    [mutableArray addObject: respoint[0][0][@"address"]];
   
    [mutableArray addObject:  [NSString stringWithFormat:@" %@ %@", respoint[0][0][@"birth"],respoint[0][0][@"birth_country"]]];
    
    if (respoint[0][0][@"referral"] ==[NSNull null]) {
         [mutableArray addObject: @""];
    }else{
    [mutableArray addObject: respoint[0][0][@"referral"]];
    
    }
    [mutableArray addObject: respoint[0][0][@"coin"]];
    
    [mutableArray addObject: respoint[0][0][@"expiry_date"]];

    [mutableArray addObject: respoint[0][0][@"username"]];
    
    [mutableArray addObject: respoint[0][0][@"calendar_timezone"]];
    
    //年龄
    NSString * dateString = respoint[0][0][@"birth"];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateFormat:@"yyyy-MM-dd"];
    //NSString转NSDate
    NSDate *date=[formatter dateFromString:dateString];
    
    //装换
    NSDate * newdate = [NSDate date];
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    
    // 设置日期格式 为了转换成功
   // format.locale=[[NSLocale alloc]initWithLocaleIdentifier:@"en_US"];
    // [dateFormatter setDateFormat:@"h:mm:ss a"];
    format.dateFormat = @"yyyy";
    
    NSString *newString = [format stringFromDate:newdate];
    
    NSString *oldString = [format stringFromDate:date];
  
    NSString * old =[NSString stringWithFormat:@"%d",[newString intValue] - [oldString intValue]];
    
    [mutableArray addObject: old];
   
    [mutableArray addObject: respoint[0][0][@"bought_book"]];

    [mutableArray addObject: respoint[0][0][@"bought_course"]];
    
    [mutableArray addObject: respoint[0][0][@"bought_product"]];
    
    [mutableArray addObject: respoint[0][0][@"delivery_address"]];
    
   // [mutableArray addObject: respoint[0][0][@"bought_product"]];
    
    [mutableArray addObject:  respoint[0][0][@"birth"]];
    
    [mutableArray addObject:respoint[0][0][@"birth_country"]];
    
    
    
    
    return mutableArray;
    
}

+(NSArray*)recordaddBBSomeModel:(NSArray*)array{
    
    NSMutableArray * muarray = [NSMutableArray array];
    //
    //    NSArray * arr = responseObject[1];
    //
    //    NSDictionary * arr2 = arr[0];
    //
    //    // NSArray * arrr =arr[1];
    //
    //    NSDictionary * diat = arr2[@"name"];
    
    
    for (int i=1; i<array.count; i++) {
        
        NSArray * arr = array[i];
        
        // for (int j=0; j<arr.count; j++) {
        
        
        RightModel * mode = [RightModel new];
        
        mode.conid = arr[0][@"id"];
        
        mode.titleString = arr[0][@"name"];
        
        mode.contentString =arr[0][@"detail"];
        
        mode.nameimageString = arr[0][@"create_by_member_img"];
        
        mode.nameString =arr[0][@"create_by_member_name"];
        
        mode.taiyinString =arr[0][@"create_by_member_member_category"];
        
        mode.score = arr[0][@"create_by_member_score"];
        
        mode.chakanlagString = arr[0][@"count_view"];
        
        
        mode.replyString = arr[0][@"count_reply"];
        // }
        
        mode.tieimage = arr[0][@"photo_list"][0];
        
        //需要转换的字符串
        NSString *dateString =arr[0][@"last_update_date"];
        //设置转换格式
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
        [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        //NSString转NSDate
        NSDate *date=[formatter dateFromString:dateString];
        
        NSDateFormatter *format = [[NSDateFormatter alloc] init];
        
        // 设置日期格式 为了转换成功
        
        format.dateFormat = @"MM月dd日yyyy年HH:mm";
        
        mode.dateString  = [format stringFromDate:date];
        
        [muarray addObject:mode];
        
        
    }
    
    
    
    
    
    
    
    
    
    return [muarray copy];
}

+(NSArray*)recordaddBBReplySomeModel:(NSArray*)array{
    
    NSMutableArray * muarray = [NSMutableArray array];
    //
    //    NSArray * arr = responseObject[1];
    //
    //    NSDictionary * arr2 = arr[0];
    //
    //    // NSArray * arrr =arr[1];
    //
    //    NSDictionary * diat = arr2[@"name"];
    
    
    for (int i=1; i<array.count; i++) {
        
        NSArray * arr = array[i];
        
        // for (int j=0; j<arr.count; j++) {
        
        
        RightModel * mode = [RightModel new];
        
        mode.conid = arr[0][@"id"];
        
        mode.titleString = arr[0][@"name"];
        
        mode.contentString =arr[0][@"detail"];
        
        mode.nameimageString = arr[0][@"create_by_member_img"];
        
        mode.nameString =arr[0][@"create_by_member_name"];
        
        mode.taiyinString =arr[0][@"create_by_member_member_category"];
        
        mode.score = arr[0][@"create_by_member_score"];
        
        mode.chakanlagString = arr[0][@"count_view"];
        
        
        mode.replyString = arr[0][@"count_reply"];
        // }
        
        mode.tieimage = arr[0][@"photo_list"][0];
        
        //需要转换的字符串
        NSString *dateString =arr[0][@"date"];
        //设置转换格式
//        NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
//        [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
//        //NSString转NSDate
//        NSDate *date=[formatter dateFromString:dateString];
//
//        NSDateFormatter *format = [[NSDateFormatter alloc] init];
//
//        // 设置日期格式 为了转换成功
//
       //format.dateFormat = dateString;
//
        mode.dateString  = dateString;
        
        [muarray addObject:mode];
        
        
    }
    
    
    
    
    
    
    
    
    
    return [muarray copy];
}
@end
