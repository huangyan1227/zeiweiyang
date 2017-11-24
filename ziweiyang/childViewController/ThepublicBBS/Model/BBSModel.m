//
//  BBSModel.m
//  ziweiyang
//
//  Created by bidiao on 2017/11/13.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import "BBSModel.h"

@implementation BBSModel
+(NSArray*)addBBSomeModel:(NSArray*)array{
    
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
        
     
        BBSModel * mode = [BBSModel new];
        
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

+(NSArray*)addBBChildSomeModel:(NSArray*)array imageString:(NSString *)imagestring tieimage:(NSString*)titamge model:(BBSModel*)oldmod{
    
    NSMutableArray * muarray = [NSMutableArray array];
    //
    
    
    for (int i=1; i<array.count; i++) {
        
        NSArray * arr = array[i];
        
        // for (int j=0; j<arr.count; j++) {
        
        if (i==1) {
            
            BBSModel * mode = [BBSModel new];
            
//            mode.forumconid =arr[0][@"forum_id"];
//
//            mode.forumtitleString =arr[0][@"forum_name"];
//
//            mode.forumcontentString = arr[0][@"forum_detail"];
//
//            mode.forumnameimageString = arr[0][@"create_by_member_img"];
//
//            mode.forumnameString =  arr[0][@"forum_create_by_member_name"];
//
//            mode.forumtaiyinString =  arr[0][@"forum_create_by_member_member_category"];
//
//            mode.forumscore = arr[0][@"forum_create_by_member_score"];
//
//            mode.forumchakanlagString = arr[0][@"forum_count_view"];
//
//            mode.forumreplyString =arr[0][@"forum_count_reply"];
//
//            mode.forumdateString =arr[0][@"forum_date"];
            
            mode.conid =arr[0][@"forum_id"];
            
            mode.titleString =arr[0][@"forum_name"];
            
            mode.contentString = arr[0][@"forum_detail"];
            
            mode.nameimageString = imagestring;
            
            mode.nameString =  arr[0][@"forum_create_by_member_name"];
            
            mode.taiyinString =  arr[0][@"forum_create_by_member_member_category"];
            
            mode.score = arr[0][@"forum_create_by_member_score"];
            
            mode.chakanlagString = arr[0][@"forum_count_view"];
            
            mode.replyString =arr[0][@"forum_count_reply"];
            
           // mode.dateString =arr[0][@"forum_date"];
            
            mode.tieimage = titamge;
            
            mode.contimageString = arr[0][@"forum_photo_list"][0];
            
            //需要转换的字符串
            NSString *dateString =arr[0][@"forum_date"];;
            //设置转换格式
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
            [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
            //NSString转NSDate
            NSDate *date=[formatter dateFromString:dateString];
            
            NSDateFormatter *format = [[NSDateFormatter alloc] init];
            
            // 设置日期格式 为了转换成功
            
            format.dateFormat = @"MM月dd日yyyy年HH:mm";
            
            NSString *dateold =[format stringFromDate:date];
           
            
            if (dateold.length ==0) {
                
                mode.dateString = oldmod.dateString;
            }else{
                
                mode.dateString  = dateold;
            }
            
           [muarray addObject:mode];
            
        }
        
       BBSModel * mode = [BBSModel new];
        
        mode.conid = arr[0][@"id"];
        
        mode.titleString = arr[0][@"name"];
        
        mode.contentString =arr[0][@"detail"];
        
        mode.nameimageString = arr[0][@"create_by_member_img"];
        
        mode.nameString =arr[0][@"create_by_member_name"];
        
        mode.taiyinString =arr[0][@"create_by_member_member_category"];
        
        mode.score = arr[0][@"create_by_member_score"];
        
        mode.chakanlagString = arr[0][@"count_view"];
        
        //.mode.dateString = arr[0][@"date"];
        
        mode.replyString = arr[0][@"count_reply"];
        // }
        
         mode.tieimage = @"";
        mode.tagdateString = arr[0][@"tag_forum_reply_date"];
       
        mode.tagnameString = arr[0][@"tag_forum_reply_member_name"];
        
        mode.tagcontString =  arr[0][@"tag_forum_reply_detail"];
        NSArray * arra =arr[0][@"photo_list"];
        if (arra.count==0) {
            
        }else{
        mode.contimageString = arr[0][@"photo_list"][0];
        }
        //需要转换的字符串
        NSString *dateString =arr[0][@"date"];
        //设置转换格式
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
        [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        //NSString转NSDate
        NSDate *date=[formatter dateFromString:dateString];
        
        NSDateFormatter *format = [[NSDateFormatter alloc] init];
        
        // 设置日期格式 为了转换成功
        
        format.dateFormat = @"MM月dd日yyyy年HH:mm";
        
        NSString * dateold  = [format stringFromDate:date];
        
        
        if (dateold.length ==0) {
            
            mode.dateString = oldmod.dateString;
        }else{
            
            mode.dateString  = dateold;
        }
        [muarray addObject:mode];
        
        
    }
    
    
    
    
    
    
    
    
    
    return [muarray copy];
}
@end
