//
//  HotChildViewController.m
//  ziweiyang
//
//  Created by bidiao on 2017/11/13.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import "HotChildViewController.h"
#import "HotChiledTableViewCell.h"
#import "BBCReplyViewController.h"
#import "SDAutoLayout.h"
#import "UITableView+SDAutoTableViewCellHeight.h"
#import "BBSModel.h"

#import <Social/Social.h>

#import "YBPopupMenu.h"
@interface HotChildViewController ()<UITableViewDelegate,UITableViewDataSource,YBPopupMenuDelegate>
@property(nonatomic,strong) UITableView * tableView;
@property(nonatomic,strong) NSArray * abAray;
@property(nonatomic,strong) NSMutableArray * mutableArrat;
@property(nonatomic,strong) MBProgressHUD * hup;
@property(nonatomic,assign) int page;

@property(nonatomic,assign) NSInteger index;
#define fontColor(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define kNaHeight ([[UIApplication sharedApplication] statusBarFrame].size.height>20?20:0)
#define DefinmySelf __weak typeof(self) mySelf = self

#define path [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]
@end

@implementation HotChildViewController

-(NSMutableArray *)mutableArrat {
    if (!_mutableArrat) {
        _mutableArrat = [NSMutableArray array];
    }
    
    return _mutableArrat;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.page = 1;
    UIImageView * imageView = [[UIImageView alloc]init];
    
    imageView.frame = self.view.frame;
    
    [self.view insertSubview:imageView atIndex:0 ];
    
    imageView.image = [UIImage imageNamed:@"bgPattern"];
    [self addtableView];
    
    self.hup = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    self.hup.label.text = @"加载中";
    
    self.hup.backgroundView.backgroundColor = [UIColor whiteColor];
    
    [self addwork];
    
    
    

}

-(void)addwork{
    
    
  //  NSString * string = [NSString stringWithFormat:@"https://www.ziweiyang.com/api_get_forum.php?id=%@ &token=&active=",self.page];
    
    NSString *string =[NSString stringWithFormat:@"%@api_get_forum_reply.php?recordperpage=8&page=%d&sortby=&username=&token=&s=&lang=3&forum_id=%@",AppNetWork_Post,self.page,self.formid];
    //NSLog(@"%@",self.page);
  //  __weak typeof(self) mySelf = self;
    DefinmySelf;
    [ NeworkViewModel POST:string parameters:nil completionHandler:^(id responsObj, NSError *or) {
        
        NSArray * modearry = [BBSModel addBBChildSomeModel: responsObj imageString:mySelf.model.nameimageString tieimage:@"forum_content" model:mySelf.model];
        
        if (modearry.count==0) {
           
            mySelf.page--;
            return ;
        }
    
        
        [mySelf.mutableArrat addObjectsFromArray:modearry];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            //NSLog(@"gdlksdjf %lud",(unsigned long)mySelf.mutableArrat.count);
            [mySelf.tableView reloadData];
            [mySelf.hup hideAnimated:YES];
            
            [mySelf addaddMJrefresh];
            
        });
        
        if(or){
            
            NSLog(@"失败 %@",or);
            
        }
        
    }];
}
-(void)addaddMJrefresh{
    
    DefinmySelf;
    MJRefreshAutoNormalFooter * footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:mySelf refreshingAction:@selector(handeloadMore)];
    
    
   // self.tableView.mj_footer = footer;
    
    
    [footer setTitle:@"正在详细加载" forState:MJRefreshStateIdle];
    
    [footer setTitle:@"正在加载" forState:MJRefreshStatePulling];
    
    [footer setTitle:@"加载中" forState:MJRefreshStateRefreshing];
    
    
    
    
    
}
-(void)handeloadMore{
    
    self.page++;
    [self.tableView.mj_footer endRefreshing];
    [self addwork];
    
}
-(void)addtableView{
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-130) style:UITableViewStylePlain];
    
    self.tableView.delegate = self;
    
    self.tableView.dataSource = self;
    
    [self.view addSubview:self.tableView];
    _tableView.estimatedRowHeight = 0;
    //_tableView.estimatedSectionHeaderHeight = 0;
   // _tableView.estimatedSectionFooterHeight = 0;
  
    self.tableView.backgroundColor = [UIColor clearColor];
    
    UIView * dibuview = [[UIView alloc]init];
    
    dibuview.frame = CGRectMake(0, self.view.frame.size.height-110-kNaHeight, self.view.frame.size.width, 50);
    
    dibuview.backgroundColor = fontColor(239, 227, 197);
    
    [self.view addSubview:dibuview];
    
    UIButton * replacebutton = [[UIButton alloc]init];
    
    replacebutton.frame = CGRectMake(self.view.frame.size.width/2+30, 5, self.view.frame.size.width/4, 40);
    
    [dibuview addSubview:replacebutton];
    
    [replacebutton setTitle:@"回復" forState:UIControlStateNormal];
    
    [replacebutton setBackgroundImage:[UIImage imageNamed:@"padding"] forState:UIControlStateNormal];
    
    [replacebutton addTarget:self action:@selector(clickreplace) forControlEvents:UIControlEventTouchUpInside];
    
     [replacebutton setTitleColor:fontColor(121, 101, 66) forState:UIControlStateNormal];
    
}
-(void)clickreplace{
    
    [self.navigationController pushViewController:[BBCReplyViewController new] animated:YES];
    NSLog(@"跳轉");
}
//-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//
//
//    NSLog(@"%ld",(long)section);
//
//    UIView * view = [[UIView alloc]init];
//
//    view.frame = CGRectMake(0, 0, self.view.frame.size.width, 40);
//
//    view.backgroundColor = [UIColor redColor];
//
//    return view;
//
//}
//-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//
//    return 40;
//}
//-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//
//    return 20;
//}
//}-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
//
//
//    return self.abAray[section];
//}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.mutableArrat.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //[NSString stringWithFormat:@"%ldcell",indexPath.row]
  static  NSString * ID = @"cell";
    
    
    HotChiledTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[HotChiledTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    
//    else//当页面拉动的时候 当cell存在并且最后一个存在 把它进行删除就出来一个独特的cell我们在进行数据配置即可避免
//    {
//        while ([cell.contentView.subviews lastObject] != nil) {
//            [(UIView *)[cell.contentView.subviews lastObject] removeFromSuperview];
//        }
//        cell = [[HotChiledTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
//    }
//    
//    if([self.mutableArrat isKindOfClass:[NSMutableArray class]] && (self.mutableArrat.count > 0))
//    {
//        cell.bbmodel =self.abAray[indexPath.row];
//    }
    
   // cell.bbmodel = self.abAray[indexPath.row];
  //  cell.isCellone = NO;
    cell.didseletbutton.tag = indexPath.row+1000;
    cell.bbmodel = self.mutableArrat[indexPath.row];
   // cell.didseletbutton.backgroundColor =[UIColor redColor];
    [cell.didseletbutton addTarget:self action:@selector(shareback:) forControlEvents:UIControlEventTouchUpInside];
    if (indexPath.row==0) {
        //cell.imageSrccont = @"forum_content";
        cell.buttonimageString = @"fbShare";
        
      
        
         //cell.bbmodel = self.mutableArrat[indexPath.row];
    }else{
        
        
       // cell.isCellone = YES;
        
        // cell.bbmodel = self.mutableArrat[indexPath.row];
         cell.buttonimageString = @"downArrow";
       // cell.imageSrccont = nil;
    }
   
   [cell useCellFrameCacheWithIndexPath:indexPath tableView:tableView];
   // cell.textLabel.text = @"dk";
   // [cell us]
    
    
    return cell;

    
}

