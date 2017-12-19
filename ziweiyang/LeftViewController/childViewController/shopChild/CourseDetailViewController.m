//
//  CourseDetailViewController.m
//  ziweiyang
//
//  Created by bidiao on 2017/11/29.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import "CourseDetailViewController.h"
#import <WebKit/WebKit.h>
#import "CoursecontModel.h"
@interface CourseDetailViewController ()<WKUIDelegate,WKNavigationDelegate>
@property(nonatomic,strong) WKWebView * webView;
@property(nonatomic,strong) MBProgressHUD * hup;
@property(nonatomic,weak) UIButton * addButton;
@property(nonatomic,weak) UIButton * prevButton;
@end

@implementation CourseDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   
    
    self.title = @"课程内容";
    
    CoursecontModel * model = self.array[self.indext];
    
    NSString * ab = [model.detail stringByReplacingOccurrencesOfString:@"&#34;" withString:@"\""];
    
   
    NSString * a = [NSString stringWithFormat:@"<html><meta charset = \"UTF-8\"  content = \"text/html\"><meta name=\"viewport\" content=\"width=device-width; initial-scale=1; user-scalable=no\"><head><style type=\"text/css\">body {font-size:18px !important;background-image: url('ziweiyang/html/img/bgPattern.jpg'); background-repeat: repeat;background:#FCF9E7;} p{text-align: center;}</style></head><body font－size:18px ;> <p>%@</p><p>%@</p><br/>%@</body></html>",model.page_section,model.page_section2,ab];
    
    WKWebViewConfiguration * cont = [[WKWebViewConfiguration alloc]init];
    self.webView = [[WKWebView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 120-kNaHeight) configuration:cont];
    
    self.webView.scrollView.showsHorizontalScrollIndicator = NO;
    self.webView.scrollView.showsVerticalScrollIndicator = NO;
    
    self.webView.UIDelegate = self;
    
    self.webView.navigationDelegate = self;
    
   
     [self.view addSubview:self.webView];
    
    self.hup = [MBProgressHUD showHUDAddedTo:self.webView animated:YES];
    
    self.hup.label.text = @"加载中";
    
    self.hup.backgroundView.backgroundColor = [UIColor whiteColor];
    
    
    
    UIView * footView = [[UIView alloc]init];
    
    
    footView.frame = CGRectMake(0, CGRectGetMaxY(self.webView.frame), self.view.width, 60);
    
    footView.backgroundColor =fontColor(230, 224, 194);
    
    UIButton * addButton = [[UIButton alloc]init];
    
    addButton.frame =CGRectMake(self.view.width/2+20, 5, 40, 40);
    
    self.addButton = addButton;
    
    [addButton setImage:[UIImage imageNamed:@"cal_next"] forState:UIControlStateNormal];
   // [addButton setTitle:@"加油" forState:UIControlStateNormal ];
    
    [addButton addTarget:self action:@selector(next) forControlEvents:UIControlEventTouchUpInside];
   // [self performSelector:@selector(addButton.en) withObject:nil afterDelay:1.0f]
    
    [footView addSubview:addButton];
    
    
    UIButton * prevButton = [[UIButton alloc]init];
    
     prevButton.frame =CGRectMake(self.view.width/2-60, 5, 40, 40);
    
    self.prevButton = prevButton;
    [ prevButton setImage:[UIImage imageNamed:@"cal_prev"] forState:UIControlStateNormal];
    // [addButton setTitle:@"加油" forState:UIControlStateNormal ];
    
    [prevButton  addTarget:self action:@selector(prev) forControlEvents:UIControlEventTouchUpInside];
    
    [footView addSubview:prevButton ];
    
    
    
    
    
    [self.view addSubview:footView];
    
    [self.webView loadHTMLString:a baseURL:[NSURL URLWithString:@"https://www.ziweiyang.com/"]];
    
   
   
   
    
  // [self.view addSubview:self.webView];
    
    // Do any additional setup after loading the view.
}

