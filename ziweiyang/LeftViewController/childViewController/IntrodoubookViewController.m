//
//  IntrodoubookViewController.m
//  ziweiyang
//
//  Created by bidiao on 2017/10/25.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import "IntrodoubookViewController.h"

//#import <WebKit/WebKit.h>

@interface IntrodoubookViewController ()<UIScrollViewDelegate>
@property(nonatomic,strong) UIScrollView * scrollView;
//@property(nonatomic,strong) WKWebView * wkwebView;
@property(nonatomic,weak) UILabel * lable;
//@property(nonatomic,strong) NSString * thml;
@end
#define fontColor(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]

@implementation IntrodoubookViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self addView];
    
    UIImageView * imageView = [[UIImageView alloc]init];
    
    imageView.frame = self.view.frame;
    
    [self.view insertSubview:imageView atIndex:0 ];
    
    imageView.image = [UIImage imageNamed:@"bgPattern"];
    
  //  [self addwork];
    
   // [self addwebView];
    // Do any additional setup after loading the view.
}
-(void)addwebView{
//    self.wkwebView  =  [[WKWebView alloc]initWithFrame:self.view.frame configuration:[WKWebViewConfiguration new]];
//    NSString * path = [[NSBundle mainBundle] pathForResource:@"company" ofType:@"html"];
//
//    NSString *htmlString = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
//
//    NSString *basePath = [[NSBundle mainBundle] bundlePath];
//
//    NSURL *baseURL = [NSURL fileURLWithPath:basePath];
//
    //  [self.webView loadHTMLString:htmlString baseURL:baseURL];
    
    //  [self.view addSubview:self.webView];
    
    
  
    
    
    
    
}
-(void)addwork{
   
//
//    NSString *string = @"https://www.ziweiyang.com/api_about_book.php/?lang=3&token=";
//    AFHTTPSessionManager * mgr = [[AFHTTPSessionManager alloc]init];
//
//
//    [mgr POST:string parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//
//        //NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:responseObject options: NSJSONReadingAllowFragments error:nil];
//        NSLog(@"fdfafsf %@",responseObject);
//
//        NSArray * arr = responseObject[@"data_list"];
//
//        NSArray * arr2 = arr[0];
//
//       // NSArray * arrr =arr[1];
//
//        NSDictionary * diat = arr2[0];
//
//        //NSDictionary * diat1 = arrr[0];
//
//        NSString * d = diat[@"detail"];
//       // NSString * b =diat1[@"detail"];
//
//        NSString * a = [NSString stringWithFormat:@"<html><meta charset = \"UTF-8\"  content = \"text/html\"><head></head><body>%@</body></html>",d];
//
//        dispatch_async(dispatch_get_main_queue(), ^{
//
//            [self.wkwebView loadHTMLString:a baseURL:nil];
//
//            [self.view addSubview:self.wkwebView];
//
//
//
//        });
        //NSString  * a = [self logDic:diat];
    
        //NSLog(@"的说法 %@sfsfbb",d);
         // NSLog(@"的afs说法 %@",b);
        
        
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//
//        NSLog(@" 66 %@",error);
//
//    }];
    
    
    
}

