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
@end

@implementation TheclassroomrecordViewController
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
    
    
    [self addTableView];
    
    // Do any additional setup after loading the view.
}
-(void)addTableView{
    
    
    
    self.tableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.tableView];
    
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return 10;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString * ID = @"MyCell";
   MPublicTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[MPublicTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    
    cell.backgroundColor = [UIColor clearColor];
    RightModel * model = [RightModel new];
    
    model.namelabel1 = @"課程名稱:";
    model.namelabel2 = @"課程章節:";
    model.namelabel3 = @"購買日期:";
    model.namelabel4 = @"已付點數:";
    model.namelabel5 = @"課程種類:";
    
    model.namelabeltext1  = @"紫微斗數 第25輯";
    
     //model.namelabeltext2  = @"";
    
    model.namelabeltext3  = @"10月25日2017年02:27pm";
    
     model.namelabeltext4  = @"3.00";
    
     model.namelabeltext5 = @"課程書籍";
  
    cell.rightmodel = model;
    
    return cell;

}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 160;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self.navigationController pushViewController:[ThecClassroomChildViewController new] animated:YES];
    
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
