//
//  SeniorViewController.m
//  ziweiyang
//
//  Created by bidiao on 2017/10/31.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import "SeniorViewController.h"

#import "HotTableViewCell.h"
#import "UIImage+Extension.h"
#import "BBSModel.h"

#import "HotChildViewController.h"
@interface SeniorViewController ()<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate>
@property(nonatomic,strong) UITableView * tableView;
@property(nonatomic,strong) NSMutableArray * mutableArrat;
@property(nonatomic,assign) int page;
@end
#define kNaHeight ([[UIApplication sharedApplication] statusBarFrame].size.height>20?20:0)
@implementation SeniorViewController
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
        
       _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(titleView.frame), self.view.width, self.view.height-65-titleView.height-80) style:UITableViewStylePlain];
        
        _tableView.delegate = self;
        
        _tableView.dataSource = self;
        
       _tableView.backgroundColor = [UIColor clearColor];
        
    }
    
    return _tableView;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addwork];
    
    [self addView];
  
    [self addaddMJrefresh];
    // Do any additional setup after loading the view.
}
-(void)addwork{
    
  
    NSString * string = [NSString stringWithFormat:@"%@api_get_forum.php?recordper page=8&page=%d&sortby=data&username=&token=&s=&lang=3&forum_type=1",AppNetWork_Post,self.page];
                         
    __weak typeof(self) mySelf = self;
    
    [ NeworkViewModel POST:string parameters:nil completionHandler:^(id responsObj, NSError *or) {
        
        NSArray * modearry = [BBSModel addBBSomeModel:responsObj];
        
        if (modearry.count==0) {
            
            mySelf.page--;
            
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
//    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(titleView.frame), self.view.width, self.view.height-65-titleView.height-80) style:UITableViewStylePlain];
//
//    self.tableView.delegate = self;
//
//    self.tableView.dataSource = self;
//
//    self.tableView.backgroundColor = [UIColor clearColor];
    
    [self.view addSubview:self.tableView];
    
    
}
-(void)clickselect{
    NSLog(@"发的多多多");
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * ID = @"MyCell";
   HotTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[HotTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    BBSModel * model = self.mutableArrat[indexPath.row];
    
    
    NSString * string = @"https://www.ziweiyang.com/";
    
    
    
    cell.backgroundColor = [UIColor clearColor];
//    cell.isConten = YES;
//    cell.titleString = @"紫薇杨命盘网站";
//    // cell.contentString = @"此貼是特別開放給 有關已購買閱讀之人";
//    cell.nameimageString =@"fb";
//    cell.nameString = @"毛毛";
//    cell.taiyinString = @"太陰4 積分687";
//    cell.chakanlagString = @"查看437 回復：27";
//    cell.dateString = @"最後發表：10月17日 2017年05：39pm";
//
    cell.isConten = YES;
    cell.titleString = model.titleString;
    
    cell.nameString = model.nameString;
    
    cell.taiyinString =  [NSString stringWithFormat:@"%@ 積分%@",  model.taiyinString, model.score];
    
    cell.chakanlagString = [NSString stringWithFormat:@"查看%@ 回復：%@",  model.chakanlagString, model.replyString] ;
    
    cell.nameimageString =[string stringByAppendingString:model.nameimageString];
    
    cell.dateString =  [NSString stringWithFormat:@"最後發表：%@",model.dateString];
    
    return cell;

    
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.mutableArrat.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 140;
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        cell.layoutMargins = UIEdgeInsetsZero;
    }
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        cell.separatorInset = UIEdgeInsetsZero;
    }
    
    
    
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    HotChildViewController* child = [HotChildViewController new];
    
    BBSModel * model = self.mutableArrat[indexPath.row];
    
    child.formid = model.conid;
    
     [self.navigationController pushViewController:child animated:YES];
    NSLog(@"点击");
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
