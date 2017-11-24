//
//  QuestioneplyViewController.m
//  ziweiyang
//
//  Created by bidiao on 2017/11/3.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import "QuestioneplyViewController.h"
#import "QuestionTableViewCell.h"
#import "Question.h"
#import "QuestionchildViewController.h"
@interface QuestioneplyViewController ()<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate>
@property(nonatomic,strong) UITableView * tableView;

@property(nonatomic,strong) NSMutableArray * mutableArrat;
@property(nonatomic,strong) NSString * token;

@property(nonatomic,) int page;
@end

@implementation QuestioneplyViewController
-(NSMutableArray *)mutableArrat {
    if (!_mutableArrat) {
        _mutableArrat = [NSMutableArray array];
    }
    
    return _mutableArrat;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.page = 1;
    [self adview];
    self.token = @"ALVLmZRJjcb7ylBL1mqu";
    [self addwork];
    // Do any additional setup after loading the view.
}

-(void)addwork{
    
    //
    //NSString *string = @"https://www.ziweiyang.com/api_get_news.php?recordper page=8&page=1&sortby=&token=&s=&main_flag=1&lang=3";
    NSString * string = [NSString stringWithFormat:@"%@api_get_question.php?recordperpage=8&page=%d&sortby=&username=&token=%@&s=&lang=3",AppNetWork_Post,self.page,self.token];
    
    __weak typeof (self) mySelf = self;
    
    [ NeworkViewModel POST:string parameters:nil completionHandler:^(id responsObj, NSError *or) {
        
        NSArray * modearry = [ Question addQuestionModel:responsObj];
        
        
        if (modearry.count==0) {
            
            // NSLog(@"结术");
            return ;
            
            
        }
        
        [mySelf.mutableArrat addObjectsFromArray:modearry];
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            
            
            [mySelf.tableView reloadData];
            
            
            
        });
        
    }];
    
}

-(void)addaddMJrefresh{
    
    
    MJRefreshAutoNormalFooter * footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(handeloadMore)];
    
    
    self.tableView.mj_footer = footer;
    
    
    [footer setTitle:@"正在详细加载" forState:MJRefreshStateIdle];
    
    [footer setTitle:@"正在加载" forState:MJRefreshStatePulling];
    
    [footer setTitle:@"加载中" forState:MJRefreshStateRefreshing];
    
    
    
    
    
}
-(void)handeloadMore{
    
    self.page++;
    [self.tableView.mj_footer endRefreshing];
    [self addwork];
    
}
-(void)adview{
    
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
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(titleView.frame), self.view.width, self.view.height-180) style:UITableViewStylePlain];
    
    self.tableView.delegate = self;
    
    self.tableView.dataSource = self;
    
    self.tableView.backgroundColor = [UIColor clearColor];
    
    [self.view addSubview:self.tableView];
    
    
    
}
-(void)clickselect{
    
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.mutableArrat.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString * ID = @"MyCell";
    QuestionTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[QuestionTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    
    cell.backgroundColor = [UIColor clearColor];
    Question * model = self.mutableArrat[indexPath.row];
    cell.titleString = model.titleString;
   
    cell.nameimageString = model.nameimageString;
    cell.nameString = model.nameString;
  
    cell.chakanlagString = model.chakanlagString;
    cell.dateString = model.dateString;
    
    return cell;

}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self.navigationController pushViewController:[QuestionchildViewController new] animated:YES];
   // NSLog(@"点击");
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 120;
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        
        cell.layoutMargins = UIEdgeInsetsZero;
    }
    
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        cell.separatorInset = UIEdgeInsetsZero;
    }
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
