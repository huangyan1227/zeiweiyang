//
//  BBreplyViewController.m
//  ziweiyang
//
//  Created by bidiao on 2017/11/30.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import "BBreplyViewController.h"
#import "BBTableViewCell.h"
#import "BBSModel.h"
#import "HotChildViewController.h"
@interface BBreplyViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong) UITableView * tableView;
@property(nonatomic,strong) NSMutableArray * mutableArray;
@property(nonatomic,assign) int page;
@property(nonatomic) BOOL isfrist;
@end

@implementation BBreplyViewController
-(NSMutableArray *)mutableArray {
    if (!_mutableArray) {
        _mutableArray = [NSMutableArray array];
    }
    
    return _mutableArray;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.page = 1;
    
    self.isfrist = YES;
    // Do any additional setup after loading the view.
    [self addTableView];
    
 
    
    [self addNework];
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    if (self.isfrist) {
        
        [self addNework];
    }
}
-(void)addNework{
    
    NSString * string = [NSString stringWithFormat:@"%@api_get_forum_reply.php?recordperpage=8&page=%d&username=%@&sortby=date&token=%@&active=&s=",AppNetWork_Post,self.page,AppUserName_USER,AppToken_USER_COOKIE];
    DefinmySelf;
    [NeworkViewModel POST:string parameters:nil completionHandler:^(id responsObj, NSError *or) {
        
        
        NSArray * modelArray = [BBSModel  recordaddBBReplySomeModel: responsObj];
        
        [mySelf.mutableArray addObjectsFromArray:modelArray];
        
        if (modelArray.count==0) {
            
            mySelf.page--;
            return ;
        }
        
         mySelf.isfrist = NO;
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
    
    [self addNework];
    
}
-(void)addTableView{
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 60, self.view.width, self.view.height-180) style:UITableViewStylePlain];
    
    self.tableView.delegate  = self;
    
    self.tableView.dataSource = self;
    
    
    [self.view addSubview:self.tableView];
    
    [self addaddMJrefresh];
    
    self.tableView.backgroundColor = [UIColor clearColor];
    
    
    
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.mutableArray.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString * ID = @"MyCell";
    BBTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[BBTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    
    
    cell.backgroundColor = [UIColor clearColor];
    
    //  BBSModel * model = self.mutableArrat[indexPath.row];
    
    
    // NSString * string = @"https://www.ziweiyang.com/";
    
    
    
    
    BBSModel * model = self.mutableArray[indexPath.row];
    
    
    
    cell.titleString = model.contentString;
    
    
    
    cell.nameString = model.nameString;
    
    cell.taiyinString =  [NSString stringWithFormat:@"%@ 積分%@",  model.taiyinString,  model.score];
    
    cell.chakanlagString = [NSString stringWithFormat:@"查看%@ 回復：%@",   model.chakanlagString, model.replyString] ;
    
    cell.nameimageString =[AppNetWork_Post stringByAppendingString:model.nameimageString];
    
    cell.dateString =  [NSString stringWithFormat:@"最後發表：%@", model.dateString];
    
    //  cell.textLabel.text = @"ddfg";
    return cell;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 120;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    HotChildViewController * hotchilView =[HotChildViewController new];
    
    
    BBSModel * model = self.mutableArray[indexPath.row];
    hotchilView.sortby = @"date";
    
    hotchilView.formid = model.forumcon_id;
    
    hotchilView.model = model;
    
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
