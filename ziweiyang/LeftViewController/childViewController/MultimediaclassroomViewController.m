//
//  MultimediaclassroomViewController.m
//  ziweiyang
//
//  Created by bidiao on 2017/10/26.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import "MultimediaclassroomViewController.h"

#import "ClassshopCollectionViewCell.h"

@interface MultimediaclassroomViewController ()<UISearchBarDelegate,UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong) UICollectionView * collectionView;
@end

@implementation MultimediaclassroomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addView];
    
    UIImageView * imageView = [[UIImageView alloc]init];
    
    imageView.frame = self.view.frame;
    
    [self.view insertSubview:imageView atIndex:0 ];
    
    imageView.image = [UIImage imageNamed:@"bgPattern"];
    // Do any additional setup after loading the view.
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

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 20;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    ClassshopCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"idCollection" forIndexPath:indexPath];
    
    if (!cell) {
        
        cell = [[ClassshopCollectionViewCell alloc]init];
    }
    
    
    cell.isShow = YES;
    
  //  cell.booknameString = @"八字讲义 第04辑";
   // cell.imageString = @"book";
  //  cell.dateString = @"2015-11-01";
   // cell.statnameString = @"最新项目";
    
    
    // cell.backgroundColor = [UIColor redColor];
    
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
    NSLog(@"%ld", (long)indexPath.row);
    
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
