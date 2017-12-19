//
//  CoursecontModel.m
//  ziweiyang
//
//  Created by bidiao on 2017/11/28.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import "CoursecontModel.h"

@implementation CoursecontModel
+(NSArray*)addModel:(NSArray *)resportion{
    
    
    NSMutableArray * array = [NSMutableArray array];
    
   // CoursecontModel * coursecont = [CoursecontModel new];
    
    if (resportion.count<2) {
     
        return array;
    }else{
    
    for (int i =1; i<resportion.count; i++) {
        
         CoursecontModel * coursecont = [CoursecontModel new];
        
     //   if (i==0) {
            
            coursecont.total_page = resportion[0][0][@"total_page"];
          //
            coursecont.prev_page = resportion[0][0][@"prev_page"];
         // /
            coursecont.next_page  = resportion[0][0][@"next_page"];
      //  }else{
            
            
            NSString * deati =  resportion[i][0][@"detail"];
            
          //  if (deati.length <1) {
                
          //  }else{
                
        coursecont.detail = deati;
                
        coursecont.page_section = resportion[i][0][@"page_section"];
               
        coursecont.page_section2 = resportion[i][0][@"page_section2"];
         //   }
            
       // }
        
        [array addObject:coursecont];
        
    }
        return array;
    }
    
}
@end