-(void)shareback:(UIButton*)btn{
    
    if (btn.tag==1000) {
       NSLog(@"分享foobk");
        //   [YBPopupMenu showRelyOnView:btn titles:@[@"引用",@""] icons:@[@"",@"fbShare"] menuWidth:100 delegate:self];
    }else{
        
        [YBPopupMenu showRelyOnView:btn titles:@[@"引用",@""] icons:@[@"",@"fbShare"] menuWidth:100 delegate:self];
        self.index = btn.tag-1000;
    }
    
    
    
}

-(void)ybPopupMenuDidSelectedAtIndex:(NSInteger)index ybPopupMenu:(YBPopupMenu *)ybPopupMenu{
    
    
    if (index==0) {
        
        BBCReplyViewController * reply = [BBCReplyViewController new];
        
        reply.bbmodel = self.mutableArrat[self.index];
        
        reply.index = self.index;
        [self.navigationController pushViewController:reply animated:YES];
    ///NSString * pate = [path stringByAppendingPathComponent:@"path.plist"];
        
        /// NSLog(@"点击了 %ld 选项",ybPopupMenu.tag);
     
    }
    
    
}
-(void)shareFacebook{
    
    
    //  NSLog(@"%@ %@ %@ %@ ",self.text1,self.text2,self.text3,self.text4);
    
    //NSLog(@"facebook");
    
    //1.判断平台是否可用
    if (![SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
        
        
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Facebook not installed or Not logged in." message:@"Your device has no Facebook installed or Not logged in" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        //[alert release];
        NSLog(@"平台不可用,或者没有配置相关的帐号");
        return;
    }
    
    // 2.创建分享的控制器
    SLComposeViewController *composeVc = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
    
    // 2.1.添加分享的文字
    //  [composeVc setInitialText:@"我是一个codeMan"];
    
    // 2.2.添加一个图片
  //  [composeVc addImage:self.image];
    
    // 2.3.添加一个分享的链接
    //  [composeVc addURL:[NSURL URLWithString:@"www.baidu.com"]];
    
    // 3.弹出分享控制器
    [self presentViewController:composeVc animated:YES completion:nil];
    //[[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:composeVc animated:YES completion:nil];
    // 4.监听用户点击了取消还是发送
    composeVc.completionHandler = ^(SLComposeViewControllerResult result) {
        if (result == SLComposeViewControllerResultCancelled) {
            // NSLog(@"点击了取消");
        } else {
            // NSLog(@"点击了发送");
        }
    };
    
    
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }else if ([cell respondsToSelector:@selector(setLayoutMargins:)]){
        
        
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    
    
    
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // >>>>>>>>>>>>>>>>>>>>> * cell自适应步骤2 * >>>>>>>>>>>>>>>>>>>>>>>>
    /* model 为模型实例， keyPath 为 model 的属性名，通过 kvc 统一赋值接口 */
    


    
    
    
    return [self.tableView cellHeightForIndexPath:indexPath model:self.mutableArrat[indexPath.row] keyPath:@"bbmodel" cellClass:[HotChiledTableViewCell class] contentViewWidth:[self cellContentViewWith]];
}
- (CGFloat)cellContentViewWith
{
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    
    // 适配ios7横屏
    if ([UIApplication sharedApplication].statusBarOrientation != UIInterfaceOrientationPortrait && [[UIDevice currentDevice].systemVersion floatValue] < 8) {
        width = [UIScreen mainScreen].bounds.size.height;
    }
    return width;
}-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
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
