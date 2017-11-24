//
//  ClassshopCollectionViewCell.h
//  ziweiyang
//
//  Created by bidiao on 2017/10/25.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ClassshopCollectionViewCell : UICollectionViewCell
@property(nonatomic,strong) NSString * imageString;
@property(nonatomic,strong) NSString * dateString;
@property(nonatomic,strong) NSString * booknameString;
@property(nonatomic,strong) NSString * statnameString;
@property(nonatomic,strong) NSString * urlImage;
@property(nonatomic) BOOL isShow;
@end
