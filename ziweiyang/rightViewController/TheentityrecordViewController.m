//
//  TheentityrecordViewController.m
//  ziweiyang
//
//  Created by bidiao on 2017/11/15.
//  Copyright © 2017年 bidiao. All rights reserved.
//  实体记录

#import "TheentityrecordViewController.h"
#import "MPublicTableViewCell.h"
#import "RightModel.h"
@interface TheentityrecordViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView * tableView;
@end

@implementation TheentityrecordViewController
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
    // Do any additional setup after loading the view.
    
    [self addTableView];
}
-(void)addTableView{
    
    
    self.tableView.backgroundColor = [UIColor clearColor];
    
    [self.view addSubview:self.tableView];
    
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString * ID = @"MyCell";
    MPublicTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[ MPublicTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    
    cell.backgroundColor = [UIColor clearColor];
    RightModel * model = [RightModel new];
    
    model.namelabel1 = @"购买日期:";
    model.namelabel2 = @"产品编号:";
    model.namelabel3 = @"产品名称:";
    model.namelabel4 = @"数量:";
    model.namelabel5 = @"点数:";
    
    model.isColor = YES;
    model.namelabeltext1  = @"6月25日2017年02:27am";
    
    model.namelabeltext2  = @"ZZ15-004";
    
    model.namelabeltext3  = @"奇门问事";
    
    model.namelabeltext4  = @"1";
    
    model.namelabeltext5 = @"60";
    
    cell.rightmodel = model;
    
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

