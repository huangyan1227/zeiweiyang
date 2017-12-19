//
//  CoursecontentViewController.h
//  ziweiyang
//
//  Created by bidiao on 2017/10/31.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BookModel.h"
#import "CoursecontTableViewCell.h"
#import "CoursecontModel.h"
@interface CoursecontentViewController : UIViewController
@property(nonatomic,strong) BookModel * bookmodel;
@property(nonatomic,strong) NSString * api_bookcourse;
@property(nonatomic,strong) NSString * idmycoursBook;
@end
