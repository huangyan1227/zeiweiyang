//
//  BasicinformationViewController.m
//  ziweiyang
//
//  Created by bidiao on 2017/11/15.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import "BasicinformationViewController.h"
#import "UIViewController+XHPhoto.h"
#import "RetrievethepasswordViewController.h"
#import "BasicDataViewController.h"
#import "RightModel.h"
@interface BasicinformationViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView * tableView;
@property(nonatomic,strong) NSArray * baciarrayCont;
@property(nonatomic,strong) NSArray * bacionearrayCont;
@property(nonatomic,strong) NSArray * bacitwoarrayCont;
@property(nonatomic,strong) UIImageView * iconImageView;
@property(nonatomic) BOOL isfrist;
@property(nonatomic,strong) NSMutableArray * mutableArray;

@end

@implementation BasicinformationViewController
-(NSMutableArray *)mutableArray {
    if (!_mutableArray) {
        
        _mutableArray = [NSMutableArray array];
    }
    
    return _mutableArray;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addView];
    
    self.isfrist = YES;
        NSString * path = [[NSBundle mainBundle] pathForResource:@"basci" ofType:@"plist"];
        NSString * onepath = [[NSBundle mainBundle] pathForResource:@"bascione" ofType:@"plist"];
        NSString * twopath = [[NSBundle mainBundle] pathForResource:@"bascitwo" ofType:@"plist"];
    self.baciarrayCont    = [NSArray arrayWithContentsOfFile:path];
    self.bacionearrayCont = [NSArray arrayWithContentsOfFile:onepath];
    self.bacitwoarrayCont = [NSArray arrayWithContentsOfFile:twopath];
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    if (self.isfrist) {
        
        //self.isfrist = NO;
        
        [self addNework];
    }
}
-(void)addNework{
    
    
    MBProgressHUD * hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    hud.backgroundColor = [UIColor whiteColor];
    hud.label.text = @"正在加载";
    
    NSString * string = [NSString stringWithFormat:@"%@api_get_member_info.php?username=bigmeo2013@gmail.com&token=r6LCrdV6YiJrseAcCE4U&active=",AppNetWork_Post];
    DefinmySelf;
    [NeworkViewModel POST:string parameters:nil completionHandler:^(id responsObj, NSError *or) {
        
        
        NSArray * rightModel = [RightModel addBaseModel:responsObj];
        
        [mySelf.mutableArray addObjectsFromArray:rightModel];
        
        dispatch_async(dispatch_get_main_queue(), ^{
           
            [hud hideAnimated:YES];
            
           [mySelf.tableView reloadData];
            
        });
        
        
    }];
    
}
-(void)addView{
    
       self.iconImageView = [[UIImageView alloc]init];
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height-20) style:UITableViewStyleGrouped];
    
    self.tableView.backgroundColor =[UIColor clearColor];
    
    self.tableView.delegate = self;
    
    self.tableView.dataSource = self;
    
    [self.view addSubview:self.tableView];
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section==0) {
        return self.bacionearrayCont.count;
    }else if (section==1){
        
        return self.bacitwoarrayCont.count;
    }else{
        
        return self.baciarrayCont.count;
    }
    
    
    
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
 //NSString * ID = [NSString stringWithFormat: @"MyCell%ld",indexPath.row ];
    static NSString * ID = @"MyCell";
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }else{
        while ([cell.contentView.subviews lastObject] != nil) {
            [(UIView*)[cell.contentView.subviews lastObject] removeFromSuperview];  //删除并进行重新分配
        }
    }
    
    cell.backgroundColor = [UIColor clearColor];
    
    if (indexPath.section==0) {
        
        
        if (indexPath.row==0) {
         
            
            self.iconImageView.frame = CGRectMake(self.view.width-80, 2, 40,40);
            self.iconImageView.layer.cornerRadius =20;
            
         //   self.iconImageView.backgroundColor = [UIColor yellowColor];
            
            self.iconImageView.layer.masksToBounds = YES;
            
            if (self.mutableArray.count>0) {
                [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:[AppNetWork_Post stringByAppendingString:self.mutableArray[indexPath.row]]]];
            }
            
            cell.detailTextLabel.text =@"";
            [cell.contentView addSubview:self.iconImageView];
        
        }else{
            
            if (self.mutableArray.count>0) {
                
            //    NSLog(@" %ld",(long)indexPath.row);
                cell.detailTextLabel.text = self.mutableArray[indexPath.row];
                
                 //  NSLog(@" %@",self.mutableArray[indexPath.row]);
                
            }
            
          //  cell.detailTextLabel.text = self.mutableArray[indexPath.row];
            
        }
        
        cell.textLabel.text = self.bacionearrayCont[indexPath.row];
     //   cell.selectionStyle = UITableViewCellSelectionStyleBlue;
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        
    }else if (indexPath.section ==1){
        
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.text = self.bacitwoarrayCont[indexPath.row];
        cell.detailTextLabel.text = @"";
    }else if(indexPath.section==2){
        
       
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.textLabel.text = self.baciarrayCont[indexPath.row];
        
        if (self.mutableArray.count>0) {
           cell.detailTextLabel.text = self.mutableArray[7+indexPath.row];
            
        }
        
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;

    
    
    
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        
        cell.separatorInset = UIEdgeInsetsZero;
    }else if ([cell respondsToSelector:@selector(setLayoutMargins:)]){
        
        cell.layoutMargins = UIEdgeInsetsZero;
    }
    
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row==0 && indexPath.section==0) {
        [self addPhoto];
    }else if ( indexPath.section==1){
        
        if (indexPath.row==0) {
            [self.navigationController pushViewController:[RetrievethepasswordViewController new] animated:YES];
            
        }else{
            BasicDataViewController * basic =       [BasicDataViewController new];
            basic.array = self.mutableArray;
        [self.navigationController pushViewController:basic animated:YES];
        }
        
        
      
    }
    NSLog(@"点击");
}
-(void)addPhoto{
    
    __weak typeof(self) myself = self;
    [self showCanEdit:YES photo:^(UIImage *photo) {
#warning 上传
        
     ///   [myself.photoarray addObject:photo];
     //   for (int i = 0; i<myself.photoarray.count; i++) {
         //   UIImageView * imageVi = [[UIImageView alloc]init];
            
        //    imageVi.frame = CGRectMake(CGRectGetMaxX(_imagelabel.frame)+4+i*40, _imagelabel.y, 40, 40);
            
          //  imageVi.image = myself.photoarray[i];
            
        //    imageVi.userInteractionEnabled = YES;
        myself.iconImageView.image = photo;
          //  imageVi.tag = i+100;
//            //对象
//            NSNumber * nu =[NSNumber numberWithInteger:imageVi.tag];
//            
//         //   [myself.photocount addObject:nu];
//            
//            UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:myself action:@selector(tap:)];
//            
//            tap.numberOfTapsRequired =1;
//            
//            tap.numberOfTouchesRequired =1;
//            
//            [imageVi addGestureRecognizer:tap];
//            
//            [myself.view addSubview:imageVi];
//            
//        }
        
    }];
    
    
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