-(void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{
    
    NSLog(@"开始");
}

-(void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    
    [self.hup hideAnimated:YES];
    
    NSLog(@"结束");
}
-(void)prev{
    
    
    CoursecontModel * modela = self.array[self.indext];
    //加载数据
    if ([modela.next_page integerValue]>=[modela.total_page integerValue]) {
        
        self.addButton.userInteractionEnabled = YES;
        
        self.addButton.alpha = 1;
        
        
        
    }
    if (self.indext<1) {
        
        self.prevButton.userInteractionEnabled = NO;
        self.prevButton.alpha = 0.3;
        return;
    }
    self.indext = self.indext-1;
    CoursecontModel * model = self.array[self.indext];
     [self addModelViewsection:model.page_section section2:model.page_section2 detail:model.detail];
    
}
-(void)next{
    // CoursecontModel * model = self.array[self.indext];
   // NSLog(@" %ldfiiiiii %@",self.array.count,model.next_page);
    if (self.indext<1) {
        self.prevButton.userInteractionEnabled = YES;
        self.prevButton.alpha = 1;
    }
    
    if (self.indext==self.array.count-1) {
        
            CoursecontModel * model = self.array[self.indext];
        //加载数据
        if ([model.next_page integerValue]<[model.total_page integerValue]) {
            
            self.addButton.userInteractionEnabled = NO;
            self.prevButton.userInteractionEnabled = NO;
            
           // self.addButton.alpha = 0.3;
            //加载网络
            NSLog(@"加载");
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                
              self.addButton.userInteractionEnabled = YES;
         });
           // [self addwork:[model.next_page intValue] detailid:self.idbook];
        }else{
           // mySelf.addButton.alpha = 1;
            self.addButton.userInteractionEnabled = NO;
            //self.prevButton.userInteractionEnabled = YES;
            
             self.addButton.alpha = 0.3;
            return;
        }
        
        
    }else{
        
        
        self.indext = self.indext+1;
        
        CoursecontModel * model = self.array[self.indext];
        
        [self addModelViewsection:model.page_section section2:model.page_section2 detail:model.detail];
        
        NSLog(@"加");
        
    }

    
    
    
    
    
}
-(void)addwork:(int)page detailid:(NSString*)idbook{
    
#warning token 用户名
    NSString * string =[NSString stringWithFormat: @"%@api_get_ebook_detail.php?recordperpage=10&page=%d&id=%@&username=bigmeo2013@gmail.com&token=PbE1JtK0xLrIK74U4GF0&active=&lang=3",AppNetWork_Post,page,idbook];
    
    __weak typeof (self) mySelf = self;
    [NeworkViewModel POST:string parameters:nil completionHandler:^(id responsObj, NSError *or) {
        
        
        NSArray *courArray =  [CoursecontModel addModel:responsObj ];
        
        
        if (courArray.count==0) {
            
           // mySelf.page--;
            return ;
        }
        
        
        [mySelf.array addObjectsFromArray:courArray];
        
        dispatch_async(dispatch_get_main_queue(), ^{
          //  [mySelf.tableView reloadData];
            mySelf.indext = mySelf.indext+1;
            
            CoursecontModel * model = mySelf.array[mySelf.indext];
          //  NSLog(@"jjjjj");
            [mySelf addModelViewsection:model.page_section section2:model.page_section2 detail:model.detail];
            
            mySelf.addButton.userInteractionEnabled = YES;
            
            mySelf.prevButton.userInteractionEnabled = YES;
            
            
        });
        
        if (or) {
            
            mySelf.addButton.userInteractionEnabled = YES;
            mySelf.prevButton.userInteractionEnabled = YES;
            
        }
        
        
    }];
    
    
    
}
-(void)addModelViewsection:(NSString*)page_section section2:(NSString*)pageSection2 detail:(NSString*)detail{
    
    
    NSString * ab = [detail stringByReplacingOccurrencesOfString:@"&#34;" withString:@"\""];
    
    //NSLog(@" %ldfiiiiii %@",self.array.count,model.next_page);
    
    
    NSString * a = [NSString stringWithFormat:@"<html><meta charset = \"UTF-8\"  content = \"text/html\"><meta name=\"viewport\" content=\"width=device-width; initial-scale=1; user-scalable=no\"><head><style type=\"text/css\">body {font-size:18px !important;background-image: url('ziweiyang/html/img/bgPattern.jpg'); background-repeat: repeat;background:#FCF9E7;} p{text-align: center;}</style></head><body font－size:18px ;> <p>%@</p><p>%@</p><br/>%@</body></html>",page_section,pageSection2,ab];
    
    
    [self.webView loadHTMLString:a baseURL:[NSURL URLWithString:@"https://www.ziweiyang.com/"]];
    
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
