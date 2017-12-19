//
//  TopicViewController.m
//  ziweiyang
//
//  Created by bidiao on 2017/11/30.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import "TopicViewController.h"
#import "BBTableViewCell.h"
#import "RightModel.h"
#import "BBSModel.h"
@interface TopicViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView * tableView;
@property(nonatomic,strong) NSMutableArray * mutableArray;
@property(nonatomic,assign) int page;
@property(nonatomic,) BOOL isfirst;


@end

@implementation TopicViewController
-(NSMutableArray *)mutableArray {
    if (!_mutableArray) {
        _mutableArray = [NSMutableArray array];
    }
    
    return _mutableArray;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.page =1;
    
     self.isfirst = YES;
    
    [self addTableView];
    
   
    
    [self addaddMJrefresh];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
    
    
    [super viewWillAppear:animated];
    
    if (self.isfirst) {
        
         [self addNework];
    }
}
-(void)addNework{
    
    if (!AppToken_USER_COOKIE) {
      
        return;
    }
    
    NSString * string = [NSString stringWithFormat:@"%@api_get_forum.php?recordperpage=8&page=%d&username=%@&sortby=date&token=%@&active=&s=",AppNetWork_Post,self.page,AppUserName_USER,AppToken_USER_COOKIE];
    DefinmySelf;
    [NeworkViewModel POST:string parameters:nil completionHandler:^(id responsObj, NSError *or) {
        
        
        NSArray * modelArray = [BBSModel recordaddBBSomeModel: responsObj];
        
        [mySelf.mutableArray addObjectsFromArray:modelArray];
        
        
        
        
        if (mySelf.page==1) {
            
            if (!(modelArray.count==0)) {
                BBSModel * bbmode = mySelf.mutableArray[0];
                
                 [[NSNotificationCenter defaultCenter] postNotificationName:@"name" object:nil userInfo:@{@"huiyuan":bbmode.taiyinString,@"score":bbmode.score}];
               // NSLog(@"同学后");
            }
           
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [mySelf.tableView reloadData];
            
            self.isfirst =NO;
            
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
    
    
    BBSModel * bomel = [self.mutableArray lastObject];
    
      [self.tableView.mj_footer endRefreshing];
    
    if ([bomel.total_page intValue] == [bomel.next_page intValue]) {
        
        return;
    }
    
    self.page++;
  
    [self addNework];
    
}
-(void)addTableView{
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 60, self.view.width, self.view.height-180) style:UITableViewStylePlain];
    
    self.tableView.delegate  = self;
    
    self.tableView.dataSource = self;
    
    
    [self.view addSubview:self.tableView];
    
    
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
    
    BBSModel * model = self.mutableArray[indexPath.row];
    
    
    // NSString * string = @"https://www.ziweiyang.com/";
    
    //RightModel * model = self.mutableArray[indexPath.row];
    
    
   // ;
    cell.titleString = model.titleString;
    
   
    
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
