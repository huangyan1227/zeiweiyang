//
//  CoursecontentViewController.m
//  ziweiyang
//
//  Created by bidiao on 2017/10/31.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import "CoursecontentViewController.h"
#import "CourseDetailViewController.h"
@interface CoursecontentViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView * tableView;
@property(nonatomic,strong) NSMutableArray * mutableArrat;
@property(nonatomic,assign) int page;

@property(nonatomic,strong) NSString * idstring;
@end

@implementation CoursecontentViewController
-(NSMutableArray *)mutableArrat {
    if (!_mutableArrat) {
    
        _mutableArrat = [NSMutableArray array];
    }
    
    return _mutableArrat;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.page =1;
    UIImageView * imageView = [[UIImageView alloc]init];
    
    imageView.frame = self.view.frame;
    
    [self.view insertSubview:imageView atIndex:0 ];
    
    imageView.image = [UIImage imageNamed:@"bgPattern"];
    
    self.title = @"目录";
   
   // NSLog(@"%@gdddff",self.bookmodel.idbook);
    // Do any additional setup after loading the view.
    [self addView];
    
     [self addWork];
}
-(void)addWork{
    
   // NSString * string = [NSString stringWithFormat:@"%@api_get_ebook_detail.php?recordperpage=10&page=%d&id=%@&username=bigmeo2013@gmail.com&token=PbE1JtK0xLrIK74U4GF0&active=&lang=3",AppInfo_APP_LOG,self.page,self.bookmodel.idbook];
 
//#warning token 用户名
   //api_get_ebook_detail.php
    
  
    if (self.idmycoursBook.length>0) {
        
        self.idstring = self.idmycoursBook;
        
       
    }else{
        
        
        
        self.idstring = self.bookmodel.idbook;
        
    };
    
    NSString * string =[NSString stringWithFormat: @"%@%@?recordperpage=10&page=%d&id=%@&username=%@&token=%@&active=&lang=3",AppNetWork_Post,self.api_bookcourse,self.page,self.idstring,AppUserName_USER,AppToken_USER_COOKIE];
    
      __weak typeof (self) mySelf = self;
    [NeworkViewModel POST:string parameters:nil completionHandler:^(id responsObj, NSError *or) {
     
      NSArray *courArray =  [CoursecontModel addModel:responsObj ];
       
       
        if (courArray.count==0) {
            
            mySelf.page--;
            return ;
        }
        
        
        [mySelf.mutableArrat addObjectsFromArray:courArray];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [mySelf.tableView reloadData];
        });
        
        
    }];
    
    
    
    
    
    
}
-(void)addView{
    
    
    UILabel * label = [[UILabel alloc] init];
    
        label.text = @"目录";
    
        label.backgroundColor = [UIColor clearColor];
    
        label.textAlignment = NSTextAlignmentCenter;
    
       label.frame = CGRectMake(0, 5, self.view.width, 30);
                             
      [self.view addSubview:label];
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(label.frame), self.view.width, self.view.height-40) style:UITableViewStylePlain];
    
    self.tableView.delegate = self;
    
    self.tableView.dataSource = self;
    
    self.tableView.backgroundColor = [UIColor clearColor];
    
    [self.view addSubview:self.tableView];
    
    DefinmySelf;
    MJRefreshAutoNormalFooter * footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:mySelf refreshingAction:@selector(handeloadMore)];
    
    
    self.tableView.mj_footer = footer;
    
    
   // [footer setTitle:@"正在详细加载" forState:MJRefreshStateIdle];
    
    [footer setTitle:@"正在加载" forState:MJRefreshStatePulling];
    
    [footer setTitle:@"加载中" forState:MJRefreshStateRefreshing];
    
    
}

-(void)handeloadMore{
    
    self.page++;
    [self.tableView.mj_footer endRefreshing];
    [self addWork];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.mutableArrat.count;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}
//-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
//
//    return @"目录";
//}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString * ID = @"MyCell";
   CoursecontTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[CoursecontTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    
    cell.backgroundColor = [UIColor clearColor];
    cell.coursModel = self.mutableArrat[indexPath.row];
   // cell.textLabel.text = @"dkkkkk";
    
    return cell;

}
//-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//
//    UILabel * label = [[UILabel alloc] init];
//
//    label.text = @"目录";
//
//    label.backgroundColor = [UIColor clearColor];
//
//    label.textAlignment = NSTextAlignmentCenter;
//
//    label.frame = CGRectMake(0, 5, self.view.width, self.view.height-5);
//
//    return label;
//
//
//
//
//}
//-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//
//    return 40;
//}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    CourseDetailViewController * detaiController =[[CourseDetailViewController alloc]init];
    
    detaiController.array = self.mutableArrat;
    
    detaiController.indext=  indexPath.row;
    
    detaiController.idbook = self.bookmodel.idbook;
    
    [self.navigationController pushViewController:detaiController animated:YES];
    NSLog(@"点击");
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    return [self.tableView cellHeightForIndexPath:indexPath model:self.mutableArrat[indexPath.row] keyPath:@"coursModel" cellClass:[CoursecontTableViewCell class] contentViewWidth:[self cellContentViewWith] ];
    
    
    
    
}
- (CGFloat)cellContentViewWith
{
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    
    // 适配ios7横屏
    if ([UIApplication sharedApplication].statusBarOrientation != UIInterfaceOrientationPortrait && [[UIDevice currentDevice].systemVersion floatValue] < 8) {
        width = [UIScreen mainScreen].bounds.size.height;
    }
    return width;
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