-(void)addView{
    
    NSArray * title = @[@"『紫微径』",@"『紫微闲话』",@"『术数述异』",@"『紫微新语』",@"『清室气数录』",@"『天网搜奇录』",@"『蕉窗传灯录』",@"『玄空纪异录』",@"『燃犀日知录』"];
    
    NSArray* content = @[@"紫微杨所着《紫微径》出版不到一个月，初版三千本便卖光再版。在这当时市道不好的香港图书市场，不禁令人啧啧称奇。《紫微径》虽是一部涉及术数的书，但作者信手拈来，深入浅出，箇中不乏人生哲理，趣味盎然。\n  《紫微径》的内容，绝大部分是出自作者于二零零七年为《苹果日报》撰写的同名专栏。此书包含的术数范围广泛，既有八字、紫微斗数、玄空风水、铁板神数、六壬数，更有奇门遁甲，其中「奇门遁甲」的篇章更是作者研究了颇长时间而又极少谈及的一门术数。作者耗用了两年多的时间，全力在文字上熷删润饰，从术数观看世界，论尽人生。作者搁笔逾十年，读者渴望多时，今在晚年出版《紫微径》，堪称难得佳作。",@"借斗数谈人生，以玄学说世情，从实际生活阐述斗数要义，深入浅出，言简意赅，蕴含无穷人生智慧。",@"搜罗风水术数奇闻异事，每个故事背后，均隐含风水学及各门术数之玄机，令你拍案惊奇﹗ 人生的祸福起跌、人与人之间的缘聚缘散，一切似有定数，在惊叹风水术数神妙之余，亦让你深思生命之奥义。",@"本书是《紫微闲话》的续篇，作者紫微杨继续从命理看世情，借斗数论人生。",@"《清室气数录》是紫微斗数大师紫微杨所着， 该书从风水命理的角度讲述清代歷史，从每一位皇帝的星盘入手，运用紫微斗数的专业理论，为各个皇帝算命，歷数每个皇帝的成败兴衰。",@"「天网恢恢、疏而不漏」——人生存在天网之下，天下之间，什么事都有因有果。因果关系，可以用「数」算出来。搜罗中国术数众多门派，如铁板神数、紫微斗数、子平命理、河洛理数、太乙神数、奇门遁甲、六壬数、易卦、风水学及掌相等独到及传奇之处，一窥各大门派的堂奥。",@"古人认为蕉树最易招惹鬼物，如在荒冢野坟附近种有蕉树，夜间再出现萤火虫群飞，有人觉得这样的景象很诡异﹔但亦有人认为荒冢是另一世界，月下蕉影移动，群萤飞舞，有若宫人传灯，是一幕瑰丽的夜景。两者皆是人的主观，视乎你当时的心态而已。本书结集多个近似聊斋的故事而成，题材上较为侧重玄空学方面，对喜欢钻研玄空学的读者会有一定的帮助。其中有些诡异的地方，在术数上可作解释及详细论述。",@"常言道﹕「天有不测风云，人有霎时祸福。」在当今科学发达时代，风云变幻皆可预测，准绳度每每奇高。术数，就像用来探测气象的工具，擅于掌握者，对人的祸福每能瞭如指掌。更可以达到转祸为福、趋吉避凶的研习术数最高境界。\n有人说一个人一生命运的好坏，关乎「一命、二运、三风水、四积阴德、五读书」﹔有人更说因为「一坟、二命」所致，祖先墓穴风水是「因」，后代子孙飞黄腾达是 「果」。后天风水就可补救不甚佳之「果」，本书以四个奇情风水术数故事去纪录及分析当中极为成功又使人讶异的个案。但正如《飞星赋》所云﹕「人为天地之心，凶吉原堪自主。」也强调「心」始终是最重要。",@"相传有一种最简单而能看见妖异的方法，就是燃烧犀角可以照妖，即「犀照」也，一些无法凭人的智慧去解释或解决之事，由此得到启示。本书记载一些不可思议的个案，既有业术数者的遭遇，亦有精于术数却百思不得其解者，读者不妨一同参详，或者只有你才可知道箇中奥妙。"];
    
    //NSArray * imge =@[]
    NSString * path = [[NSBundle mainBundle] pathForResource:@"image" ofType:@"plist"];
    
    NSArray * imgaArray = [NSArray arrayWithContentsOfFile:path];
    
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-60)];
    
    self.scrollView.showsVerticalScrollIndicator = YES;
    
    self.scrollView.backgroundColor = [UIColor yellowColor];
    
    self.scrollView.delegate = self;
   // CGFloat  w = self.view.frame.size.width/2-self.view.frame.size.width/4;
//    CGFloat x =
    self.scrollView.contentSize = CGSizeMake(0, 2*self.view.frame.size.height);
    
   // SDImageCache *canche = [SDImageCache sharedImageCache];
    
