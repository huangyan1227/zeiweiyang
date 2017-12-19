//
//  TheentityrecordViewController.m
//  ziweiyang
//
//  Created by bidiao on 2017/11/15.
//  Copyright © 2017年 bidiao. All rights reserved.
//  实体记录

#import "TheentityrecordViewController.h"
#import "EntiytTableViewCell.h"
#import "RightModel.h"
@interface TheentityrecordViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView * tableView;
@property(nonatomic,assign) int page;
@property(nonatomic,strong) NSMutableArray * modeMutatleArray;
@property(nonatomic) BOOL isFirst;
@end

@implementation TheentityrecordViewController

-(NSMutableArray *)modeMutatleArray {
    if (!_modeMutatleArray) {
        
        _modeMutatleArray = [NSMutableArray array];
    }
    
    return _modeMutatleArray;
    
}
-(UITableView *)tableView {
    if (!_tableView) {
        
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height-60) style:UITableViewStylePlain];
        
        _tableView.delegate = self;
        
        _tableView.dataSource = self;
    }
    
    return _tableView;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.page = 1;
    self.isFirst = YES;

    [self addTableView];
}
-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    if (self.isFirst) {
        self.isFirst = NO;
      //  NSLog(@"实体一333次");
         [self addNework];
    }
    
    
    // NSLog(@"实体一eew333次");

}
-(void)addNework{
    
    NSString * string = [NSString stringWithFormat:@"%@api_shop_get_transaction2.php?recordperpage=8&page=%d&sortby=date&token=%@&active=&username=%@",AppNetWork_Post,self.page,AppToken_USER_COOKIE,AppUserName_USER];
    DefinmySelf;
    [NeworkViewModel POST:string parameters:nil completionHandler:^(id responsObj, NSError *or) {
        
        NSArray * entityModelArray = [RightModel addEntityModel:responsObj];
   
        if (entityModelArray.count==0) {
            mySelf.page--;
        
            return ;
        }
        [mySelf.modeMutatleArray addObjectsFromArray:entityModelArray];
       
        dispatch_async(dispatch_get_main_queue(), ^{
            
            
            [mySelf.tableView reloadData];
            
            
        });
        
        
        
    }];
    
    
}
-(void)addTableView{
    
    
    self.tableView.backgroundColor = [UIColor clearColor];
    
    [self mjtableView];
   
    [self.view addSubview:self.tableView];
    
    
}
-(void)mjtableView{
    
    
    MJRefreshAutoNormalFooter * footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(handleLoadMore)];
    
    
    [footer setTitle:@"下来刷新" forState:MJRefreshStateIdle];
    
    [footer setTitle:@"正在加载" forState:MJRefreshStatePulling];
    
    [footer setTitle:@"加 载 中" forState:MJRefreshStateRefreshing];
    
    //   footer.refreshingTitleHidden = YES;
    
    self.tableView.mj_footer = footer;
    
    
    
    
    
}
-(void)handleLoadMore{
    
    
    
    self.page++;
    [self.tableView.mj_footer endRefreshing];
    [self addNework];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.modeMutatleArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString * ID = @"MyCell";
   EntiytTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[ EntiytTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    
    cell.backgroundColor = [UIColor clearColor];
   
    
    RightModel * model = self.modeMutatleArray[indexPath.row];
  
//    
   cell.arightmodel = model;
    
    return cell;

    
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 160;
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

