//
//  BookPeriodicalsViewController.m
//  ziweiyang
//
//  Created by bidiao on 2017/10/27.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import "BookPeriodicalsViewController.h"
#import "ClassshopCollectionViewCell.h"
#import "ClassShopViewController.h"
#import "BookModel.h"
@interface BookPeriodicalsViewController ()<UISearchBarDelegate,UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong) UICollectionView * collectionView;
@property(nonatomic,strong) NSMutableArray * mutableArrat;

@property(nonatomic,strong) NSArray * titlel;
@property(nonatomic,) int page;
@property(nonatomic) BOOL  isfriltLog;
@property(nonatomic) BOOL  isNOLog;
@end

@implementation BookPeriodicalsViewController
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
    
    self.isfriltLog = YES;
    
    [self mjrefresh];
   
//    NSString * path = [[NSBundle mainBundle] pathForResource:@"image" ofType:@"plist"];
//    
//     self.imgaArray = [NSArray arrayWithContentsOfFile:path];
//    self.titlel = @[@"『紫微径』",@"『紫微闲话』",@"『术数述异』",@"『紫微新语』",@"『清室气数录』",@"『天网搜奇录』",@"『蕉窗传灯录』",@"『玄空纪异录』",@"『燃犀日知录』"];
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
    
    NSLog(@"登录之后");
    [super viewWillAppear:animated];
    
    if (AppLog_State) {
        
        if (self.isfriltLog) {
            
            [self.mutableArrat removeAllObjects];
            
            self.page=1;
            self.isfriltLog = NO;
             self.isNOLog = YES;
             [self addwork];
            NSLog(@"登录之后1");
        }
    }else{
        
        if (self.isNOLog) {
            [self.mutableArrat removeAllObjects];
            
            self.page=1;
            self.isNOLog = NO;
            
            NSLog(@"登录之后2");
             [self addwork];
        }
    }
    
}
-(void)addwork{
    
    //
    //NSString *string = @"https://www.ziweiyang.com/api_get_news.php?recordper page=8&page=1&sortby=&token=&s=&main_flag=1&lang=3";
    NSString * string = [NSString stringWithFormat:@"%@api_get_ebook.php?recordperpage=4&page=%d&sortby=data&username=%@&token=%@&active=",AppNetWork_Post,self.page,AppUserName_USER,AppToken_USER_COOKIE
                         ];
    
    __weak typeof (self) mySelf = self;
    
    [ NeworkViewModel POST:string parameters:nil completionHandler:^(id responsObj, NSError *or) {
        
        NSArray * modearry = [BookModel addbookModel:responsObj];
        
        
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
    
    //    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(titleView.frame), self.view.width, self.view.height-titleView.height-100) style:UITableViewStylePlain];
    //
    //    tableView.backgroundColor = [UIColor clearColor];
    //
    //    [self.view addSubview:tableView];
    //
    //    tableView.delegate = self;
    //
    //    tableView.dataSource = self;
    
    UICollectionViewFlowLayout * layoutView = [[UICollectionViewFlowLayout alloc]init];
    
    layoutView.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    layoutView.itemSize = CGSizeMake((self.view.width-150)/2,(self.view.height-titleView.height- 250)/2);
    
    
    
    UICollectionView *colllection = [[UICollectionView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(titleView.frame), self.view.width, self.view.height-titleView.height-100) collectionViewLayout:layoutView];
    
    colllection.backgroundColor = [UIColor clearColor];
    
    [self.view addSubview:colllection];
    [colllection registerClass:[ClassshopCollectionViewCell class] forCellWithReuseIdentifier:@"idCollection"];
    
    self.collectionView = colllection;
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
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
  //  NSLog(@"%dkk",self.page);
   
    
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.mutableArrat.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    ClassshopCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"idCollection" forIndexPath:indexPath];
    
    if (!cell) {
        
        cell = [[ClassshopCollectionViewCell alloc]init];
    }
    
    
    
    BookModel * bookmodel = self.mutableArrat[indexPath.row];
    
    
    
    
    

    cell.booknameString = bookmodel.namebook;
    
    cell.urlImage = [AppNetWork_Post stringByAppendingString:bookmodel.imagebook];
    cell.dateString = bookmodel.datebook;
    if (bookmodel.isbought) {
        cell.statnameString = @"purchasedBadge";
    }else{
       
         cell.statnameString = @"newItem";
    }
  
    
    return cell;
    
    
    
}

//设置每个item的UIEdgeInsets
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(40, 50, 20, 50);
    
    // UIEdgeInsetsMake(<#CGFloat top#>, <#CGFloat left#>, <#CGFloat bottom#>, <#CGFloat right#>)
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
 //   NSLog(@"%@", AppToken_USER_COOKIE);
    
 //   NSLog(@"%d", AppLog_State);
    
   // if (AppLog_State) {
        
      //  NSLog(@"登录成功");
   // }
    
    ClassShopViewController * sho =[ClassShopViewController new];
    
    sho.title = @"书刊资料";
    sho.model = self.mutableArrat[indexPath.row];
    
    sho.api_bookCourse = @"api_get_ebook_detail.php";
    //[self.navigationController pushViewController:sho animated:YES];
    
    
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