[[SDWebImageDownloader sharedDownloader] setShouldDecompressImages:NO];
    for (int i=1; i<title.count+1; i++) {
        
        if (i%2 ==0) {
            
        [self addImageImag:imgaArray[i-1] imagx:self.view.frame.size.width*3/4-10 cmay:CGRectGetMaxY(self.lable.frame)+30 titlelabe:title[i-1] cont:content[i-1]];
        }else{
            
            
            
        [self addImageImag:imgaArray[i-1] imagx:20 cmay:CGRectGetMaxY(self.lable.frame)+30 titlelabe:title[i-1] cont:content[i-1]];
            
            
        }
        
        
        
        
    }
    
     self.scrollView.contentSize = CGSizeMake(0, CGRectGetMaxY(self.lable.frame)+70);
   // [self addImageImag:@"" imagx:10 cmay:10 titlelabe:@"紫薇经" cont:@"是连接方式绿山咖啡了圣诞节佛违反了深刻的发生的纠纷绿色减肥索拉卡的减肥了圣诞节老师的开发就了圣诞节否二姐夫莱克斯顿金佛IE我就疯了是肯德基藕丝"];
    
    
    [self.view addSubview:self.scrollView];
    
    self.scrollView.backgroundColor = [UIColor clearColor];
    
    
    
}
-(void)addImageImag:(NSString*)image imagx:(CGFloat)x cmay:(CGFloat)y  titlelabe:(NSString*)titilt  cont:(NSString*)contString{
    
    
    
    
    UIImageView * imageView =[[UIImageView alloc]init];
    
    CGFloat  w = self.view.frame.size.width/2-self.view.frame.size.width/4;
    
    [imageView sd_setImageWithURL:[NSURL URLWithString:image]];
   // imageView.image = [UIImage imageNamed:image];
    
    CGFloat  h =  self.view.frame.size.width*3/8-40;
    
    imageView.frame = CGRectMake(x, y, w, h);
   // imageView.backgroundColor = [UIColor redColor];
    
    
    
    [self.scrollView addSubview:imageView];
    
    UILabel * tltlelable = [[UILabel alloc]init];
    
    tltlelable.text = titilt;
    
    tltlelable.textColor =  fontColor(139,94,145);
  
    tltlelable.frame = CGRectMake(10, CGRectGetMaxY(imageView.frame)+10, self.view.frame.size.width, self.view.frame.size.width/8);
    
    tltlelable.textAlignment= NSTextAlignmentLeft;
    
    [self.scrollView addSubview:tltlelable];
    
    UILabel * contlable = [[UILabel alloc]init];
    
    contlable.text = contString;
    
    CGSize maximumLabelSize = CGSizeMake(self.view.frame.size.width-20, MAXFLOAT);
    
    contlable.lineBreakMode = NSLineBreakByTruncatingTail;
    
     contlable.numberOfLines= 0;
    
    CGSize size = [contlable sizeThatFits:maximumLabelSize];
    
    contlable.frame = CGRectMake(10, CGRectGetMaxY(tltlelable.frame)+10, size.width, size.height);
    
    self.lable = contlable;
    
    [self.scrollView addSubview:contlable];
    
    
}
//-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
//
//    CGFloat height = scrollView.frame.size.height;
//
//    CGFloat contentYoffest = scrollView.contentOffset.y;
//
//    CGFloat  disatc = scrollView.contentSize.height - contentYoffest;
//
//    if (disatc<height) {
//
//    }
//
//
//
//
//}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
  //  CGPoint offset = scrollView.contentOffset;//scrollview当前显示区域定点相对于fram顶点的偏移量
  //  CGRect bounds = scrollView.bounds;//原点
  //  CGSize size = scrollView.contentSize;//scrollview可以滚动的区域
  //  UIEdgeInsets inset = scrollView.contentInset;//scrollview的contentview的顶点相对于scrollview的位置
   // CGFloat currentOffset = offset.y + bounds.size.height - inset.bottom;
    //CGFloat maximumOffset = size.height;
    //currentOffset与maximumOffset的值相等时，说明scrollview已经滑到底部了，即偏移量达到最大值
//    if (offset.y <= 0) {
//       // DLog(@"滑到顶部");
//      //  scrollView.contentOffset = CGPointMake(0, 0);
//       // return;
//    }
//    if (currentOffset >= maximumOffset) {
//       // DLog(@"滑到底部");
//                scrollView.contentOffset = CGPointMake(0, bounds.size.height - offset.y);
//              //  return;
//    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    [[SDImageCache sharedImageCache] setValue:nil forKey:@"memCache"];
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
