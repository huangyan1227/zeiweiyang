//
//  TheclassroomrecordViewController.m
//  ziweiyang
//
//  Created by bidiao on 2017/11/15.
//  Copyright © 2017年 bidiao. All rights reserved.
//教室记录

#import "TheclassroomrecordViewController.h"
#import "MPublicTableViewCell.h"
#import "RightModel.h"
#import "ThecClassroomChildViewController.h"
@interface TheclassroomrecordViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView * tableView;
@property(nonatomic,assign) int page;
@property(nonatomic,strong) NSMutableArray * classroomArray;
@property(nonatomic) BOOL isFirst;
@end

@implementation TheclassroomrecordViewController

-(NSMutableArray *)classroomArray {
    if (!_classroomArray) {
        
        _classroomArray = [NSMutableArray array];
    }
    
    return _classroomArray;
    
}
-(UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
        
        _tableView.delegate = self;
        
        _tableView.dataSource = self;
    }
    
    return _tableView;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.page = 1;
    self.isFirst = YES;
    [self addTableView];
    [self addaddMJrefresh];
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    if (self.isFirst) {
      
        self.isFirst = NO;
        [self addNework];
    }
    
    
}
-(void)addNework{
    
    NSString * string = [NSString stringWithFormat:@"%@api_get_history_course.php?recordperpage=8&page=%d&username=%@&token=%@&active=&lang=3",AppNetWork_Post,self.page,AppUserName_USER,AppToken_USER_COOKIE];
    
    DefinmySelf;
    
    
    
    [NeworkViewModel POST:string parameters:nil completionHandler:^(id responsObj, NSError *or) {
        
        NSArray * array = [RightModel classroomModel: responsObj];
    
        
        [mySelf.classroomArray addObjectsFromArray:array];
        
       
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [mySelf.tableView reloadData];
            
        });
        
    }];
    
    
    
    
}
-(void)addaddMJrefresh{
    
    DefinmySelf;
    MJRefreshAutoNormalFooter * footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:mySelf refreshingAction:@selector(handeloadMore)];
    
    
    self.tableView.mj_footer = footer;
    
    
    [footer setTitle:@"正在详细加载" forState:MJRefreshStateIdle];
    
    [footer setTitle:@"正在加载" forState:MJRefreshStatePulling];
    
    [footer setTitle:@"加载中" forState:MJRefreshStateRefreshing];
    
    
    
    
    
}
-(void)handeloadMore{
    
    self.page++;
    [self.tableView.mj_footer endRefreshing];
    
    RightModel * right =self.classroomArray[0];
    
    if (self.page>[right.total_page intValue]) {
        
        return;
    }
    [self addNework];
    
}
-(void)addTableView{
    
    
    
    self.tableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.tableView];
    
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return self.classroomArray.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString * ID = @"MyCell";
   MPublicTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[MPublicTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    
    cell.backgroundColor = [UIColor clearColor];
    
    RightModel * model = self.classroomArray[indexPath.row];
    
    
    
   
  
    cell.rightmodel = model;
    
    return cell;

}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 160;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ThecClassroomChildViewController *child =   [ThecClassroomChildViewController new];
    
    child.classroomModel = self.classroomArray[indexPath.row];
    
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
