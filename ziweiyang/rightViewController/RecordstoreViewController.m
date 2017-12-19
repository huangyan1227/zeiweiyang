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
#import "RightModel.h"

@interface RecordstoreViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong) UICollectionView * collectionView;
@property(nonatomic,strong) NSMutableArray * mutableArray;
@property(nonatomic,assign) int page;
@property(nonatomic) BOOL  isfrist;
@end

@implementation RecordstoreViewController

-(NSMutableArray *)mutableArray {
    if (!_mutableArray) {
        
        _mutableArray = [NSMutableArray array];
    }
    
    return _mutableArray;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.page =1;
    // Do any additional setup after loading the view.
    [self addView];
   // [self addNework];
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
-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
   
        if (self.isfrist) {
            self.isfrist = NO;
            [self addNework];
        }
        
        
    
}
-(void)addNework{
    
    NSString * string = [NSString stringWithFormat:@"%@api_get_history_ebook.php?recordperpage=4&page=%d&sortby=date&token=%@&active=&username=%@",AppNetWork_Post,self.page,AppToken_USER_COOKIE,AppUserName_USER];
    
    
    DefinmySelf;
    [NeworkViewModel POST:string parameters:nil completionHandler:^(id responsObj, NSError *or) {
        
        NSArray * modearry = [RightModel addrightMybookModel:responsObj];
        
        if (modearry.count ==0) {

            mySelf.page--;

            return ;
        }
        
        
        [self.mutableArray addObjectsFromArray:modearry];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [mySelf.collectionView reloadData];
        });
        
    }];
    
    
    
}
-(void)mjrefresh{
    
    //添加上拉刷新
    
    MJRefreshAutoNormalFooter * footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(handleLoadMore)];
    
    
    
    // [footer setTitle:@"" forState:MJRefreshStateIdle];
    [footer setTitle:@"下来刷新" forState:MJRefreshStateIdle];
    
    [footer setTitle:@"正在加载" forState:MJRefreshStatePulling];
    
    [footer setTitle:@"加 载 中" forState:MJRefreshStateRefreshing];
    
    //   footer.refreshingTitleHidden = YES;
    
    self.collectionView.mj_footer = footer;
    
    
}
-(void)handleLoadMore{
    
    self.page++;
    [self.collectionView.mj_footer endRefreshing];
    [self addNework];
   // NSLog(@"%dkk",self.page);
    
    
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.mutableArray.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString * ID = @"MyCell";
    ClassshopCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    if (!cell) {
        cell = [[ ClassshopCollectionViewCell alloc]init];
    }
  //
    cell.backgroundColor =[UIColor clearColor];
    
    RightModel * rightModel = self.mutableArray[indexPath.row];
  
    cell.booknameString = rightModel.storebookName;
    
    cell.urlImage = [AppNetWork_Post stringByAppendingString:rightModel.storeimageurl];
    
    cell.dateString = rightModel.storedate;
  
    cell.statnameString = @"purchasedBadge";
  
    return cell;

    
    
    
    
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    RecoChildeViewController * sho =[RecoChildeViewController new];
    
    sho.title = @"书刊资料";
    //sho.model = self.mutableArrat[indexPath.row];
   // sho.
    sho.rightmodel = self.mutableArray[indexPath.row];
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
