//
//  PhysicachildernViewController.m
//  ziweiyang
//
//  Created by bidiao on 2017/11/22.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import "PhysicachildernViewController.h"
#import "PhysCollectionViewCell.h"
@interface PhysicachildernViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,weak) UILabel * shulianglabel;

@property(nonatomic,assign) int shuliang;
@property(nonatomic,weak) UIImageView * imageView;
#define fontColor(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]

@property(nonatomic,strong) NSArray * array;
@end

@implementation PhysicachildernViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addView];
    self.view.backgroundColor = fontColor(66, 66, 64);
    //  self.title = @"课程资料";
    
    UIColor *red = [UIColor redColor];
    UIColor *yellow = [UIColor yellowColor];
    UIColor *green = [UIColor greenColor];
    UIColor *orga = [UIColor orangeColor];
    UIColor *pur = [UIColor purpleColor];
    UIColor *bule = [UIColor blueColor];
    
    self.array = @[red,yellow,green,orga,pur,bule];
    self.navigationController.title = @"商品详情";
    // Do any additional setup after loading the view.
}

-(void)addView{
    
    UIScrollView * scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height-60)];
    
    [self.view addSubview:scrollView];
    
    
    
    UIImageView * imageView = [UIImageView new];
    
    imageView.frame = CGRectMake(10, 15, self.view.width/2-20, self.view.height*1.5/5+20);
    
    imageView.centerX = self.view.centerX;
    
    [scrollView addSubview:imageView];
    
    //NSString * string = @"https://www.ziweiyang.com/";
    
    imageView.backgroundColor = [UIColor redColor];
   // [imageView sd_setImageWithURL:[NSURL URLWithString:[string stringByAppendingString:self.model.imagebook]]];
    
    // imageView.image = [UIImage imageNamed:@"book"];
    self.imageView = imageView;
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
    
    layout.itemSize = CGSizeMake(imageView.width/3, imageView.height/3);
    
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    layout.minimumLineSpacing =15;
    //layout.minimumInteritemSpacing =100;
    
    UICollectionView * collection = [[UICollectionView alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(imageView.frame)+10, self.view.width-20, imageView.height/3+10) collectionViewLayout:layout];
    
    collection.backgroundColor = [UIColor clearColor];
    collection.delegate = self;
    
    collection.dataSource = self;
    
    
    [collection registerClass:[PhysCollectionViewCell class] forCellWithReuseIdentifier:@"cellID"];

    [scrollView addSubview:collection];
    
    
    
    UILabel * namlable = [[UILabel alloc]init];
    
    namlable.frame = CGRectMake(10, CGRectGetMaxY(collection.frame)+10, self.view.width-10, 30);
    
    //namlable.text = [NSString stringWithFormat:@"课程名称: %@",self.model.namebook];
    namlable.text = @"双天使风铃";
    
    namlable.textColor = [UIColor whiteColor];
    
    [scrollView addSubview:namlable];
    
  //  UILabel * dateLable = [[UILabel alloc]init];
    
  //  dateLable.frame = CGRectMake(10, CGRectGetMaxY(namlable.frame)+10, self.view.width-10, 40);
    
  //  dateLable.text =  [NSString stringWithFormat:@"上传时间: %@",self.model.datebook];
    
   // dateLable.textColor = [UIColor whiteColor];
    
   // [scrollView addSubview:dateLable];
    
    
    UILabel *kecheng = [[UILabel alloc]init];
    
    kecheng.frame = CGRectMake(10, CGRectGetMaxY(namlable.frame)+10, 80, 30);
    
    kecheng.text = @"简介:";
    
    kecheng.textColor = [UIColor whiteColor];
    
    [scrollView addSubview:kecheng];
    
    UILabel * neirong = [[UILabel alloc]init];
    
    neirong.text = @"双点卡服我就饿哦就我发";
    
    CGSize maximunLabsize = CGSizeMake(self.view.width-kecheng.width-10-30, MAXFLOAT);
    
    neirong.textColor = [UIColor whiteColor];
    
    neirong.numberOfLines = 0;
    
    neirong.adjustsFontSizeToFitWidth = YES;
    
    neirong.lineBreakMode = NSLineBreakByTruncatingTail;
    
    
    CGSize size = [neirong sizeThatFits:maximunLabsize];
    
    
    
    neirong.frame = CGRectMake(CGRectGetMaxX(kecheng.frame)+1,CGRectGetMaxY(namlable.frame)+20 , size.width, size.height);
    
    [scrollView addSubview:neirong];
    
    
    UILabel *bianhao = [[UILabel alloc]init];
    
    bianhao.frame = CGRectMake(10, CGRectGetMaxY(neirong.frame)+10, self.view.width/2, 30);
    
    bianhao.text = @"编号:是否胜多负少沙发沙发";
    
    bianhao.textColor = [UIColor whiteColor];
    
    [scrollView addSubview:bianhao];
    
    
    UILabel *jingzhon = [[UILabel alloc]init];
    
    jingzhon.frame = CGRectMake(10, CGRectGetMaxY(bianhao.frame)+10, self.view.width/2, 30);
    
    jingzhon.text = @"净重:是否胜多负少沙发沙发";
    
    jingzhon.textColor = [UIColor whiteColor];
    
    [scrollView addSubview:jingzhon];
    
    UILabel *huiyuan = [[UILabel alloc]init];
    
    huiyuan.frame = CGRectMake(10, CGRectGetMaxY(jingzhon.frame)+10, self.view.width/2, 30);
    
    huiyuan.text = @"会员:是否胜多负少沙发沙发";
    
    huiyuan.textColor = [UIColor whiteColor];
    
    [scrollView addSubview:huiyuan];
    
    
    UILabel *shuliang = [[UILabel alloc]init];
    
   shuliang.frame = CGRectMake(10, CGRectGetMaxY(huiyuan.frame)+10, 100, 30);
    
    shuliang.text =  [NSString stringWithFormat:@"数量   %d",self.shuliang];
    self.shulianglabel = shuliang;
   
    shuliang.textColor = [UIColor whiteColor];
    
    [scrollView addSubview:shuliang];
    
    UIButton * addbutton =[[UIButton alloc]init];
    
    addbutton.frame =CGRectMake(CGRectGetMaxX(shuliang.frame)+5, CGRectGetMaxY(huiyuan.frame)+20, 30, 30);
    [addbutton addTarget:self action:@selector(add:) forControlEvents:UIControlEventTouchUpInside];
    
    [addbutton setBackgroundImage:[UIImage imageNamed:@"addBtn"] forState:UIControlStateNormal];
    
   
   
    [scrollView addSubview:addbutton];
   
    UIButton * reductionbutton =[[UIButton alloc]init];
    
    reductionbutton.frame =CGRectMake(CGRectGetMaxX(addbutton.frame)+5, CGRectGetMaxY(huiyuan.frame)+20, 30, 30);
    
    [reductionbutton addTarget:self action:@selector(reduction:) forControlEvents:UIControlEventTouchUpInside];
    
  
   
    [scrollView addSubview:reductionbutton];
    
    [reductionbutton setBackgroundImage:[UIImage imageNamed:@"subtractBtn"] forState:UIControlStateNormal];
    
    
    
    UIButton * button = [[UIButton alloc]init];
    
    button.frame =CGRectMake(CGRectGetMaxX(kecheng.frame)-30, CGRectGetMaxY(addbutton.frame)+10, self.view.width-100, 30);
    
    [button addTarget:self action:@selector(clickback) forControlEvents:UIControlEventTouchUpInside];
    
    [button setBackgroundImage:[UIImage imageNamed:@"readBtn_course"] forState:UIControlStateNormal];
    
    [scrollView addSubview:button];
    
    scrollView.contentSize = CGSizeMake(self.view.width, CGRectGetMaxY(button.frame)+40);
}
-(void)add:(UIButton*)btn{
    //NSLog(@"加");
    self.shuliang++;
  self.shulianglabel.text =[NSString stringWithFormat:@"数量:      %d",self.shuliang];
    
}
-(void)reduction:(UIButton*)btn{
    
    self.shuliang--;
    if (self.shuliang<0) {
        
        self.shuliang  = 0;
        return;
    }
    self.shulianglabel.text =[NSString stringWithFormat:@"数量:      %d",self.shuliang];
    
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.array.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    PhysCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellID" forIndexPath:indexPath ];
    
    if (!cell) {
       cell = [[PhysCollectionViewCell alloc]init];
    }
    
    
    cell.backgroundColor =self.array[indexPath.row];
    return cell;
    
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    self.imageView.backgroundColor = self.array[indexPath.row];
    //NSLog(@"点击");
    
}
-(void)clickback{
    
    
    
    //[self.navigationController pushViewController:[CoursecontentViewController new] animated:YES];
    
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
