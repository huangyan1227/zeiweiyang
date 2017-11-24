//
//  NSString+Extension.m
//  ziweiyang
//
//  Created by bidiao on 2017/11/7.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)
- (NSString *)VerticalString{
    NSMutableString * str = [[NSMutableString alloc] initWithString:self];
    NSInteger count = str.length;
    for (int i = 1; i < count; i ++) {
        [str insertString:@"\n" atIndex:i*2 - 1];
    }
    return str;
}


@end
