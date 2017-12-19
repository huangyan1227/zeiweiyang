//
//  ThefoundationViewController.m
//  ziweiyang
//
//  Created by bidiao on 2017/10/31.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import "ThefoundationViewController.h"
#import "HotTableViewCell.h"
#import "BBSModel.h"
#import "HotChildViewController.h"
@interface ThefoundationViewController ()<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate>
@property(nonatomic,strong) UITableView * tableView;
@property(nonatomic,strong) NSMutableArray * mutableArrat;
@property(nonatomic,assign) int page;
#define kNaHeight ([[UIApplication sharedApplication] statusBarFrame].size.height>20?20:0)
@end

@implementation ThefoundationViewController
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
    
    self.page = 1;
    
    
    
    [self addView];
    
    [self addwork];
    
    [self addaddMJrefresh];
    // Do any additional setup after loading the view.
}

-(void)addwork{
    
    NSString * string = [NSString stringWithFormat:@"%@api_get_forum.php?recordper page=8&page=%d&sortby=data&username=&token=&s=&lang=3&forum_type=0",AppNetWork_Post,self.page];
    __weak typeof (self) mySelf = self;
    
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
//    
    [self.view addSubview:self.tableView];
    
    
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
-(void)clickselect{
    
    
    NSLog(@"ddaffeefe");
    
    
    
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.mutableArrat.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString * ID = @"MyCell";
    HotTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[HotTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    
    cell.backgroundColor = [UIColor clearColor];
    
    BBSModel * model = self.mutableArrat[indexPath.row];
    

   // NSString * string = @"https://www.ziweiyang.com/";
    
    
    
    
    cell.isConten = YES;
    cell.titleString = model.titleString;

    cell.nameString = model.nameString;
    
    cell.taiyinString =  [NSString stringWithFormat:@"%@ 積分%@",  model.taiyinString, model.score];
   
    cell.chakanlagString = [NSString stringWithFormat:@"查看%@ 回復：%@",  model.chakanlagString, model.replyString] ;
    
    cell.nameimageString =[AppNetWork_Post stringByAppendingString:model.nameimageString];
    
    cell.dateString =  [NSString stringWithFormat:@"最後發表：%@",model.dateString];
   
    //cell.textLabel.text = @"sdfa";
    
    return cell;

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 140;
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    cell.separatorInset = UIEdgeInsetsZero;
    
    cell.layoutMargins = UIEdgeInsetsZero;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    HotChildViewController * child = [HotChildViewController new];
     BBSModel * model = self.mutableArrat[indexPath.row];
    child.model = model;
    child.formid = model.conid;
   
    [self.navigationController pushViewController:child animated:YES];
    
    
    
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
