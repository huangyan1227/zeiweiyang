//
//  HotViewController.m
//  ziweiyang
//
//  Created by bidiao on 2017/10/31.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import "HotViewController.h"

#import "HotTableViewCell.h"
#import "HotChildViewController.h"

#import "BBSModel.h"

@interface HotViewController ()<UISearchBarDelegate,UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView * tableView;
@property(nonatomic,strong) NSMutableArray * mutableArrat;
@property(nonatomic,assign) int page;
@end

@implementation HotViewController
-(NSMutableArray *)mutableArrat {
    if (!_mutableArrat) {
        _mutableArrat = [NSMutableArray array];
    }
    
    return _mutableArrat;
    
}
-(UITableView *)tableView {
    if (!_tableView) {
        
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
        
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(titleView.frame), self.view.width, self.view.height-220) style:UITableViewStylePlain];
        
      _tableView.delegate = self;
        
       _tableView.dataSource = self;
        
       _tableView.backgroundColor = [UIColor clearColor];
        
        
        
    }
    
    return _tableView;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
     [self addView];
    UIImageView * imageView = [[UIImageView alloc]init];
    
    imageView.frame = self.view.frame;
    
    [self.view insertSubview:imageView atIndex:0 ];
    
    imageView.image = [UIImage imageNamed:@"bgPattern"];
   
    self.page =1;
    // Do any additional setup after loading the view.
}-(void)addwork{
    
    //
    //NSString *string = @"https://www.ziweiyang.com/api_get_news.php?recordper page=8&page=1&sortby=&token=&s=&main_flag=1&lang=3";
    NSString * string = [NSString stringWithFormat:@"%@api_get_news.php?recordper page=8&page=%d&sortby=&token=&s=&main_flag=1&lang=3",AppNetWork_Post,self.page];
    
    NSString *str1 = [string stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    AFHTTPSessionManager * mgr = [[AFHTTPSessionManager alloc]init];
    
    
    [mgr POST:str1 parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        
        
        
      //  NSArray * modearry = [HomeModel addHomeModel:responseObject];
        
        
//        if (modearry.count==0) {
//
//            // NSLog(@"结术");
//            return ;
//
//
//        }
        
       // [self.mutableArrat addObjectsFromArray:modearry];
        
        
        
        // NSString * a = [NSString stringWithFormat:@"<html><meta charset = \"UTF-8\"  content = \"text/html\"><head></head><body>%@</body></html>",d];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            
            
            [self.tableView reloadData];
            
            
            
        });
        
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        
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
//    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(titleView.frame), self.view.width, self.view.height-220) style:UITableViewStylePlain];
//    
//    self.tableView.delegate = self;
//    
//    self.tableView.dataSource = self;
//    
//    self.tableView.backgroundColor = [UIColor clearColor];
    
    [self.view addSubview:self.tableView];
    
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    static NSString * ID = @"MyCell";
    HotTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[HotTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    cell.backgroundColor = [UIColor clearColor];
    
  //  BBSModel * model = self.mutableArrat[indexPath.row];
    
    cell.titleString = @"八字講義 第04輯 專題研究討論帖";
    cell.contentString = @"此貼是特別開放給 有關已購買閱讀之人";
  
  //  NSString * string = @"https://www.ziweiyang.com/";
    
    
    //cell.nameimageString =[string stringByAppendingString:model.nameimageString];
    
    cell.nameString =@"毛毛";
    cell.taiyinString = @"太陰4 積分687";
    cell.chakanlagString = @"查看437 回復：27";
    //cell.dateString =[NSString stringWithFormat:@"",model.dateString] @"最後發表：10月17日 2017年05：39pm";
    //cell.textLabel.text= @"fsa";
    
    return cell;

}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.navigationController pushViewController:[HotChildViewController new] animated:YES];
    //NSLog(@"點擊");
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    
    
}
-(BOOL)tableView:(UITableView *)tableView shouldShowMenuForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    return YES;
}

-(BOOL)tableView:(UITableView *)tableView canPerformAction:(SEL)action forRowAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender{
    
    return YES;
}
-(void)tableView:(UITableView *)tableView performAction:(SEL)action forRowAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender{
    if (action == @selector(copy:)) {
       // [UIPasteboard generalPasteboard].string = [self.array objectAtIndex:indexPath.row];
    }
    if (action == @selector(cut:)) {
      //  [UIPasteboard generalPasteboard].string = [self.array objectAtIndex:indexPath.row];
      //  [self.array replaceObjectAtIndex:indexPath.row withObject:@""];
        
        [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationLeft];
        
        
    }
    
    if (action == @selector(paste:)) {
      //  NSString *pasteString = [UIPasteboard generalPasteboard].string;
        
      //  NSString *tempString = [NSString stringWithFormat:@"%@%@",[self.array objectAtIndex:indexPath.row],pasteString];
        
        //[self.array replaceObjectAtIndex:indexPath.row withObject:tempString];
      //  [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationLeft];
    }
    
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 240;
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
