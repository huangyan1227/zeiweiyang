//
//  ThechildClassViewController.m
//  ziweiyang
//
//  Created by bidiao on 2017/10/25.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import "ThechildClassViewController.h"
#import "ClassshopCollectionViewCell.h"
#import "ClassShopViewController.h"
#import "BookModel.h"

@interface ThechildClassViewController ()<UISearchBarDelegate,UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong) UICollectionView * collectionView;
@property(nonatomic,strong) NSMutableArray * mutableArrat;


@property(nonatomic,) int page;
@end

@implementation ThechildClassViewController
-(NSMutableArray *)mutableArrat {
    if (!_mutableArrat) {
        _mutableArrat = [NSMutableArray array];
    }
    
    return _mutableArrat;
    
}
-(UICollectionView *)collectionView {
    if (!_collectionView) {
        
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
        
        
        
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(titleView.frame), self.view.width, self.view.height-titleView.height-100) collectionViewLayout:layoutView];
        
       _collectionView.backgroundColor = [UIColor clearColor];
        
        _collectionView.delegate = self;
       _collectionView.dataSource = self;
        [_collectionView registerClass:[ClassshopCollectionViewCell class] forCellWithReuseIdentifier:@"idCollection"];

    }
    
    return _collectionView;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
   
    self.page =1;
    UIImageView * imageView = [[UIImageView alloc]init];
    
    imageView.frame = self.view.frame;
    
    [self.view insertSubview:imageView atIndex:0 ];
    
    imageView.image = [UIImage imageNamed:@"bgPattern"];
    
     [self addView];
    
     [self addwork];
    
    [self mjrefresh];
    
    // Do any additional setup after loading the view.
}

-(void)addwork{
    
    //
    //NSString *string = @"https://www.ziweiyang.com/api_get_news.php?recordper page=8&page=1&sortby=&token=&s=&main_flag=1&lang=3";
    NSString * string = [NSString stringWithFormat:@"%@api_get_coursebook.php?recordperpage=4&page=%d&sortby=data&username=&token=&active=",AppNetWork_Post,self.page];
    
    __weak typeof (self) mySelf = self;
    
    [ NeworkViewModel POST:string parameters:nil completionHandler:^(id responsObj, NSError *or) {
        
        NSArray * modearry = [BookModel addbookModel:responsObj];
        
        
        if (modearry.count==0) {
            
             mySelf.page--;
            // NSLog(@"结术");
            return ;
            
            
        }
        
        [mySelf.mutableArrat addObjectsFromArray:modearry];
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            
            
            [mySelf.collectionView reloadData];
            
            
            
        });
        
    }];
    
}
-(void)addView{
    
//    UIView * titleView = [[UIView alloc]init];
//
//    titleView .frame = CGRectMake(0, 0, self.view.width, 60);
//
//    CGFloat widthBt = (titleView.width -130)/4;
//
//    [self.view addSubview:titleView];
//
//    UISearchBar  * seachall = [[UISearchBar  alloc]init];
//
//    seachall.frame = CGRectMake(30+widthBt/2, 10, widthBt*2+60, 40);
//
//    // seachall.barTintColor = [UIColor whiteColor];
//    seachall.placeholder = @"关键字搜索";
//
//    seachall.backgroundImage= [UIImage imageWithColor:[UIColor whiteColor]];
//    //seachall.searchBarStyle = UISearchBarStyleMinimal;
//    [titleView addSubview:seachall];
//
//    seachall.delegate = self;
//
//    UIButton * buton =[[UIButton alloc]init];
//
//    buton.frame = CGRectMake(CGRectGetMaxX(seachall.frame)+5, seachall.y, 80, 40);
//
//    [buton addTarget:self action:@selector(clickselect) forControlEvents:UIControlEventTouchUpInside];
//
//    [buton setBackgroundImage:[UIImage imageNamed:@"sortBtn"] forState:UIControlStateNormal];
//
//    [titleView addSubview:buton];
//
//
//
//    UICollectionViewFlowLayout * layoutView = [[UICollectionViewFlowLayout alloc]init];
//
//    layoutView.scrollDirection = UICollectionViewScrollDirectionVertical;
//
//    layoutView.itemSize = CGSizeMake((self.view.width-150)/2,(self.view.height-titleView.height- 250)/2);
//
//
//
//    UICollectionView *colllection = [[UICollectionView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(titleView.frame), self.view.width, self.view.height-titleView.height-100) collectionViewLayout:layoutView];
//
//    colllection.backgroundColor = [UIColor clearColor];
//
//
//    [colllection registerClass:[ClassshopCollectionViewCell class] forCellWithReuseIdentifier:@"idCollection"];
//     [self.view addSubview:colllection];
//    self.collectionView = colllection;
    
   
    
    [self.view addSubview:self.collectionView];
    
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
    
    
    //NSString * string = @"https://www.ziweiyang.com/";
    
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
  
    
    ClassShopViewController * sho =[ClassShopViewController new];
    
    sho.title = @"课程资料";
    
    sho.model = self.mutableArrat[indexPath.row];
    
    sho.api_bookCourse = @"api_get_coursebook_detail.php";
    
    [self.navigationController pushViewController:sho animated:YES];
    
    
}
-(void)viewDidDisappear:(BOOL)animated{
    
    [super viewDidDisappear:animated];
    
   
    [[SDImageCache sharedImageCache] clearDiskOnCompletion:nil];
    [[SDImageCache sharedImageCache] clearMemory];
    
    
}
//-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//
//    return 30;
//}
//
//-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//
//    static NSString * ID = @"MyCell";
//    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
//    if (!cell) {
//        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
//    }
//
//    cell.backgroundColor = [UIColor clearColor];
//    cell.textLabel.text =@"第三方";
//    return cell;
//
//
//
//
//
//}
-(void)clickselect{
    
    
    
    
    
    
}
//search
-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    
    //取消
    //   self.isSerach = NO;
    
    // 放弃作为第一个响应者，关闭键盘
    [searchBar resignFirstResponder];
    
    // [self.tableView reloadData];
    
    
}
-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    NSLog(@"搜索完后");
    // 调用filterBySubstring:方法执行搜索
    [self filterBySubstring:searchText];
    
    
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    
    NSLog(@" %@搜索开始",searchBar.text);
    // 调用filterBySubstring:方法执行搜索
    [self filterBySubstring:searchBar.text];
    // 放弃作为第一个响应者，关闭键盘
    [searchBar resignFirstResponder];
    
}
- (void) filterBySubstring:(NSString*) subStr
{
    
    // 设置为搜索状态
    
    
    
    // 定义搜索谓词
    //  NSPredicate* pred = [NSPredicate predicateWithFormat:
    //  @"SELF CONTAINS[c] %@" , subStr];
    // 使用谓词过滤NSArray
    // NSArray * arrr= [self.tableArray copy];
    
    
    
    // self.searchArray = [arrr filteredArrayUsingPredicate:pred];
    
    // 让表格控件重新加载数据
    // [self.tableView reloadData];
    // [self.searchArray removeAllObjects];
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
