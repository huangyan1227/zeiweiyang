//
//  RecordstoreViewController.m
//  ziweiyang
//
//  Created by bidiao on 2017/11/15.
//  Copyright © 2017年 bidiao. All rights reserved.
//商店记录

#import "RecordstoreViewController.h"
#import "ClassshopCollectionViewCell.h"
#import "RecoChildeViewController.h"
@interface RecordstoreViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong) UICollectionView * collectionView;
@end

@implementation RecordstoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addView];
}
-(void)addView{
    
    UICollectionViewFlowLayout * flowlayout = [[UICollectionViewFlowLayout alloc]init];
    
    flowlayout.itemSize = CGSizeMake((self.view.width-150)/2, (self.view.height-100)/4);
    
    
    flowlayout.sectionInset =UIEdgeInsetsMake(40, 50, 20, 50);
    
    flowlayout.minimumLineSpacing = 60;
    
    self.collectionView = [[UICollectionView alloc]initWithFrame:self.view.frame collectionViewLayout:flowlayout
                           ];
    
    self.collectionView.delegate = self;
    
    self.collectionView.dataSource = self;
    
    [self.view addSubview:self.collectionView];
    
    [self.collectionView registerClass:[ClassshopCollectionViewCell class] forCellWithReuseIdentifier:@"MyCell"];
    self.collectionView.backgroundColor = [UIColor clearColor];
    
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 19;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString * ID = @"MyCell";
    ClassshopCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    if (!cell) {
        cell = [[ ClassshopCollectionViewCell alloc]init];
    }
  //
    cell.backgroundColor =[UIColor yellowColor];
  //  cell.booknameString = bookmodel.namebook;
    
   // cell.urlImage = [AppNetWork_Post stringByAppendingString:bookmodel.imagebook];
    //cell.dateString = bookmodel.datebook;
   // if (bookmodel.isbought) {
        cell.statnameString = @"purchasedBadge";
   // }else{
        
      //  cell.statnameString = @"newItem";
 //   }
    return cell;

    
    
    
    
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    RecoChildeViewController * sho =[RecoChildeViewController new];
    
    sho.title = @"书刊资料";
    //sho.model = self.mutableArrat[indexPath.row];
    [self.navigationController pushViewController:sho animated:YES];
    
    
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
