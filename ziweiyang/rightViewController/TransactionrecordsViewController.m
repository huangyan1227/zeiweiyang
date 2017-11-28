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
@end

@implementation TransactionrecordsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [self addTableView];
    
    
    
}
-(void)addTableView{
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-60) style:UITableViewStylePlain];
    
    self.tableView.delegate = self;
    
    self.tableView.dataSource = self;
    
    self.tableView.backgroundColor = [UIColor clearColor];
    
    [self.view addSubview:self.tableView];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString * ID = @"MyCell";
    TransactionTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[TransactionTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    RightModel * rigemode = [RightModel new];
    
    rigemode.zhangdao = @"R051296";
    
    rigemode.dianshu =@"3.00";
    
    rigemode.jiaoyi = @"購買教室";
    
    rigemode.date = @"10月25日2017年20:27pm";
    
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
