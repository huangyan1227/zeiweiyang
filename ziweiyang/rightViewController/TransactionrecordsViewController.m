//
//  TransactionrecordsViewController.m
//  ziweiyang
//
//  Created by bidiao on 2017/11/15.
//  Copyright © 2017年 bidiao. All rights reserved.
//交易记录

#import "TransactionrecordsViewController.h"
#import "TransactionTableViewCell.h"
#import "RightModel.h"
@interface TransactionrecordsViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView * tableView;
@property(nonatomic,assign) int page;
@property(nonatomic,strong) NSMutableArray * transactionreArray;
@property(nonatomic) BOOL isfrist;
@end

@implementation TransactionrecordsViewController
-(NSMutableArray *)transactionreArray {
    if (!_transactionreArray) {
        
        _transactionreArray = [NSMutableArray array];
    }
    
    return _transactionreArray;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.page =1;
   
    [self addTableView];
    //
    
    
}
-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    if (self.isfrist) {
        self.isfrist = NO;
        [self addNework];
    }
    
   
}
-(void)addNework{
    
    NSString * string = [NSString stringWithFormat:@"%@api_get_history_payment.php?recordperpage=8&page=%d&username=%@&token=%@&active=&lang=3",AppNetWork_Post,self.page,AppUserName_USER,AppToken_USER_COOKIE];
    
    DefinmySelf;
    
    
    
    [NeworkViewModel POST:string parameters:nil completionHandler:^(id responsObj, NSError *or) {
        
        NSArray * array = [RightModel transactionrecModel:responsObj];
        NSLog(@" %@---",responsObj);
        
        

        [mySelf.transactionreArray addObjectsFromArray:array];
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [mySelf.tableView reloadData];
            
        });
        
    }];
    
    
    
    
}
-(void)addTableView{
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-60) style:UITableViewStylePlain];
    
    self.tableView.delegate = self;
    
    self.tableView.dataSource = self;
    
    self.tableView.backgroundColor = [UIColor clearColor];
    
    [self addaddMJrefresh];
    
    [self.view addSubview:self.tableView];
    
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
    
    RightModel * right =self.transactionreArray[0];
    
    if (self.page>[right.total_page intValue]) {
        
        return;
    }
    [self addNework];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.transactionreArray.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString * ID = @"MyCell";
    TransactionTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[TransactionTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    RightModel * rigemode = self.transactionreArray[indexPath.row];
    
//    rigemode.zhangdao = @"R051296";
//
//    rigemode.dianshu =@"3.00";
//
//    rigemode.jiaoyi = @"購買教室";
//
//    rigemode.date = @"10月25日2017年20:27pm";
//
    cell.rightmodel = rigemode;
    cell.backgroundColor = [UIColor clearColor];
    
   // cell.textLabel.text = @"拉菲";
    
    return cell;

}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    return 140;
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
//        [cell setSeparatorInset:UIEdgeInsetsZero];
//    }else if ([cell respondsToSelector:@selector(setLayoutMargins:)]){
//        
//        
//        [cell setLayoutMargins:UIEdgeInsetsZero];
//    }
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
