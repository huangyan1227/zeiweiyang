//
//  RightMainViewController.m
//  ziweiyang
//
//  Created by bidiao on 2017/11/14.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import "RightMainViewController.h"

@interface RightMainViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView * tableVIew;
@property(nonatomic,strong) NSArray * arraycont;
@property(nonatomic,assign) NSInteger  forminteger;
@end
#define kNaHeight ([[UIApplication sharedApplication] statusBarFrame].size.height>20?20:0)
#define fontColor(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
@implementation RightMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.forminteger = 15;
    self.view.backgroundColor = fontColor(236, 227, 197);
    // Do any additional setup after loading the view.
    self.arraycont= @[@"基本资料",@"交易记录",@"商店记录",@"教室记录",@"实体纪录",@"论坛纪录",@"提问纪录",@"退出"];
    [self addtable];
}

-(void)addtable{
    CGFloat navi =[UIScreen mainScreen].bounds.size.height -2*60;
    CGFloat scale =navi/[UIScreen mainScreen].bounds.size.height;
    CGFloat leftMenuMargin =[UIScreen mainScreen].bounds.size.width*(1-scale)*0.5;
    
    
    CGFloat translateX = 200-leftMenuMargin;
    
  //  NSLog(@"%@")
    
    self.tableVIew = [[UITableView alloc]initWithFrame:CGRectMake( self.view.frame.size.width- translateX, 60+kNaHeight, self.view.frame.size.width- translateX+10, self.view.frame.size.height-60-kNaHeight) style:UITableViewStylePlain];
    
    self.tableVIew.delegate = self;
    
    self.tableVIew.dataSource = self;
    
   self.tableVIew.backgroundColor =fontColor(241, 241, 241);
    
    [self.view addSubview:self.tableVIew];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.arraycont.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString * ID = @"MyCell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    cell.backgroundColor =fontColor(241, 241, 241);
    
    cell.textLabel.text = self.arraycont[indexPath.row];
    
    cell.textLabel.textColor = fontColor(105, 80, 35);
    
    //cell.selectionStyle = UITableViewCellSelectionStyleBlue;
    cell.selectionStyle = UITableViewCellSelectionStyleBlue;
    
    return cell;

}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
  //  UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
   // cell.backgroundColor = [UIColor redColor];
    
    if ([self.rigdeleage respondsToSelector:@selector(rightMenudidSelectedButtonFromindex:toIndex:)]) {
        
   
        [self.rigdeleage rightMenudidSelectedButtonFromindex:self.forminteger toIndex:indexPath.row+15];
           
    }
    

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
