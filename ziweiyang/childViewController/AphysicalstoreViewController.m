//
//  AphysicalstoreViewController.m
//  ziweiyang
//
//  Created by bidiao on 2017/10/27.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import "AphysicalstoreViewController.h"

#import "ShopphysicaCollectionViewCell.h"
#import "ClassShopViewController.h"
#import "PhysicachildernViewController.h"

#import "PhyModel.h"



@interface AphysicalstoreViewController ()<UISearchBarDelegate,UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong) UICollectionView * collectionView;
@property(nonatomic,strong) NSMutableArray * mutableArrat;

@property(nonatomic,strong) NSArray * titlel;
@property(nonatomic,) int page;
@end

@implementation AphysicalstoreViewController
-(NSMutableArray *)mutableArrat {
    if (!_mutableArrat) {
        _mutableArrat = [NSMutableArray array];
    }
    
    return _mutableArrat;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addView];
    
    self.page = 1;
    
    [self mjrefresh];
    [self addwork];
    // Do any additional setup after loading the view.
}
-(void)addwork{
    
    //
    //NSString *string = @"https://www.ziweiyang.com/api_get_news.php?recordper page=8&page=1&sortby=&token=&s=&main_flag=1&lang=3";
    NSString * string = [NSString stringWithFormat:@"%@api_get_shop_product.php?recordperpage=4&page=%d&sortby=data&username=&token=&active=",AppNetWork_Post,self.page];
    
    __weak typeof (self) mySelf = self;
    
    [ NeworkViewModel POST:string parameters:nil completionHandler:^(id responsObj, NSError *or) {
        
        NSArray * modearry = [PhyModel addPhyModel:responsObj];
        
        
        if (modearry.count==0) {
            
            // NSLog(@"结术");
             mySelf.page--;
            
            return ;
            
            
        }
        
        [mySelf.mutableArrat addObjectsFromArray:modearry];
        
        
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
    [self addwork];
   // NSLog(@"%dkk",self.page);
    
    
}
-(void)addView{
    
    UIView * titleView = [[UIView alloc]init];
    
    titleView .frame = CGRectMake(0, 0, self.view.width, 60);
    
    CGFloat widthBt = (titleView.width -130)/4;
    
    [self.view addSubview:titleView];
    
    UISearchBar  * seachall = [[UISearchBar  alloc]init];
    
    seachall.frame = CGRectMake(30+widthBt/2, 10, widthBt*2+60, 40);
    
    // seachall.barTintColor = [UIColor whiteColor];
    seachall.placeholder = @"关键字搜索";
    
    seachall.backgroundImage= [UIImage imageWithColor:[UIColor whiteColor]];
    //seachall.searchBarStyle = UISearchBarStyleMinimal;
    [titleView addSubview:seachall];
    
    seachall.delegate = self;
    
    UIButton * buton =[[UIButton alloc]init];
    
    buton.frame = CGRectMake(CGRectGetMaxX(seachall.frame)+5, seachall.y, 80, 40);
    
    [buton addTarget:self action:@selector(clickselect) forControlEvents:UIControlEventTouchUpInside];
    
    [buton setBackgroundImage:[UIImage imageNamed:@"sortBtn"] forState:UIControlStateNormal];
    
    [titleView addSubview:buton];
    
    
    UICollectionViewFlowLayout * layoutView = [[UICollectionViewFlowLayout alloc]init];
    
    layoutView.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    layoutView.itemSize = CGSizeMake((self.view.width-150)/2,(self.view.height-titleView.height- 250)/2);
    
    
    
    UICollectionView *colllection = [[UICollectionView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(titleView.frame), self.view.width, self.view.height-titleView.height-100) collectionViewLayout:layoutView];
    
    colllection.backgroundColor = [UIColor clearColor];
    
    [self.view addSubview:colllection];
    [colllection registerClass:[ShopphysicaCollectionViewCell class] forCellWithReuseIdentifier:@"idCollection"];
    
    self.collectionView = colllection;
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
}

-(void)clickselect{
    
    
    
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.mutableArrat.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    ShopphysicaCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"idCollection" forIndexPath:indexPath];
    
    if (!cell) {
        
        cell = [[ShopphysicaCollectionViewCell alloc]init];
    }
    
    PhyModel * model = self.mutableArrat[indexPath.row];
    
     NSString * string = @"https://www.ziweiyang.com/";
    
    
    cell.booknameString = model.titleName;
    
    //[[SDImageCache sharedImageCache] setShouldDecompressImages:NO];
   
    cell.imageString = [string stringByAppendingString: model.photolist[0]];
    cell.bianhaoString = [NSString stringWithFormat:@"編號：%@",model.bianName];
    
    cell.dianString = [NSString stringWithFormat:@"會員點數: %@",model.coinName];
  
    
    
    return cell;
    
    
    
}

//设置每个item的UIEdgeInsets
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(40, 50, 20, 50);
    
 
}
//设置每个item水平间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 50;
}

//设置每个item垂直间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 50;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%ld", (long)indexPath.row);
    
    [self.navigationController pushViewController:[PhysicachildernViewController new] animated:YES];
    
}- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    SDWebImageManager *manager = [SDWebImageManager sharedManager];
    
    // 取消正在下载的操作
    
    [manager cancelAll];
    
    // 清除内存缓存
    
    [manager.imageCache clearMemory];
    
    //释放磁盘的缓存
    
    [manager.imageCache clearDiskOnCompletion:nil];
    
   
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
