//
//  ThehomePageViewController.m
//  ziweiyang
//
//  Created by bidiao on 2017/10/17.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import "ThehomePageViewController.h"

#import "CalendarViewController.h"
#import "ThehomeTableViewCell.h"
#import "TheChildHomeViewController.h"

#import "HomeModel.h"

@interface ThehomePageViewController ()<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate>
@property(nonatomic,strong) UITableView * tableView;

@property(nonatomic,strong) NSMutableArray * mutableArrat;
@property(nonatomic,assign)   int  page;
@end
#define kNaHeight ([[UIApplication sharedApplication] statusBarFrame].size.height>20?20:0)
@implementation ThehomePageViewController
-(NSMutableArray *)mutableArrat {
    if (!_mutableArrat) {
        _mutableArrat = [NSMutableArray array];
    }
    
    return _mutableArrat;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.page = 1;
    
    [self addwork];
    
   // self.view.backgroundColor = [UIColor redColor];
    
    
   // self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightbutton];
    // Do any additional setup after loading the view.
    
    [self addtitleView];
    [self addaddMJrefresh];
}

-(void)addwork{
    
    //
//NSString *string = @"https://www.ziweiyang.com/api_get_news.php?recordper page=8&page=1&sortby=&token=&s=&main_flag=1&lang=3";
    NSString * string = [NSString stringWithFormat:@"%@api_get_news.php?recordper page=8&page=%d&sortby=&token=&s=&main_flag=1&lang=3",AppNetWork_Post,self.page];
    
    __weak typeof (self) mySelf = self;
    
    [ NeworkViewModel POST:string parameters:nil completionHandler:^(id responsObj, NSError *or) {
        
        NSArray * modearry = [HomeModel addHomeModel:responsObj];
        
        
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
-(void)addtitleView{
    
    UIView * titleView = [[UIView alloc]init];
    
    titleView.frame = CGRectMake(0, 0, self.view.width, self.view.height/4+10);
    
    [self.view addSubview:titleView];
    
    titleView.backgroundColor = [UIColor colorWithDisplayP3Red:250/255.0 green:243/255.0 blue:217/255.0 alpha:1];
    
    CGFloat widthBt = (titleView.width -130)/4;
    
    CGFloat intervalbt = 26;
    
    CGFloat buhight = 15;
    
    UIButton * consultingbutton = [[UIButton alloc]init];

    [self addVie:titleView button:consultingbutton frame:CGRectMake(20, buhight, widthBt, widthBt) action:@selector(consultinclick) labe:@"网站咨询" imageString:@"news2"];
  
    UIButton * calendar = [[UIButton alloc]init];
    
    [self addVie:titleView button:calendar frame:CGRectMake(CGRectGetMaxX(consultingbutton.frame)+intervalbt, buhight, widthBt, widthBt) action:@selector(calendar) labe:@"万年历" imageString:@"calendar2"];
    
    UIButton * dailyfinances = [[UIButton alloc]init];
    
  [self addVie:titleView button:dailyfinances frame:CGRectMake(CGRectGetMaxX(calendar.frame)+intervalbt, buhight, widthBt, widthBt) action:@selector(dailyfinances) labe:@"每日财运" imageString:@"daily2"];
    
    UIButton * public = [[UIButton alloc]init];
    
    [self addVie:titleView button: public frame:CGRectMake(CGRectGetMaxX(dailyfinances.frame)+intervalbt, buhight, widthBt, widthBt) action:@selector(public) labe:@"公众论坛" imageString:@"forum2"];
    
      UISearchBar  * seachall = [[UISearchBar  alloc]init];
    
      seachall.frame = CGRectMake(25+widthBt/2,titleView.height- 55, widthBt*2+60, 50);
    
   // seachall.barTintColor = [UIColor whiteColor];
    seachall.placeholder = @"关键字搜索";
    
    seachall.backgroundImage= [UIImage imageWithColor:[UIColor whiteColor]];
    //seachall.searchBarStyle = UISearchBarStyleMinimal;
    [titleView addSubview:seachall];
    
    seachall.delegate = self;
    
    UIButton * buton =[[UIButton alloc]init];
    
    buton.frame = CGRectMake(CGRectGetMaxX(seachall.frame)+5, seachall.y+5, seachall.width*1/2, seachall.height*4/5+5);
    
    [buton addTarget:self action:@selector(clickselect) forControlEvents:UIControlEventTouchUpInside];
    
    [buton setBackgroundImage:[UIImage imageNamed:@"sortBtn"] forState:UIControlStateNormal];
    
    [titleView addSubview:buton];
    
    
    
    
    
    
   
   //添加tableview
    [self addTableView:titleView];
    
    
    
    
}
-(void)clickselect{
    
   // UIAlertAction * seleaction  =[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    
    UIAlertAction * timeaction = [UIAlertAction actionWithTitle:@"上传时间" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    UIAlertController * alcontroller  =[UIAlertController alertControllerWithTitle:@"选择" message:@"" preferredStyle:UIAlertControllerStyleAlert];

    [alcontroller addAction:timeaction];
   // [alcontroller addAction:seleaction];
    
    [self presentViewController:alcontroller animated:YES completion:nil];
    
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
-(void)addTableView:(UIView *)titleview{
    
    UITableView * table =[[UITableView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(titleview.frame), self.view.width, self.view.height-titleview.height-20) style:UITableViewStylePlain];
    table.delegate = self;
    
    table.dataSource = self;
    
    table.backgroundColor = [UIColor clearColor];
    self.tableView = table;
    [self.view addSubview:table];
    
    
    
}

-(void)consultinclick{
    
    
    NSLog(@"点击");
}
-(void)calendar{
    
   // [self addNotion:@7];
    
    [self.main didSelectedButtonFromindex:0 toIndex:7];
    NSLog(@"万年历");
    
   // [self.navigationController pushViewController:[CalendarViewController new] animated:YES];
    
    //[self presentViewController:[CalendarViewController new] animated:YES completion:nil];
}
//先不用通知
-(void)addNotion:(NSNumber *)ger{
    
    NSNotificationCenter * center = [NSNotificationCenter defaultCenter];
    
    //[center postNotificationName:@"plick" object: nil];
    
    [center postNotificationName:@"plick" object:nil userInfo:@{@"ge":ger}];
    
    
}
-(void)dailyfinances {
   
     [self.main didSelectedButtonFromindex:0 toIndex:1];
    NSLog(@"每日财运");
    
}
-(void)public{
    
     [self.main didSelectedButtonFromindex:0 toIndex:10];
    
    NSLog(@"公众论坛");
    
}
-(void)addVie:(UIView*)view button:(UIButton*)button frame:(CGRect)rect action:(SEL)action labe:(NSString*)title imageString:(NSString*)nameTitle{
    
    button.frame = rect;
    
    [button addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    
    [view addSubview:button];
    
    button.layer.cornerRadius = button.frame.size.width/2;
    
    [button setBackgroundImage:[UIImage imageNamed:nameTitle] forState:UIControlStateNormal];
    
    UILabel * label = [[UILabel alloc]init];
    
    label.frame = CGRectMake(button.x, CGRectGetMaxY(button.frame)+10, button.width, 20);
    
    label.font =[UIFont systemFontOfSize:13];
    
    label.adjustsFontSizeToFitWidth = YES;
    
    label.textAlignment = NSTextAlignmentCenter;
    
    [view addSubview:label];
    
    label.text = title;
    
    
    
    
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.mutableArrat.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 100;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString * ID = @"MyCell";
    ThehomeTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[ThehomeTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    
    HomeModel * home = self.mutableArrat[indexPath.row];
    cell.constNString = home.name;
    cell.dateNstring = home.date;
    
   // NSString * string = @"https://www.ziweiyang.com/";
    
  
    
    cell.imageUrlString =  [AppNetWork_Post stringByAppendingString:home.photourl];
    return cell;

    
    
    
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"点击");
    
    TheChildHomeViewController * home =[TheChildHomeViewController new];
   
    home.home = self.mutableArrat[indexPath.row];
    
    [self.navigationController pushViewController:home animated:YES];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//当界面从内存中删除掉的时候，需要去掉通知中心中的注册
- (void)dealloc{
    
    //这个方法，在对象从内存中删除时，自动执行，我们可以重写，来掌握这个时间点
   // [[NSNotificationCenter defaultCenter] removeObserver:self];
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
