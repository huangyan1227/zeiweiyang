//
//  HotChiledTableViewCell.m
//  ziweiyang
//
//  Created by bidiao on 2017/11/13.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import "HotChiledTableViewCell.h"

@implementation HotChiledTableViewCell
{
    UIView      *_zongview;
    UIImageView *_iconview;
    UILabel *_namelableview1;
    UILabel *_tianfulabeview2;
    UILabel *_datelableview3;
    UIImageView *_contimageview3;
    UILabel *_contlabelview4;
    UIView  * _bordview;
    UILabel * _titlelabel;
    UILabel * _tagtitleLabel;
    UILabel * _tagontleLabel;
    UIImageView * _contpholist;
}
#define fontColor(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        NSLog(@"ddd");
        [self setup];
        self.backgroundColor = [UIColor clearColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return self;
    
    
}
-(void)setup{
    
    
    UIView * zongView = [[UIView alloc]init];
    
    zongView.backgroundColor = fontColor(255, 248, 227);
    _zongview = zongView;
    
    UIImageView * iconmage = [UIImageView new];
    
    _iconview = iconmage;
    
   // iconmage.backgroundColor = [UIColor redColor];
    
    
    UILabel * namelabe = [UILabel new];
    
    _namelableview1 = namelabe;
    
   // namelabe.backgroundColor = [UIColor lightGrayColor];
    
    
    UILabel * titan = [UILabel new];
    
    //titan.backgroundColor = [UIColor grayColor];
    
    _tianfulabeview2 = titan;
    
    titan.textColor = fontColor(121, 62, 134);
    
    UILabel *datelable = [UILabel new];
    
   // datelable.backgroundColor =[UIColor orangeColor];
    
    _datelableview3 = datelable;
    
    UIButton * button  =[[UIButton alloc]init];
    
   
    
    self.didseletbutton = button;
    
    UIView * bord = [[UIView alloc]init];
    
    bord.backgroundColor = [UIColor lightGrayColor];
    
    _bordview = bord;
    
    UIImageView * contimage = [UIImageView new];
    
    _contimageview3 = contimage;
    
   // UILabel * titlelable = [UILabel new];
    
   // _titlelabel = titlelable;
    //contimage.backgroundColor =[UIColor blueColor ];
    
    UILabel * tagtitle = [[UILabel alloc]init];
    
    _tagtitleLabel = tagtitle;
    
    tagtitle.layer.borderWidth =1;
    
    tagtitle.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    
    
    tagtitle.adjustsFontSizeToFitWidth = YES;
    tagtitle.textColor =[UIColor lightGrayColor];
    
    UILabel * tagcontitle = [[UILabel alloc]init];
    
    _tagontleLabel = tagcontitle;
    
    tagcontitle.textColor =[UIColor lightGrayColor];
    tagcontitle.layer.borderWidth = 1;
    
    tagcontitle.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    
   // tagcontitle.font =[UIFont systemFontOfSize:11];
    tagcontitle.textAlignment =NSTextAlignmentCenter;
    tagcontitle.numberOfLines = 0;
    
    UIImageView * conphotolist = [UIImageView new];
    
     _contpholist = conphotolist;
    
    UILabel * contlabel = [UILabel new];
    
    _contlabelview4 = contlabel;
    
   // contlabel.backgroundColor = [UIColor greenColor];
    
    _contlabelview4.textColor =[UIColor lightGrayColor];
    
    contlabel.numberOfLines = 0;
    
     [zongView addSubview:_iconview];
     [zongView addSubview:_namelableview1];
     [zongView addSubview:_tianfulabeview2];
     [zongView addSubview:_datelableview3];
     [zongView addSubview:button];
    //[self.contentView sd_addSubviews:@[_iconview,_namelableview1,_tianfulabeview2,_datelableview3,bord, _contimageview3,_contlabelview4,button]];
    [self setuplaou];
   
  //  [_view4 setSingleLineAutoResizeWithMaxWidth:50];
    
  //  _view0.sd_cornerRadiusFromWidthRatio = @(0.5);
    
    
   // [_namelableview1 setSingleLineAutoResizeWithMaxWidth:200];
    
}
-(void)setText:(NSString *)text{
    
    
    _text = text;
    
    _contlabelview4.text = text;
    
    
}
-(void)setImageSrccont:(NSString *)imageSrccont{
    
    _imageSrccont = imageSrccont;
    
    CGFloat bottomMargin = 0;
    
    
    // 在实际的开发中，网络图片的宽高应由图片服务器返回然后计算宽高比。
    
    UIImage *pic = [UIImage imageNamed:imageSrccont];
    if (pic.size.width > 0) {
        CGFloat scale = pic.size.height / pic.size.width;
        _contimageview3.sd_layout.autoHeightRatio(scale);
        _contimageview3.image = pic;
        bottomMargin = 10;
      //  NSLog(@"dd  dcdff");
        // _view4.hidden = YES;
    } else {
        _contimageview3.sd_layout.autoHeightRatio(0);
    
    }
    
    
    
}
-(void)setuplaou{
    
    
    [self.contentView sd_addSubviews:@[_zongview,_bordview, _contimageview3,_tagtitleLabel,_tagontleLabel,_contpholist,_contlabelview4]];
    
    _zongview.sd_layout.leftSpaceToView(self.contentView, 0).rightSpaceToView(self.contentView, 0).topSpaceToView(self.contentView, 0).heightIs(92);
    
    _iconview.sd_layout.widthIs(60).heightIs(60).topSpaceToView(_zongview,10).leftSpaceToView(_zongview, 10);
    
    
    
    _namelableview1.sd_layout.topSpaceToView(_zongview, 5).leftSpaceToView(_iconview, 5).heightIs(22).widthIs(120);
    
    _tianfulabeview2.sd_layout.topSpaceToView(_namelableview1, 5).leftSpaceToView(_iconview, 5).heightIs(22).widthIs(120);
    
    self.didseletbutton.sd_layout.topSpaceToView(_zongview, 10).rightSpaceToView(_zongview, 10).widthIs(60).heightIs(60);
    
    _datelableview3.sd_layout.topSpaceToView(_tianfulabeview2, 5).leftSpaceToView(_iconview, 5).heightIs(22).widthIs(220);
    
    _bordview.sd_layout.topSpaceToView(_zongview, 0).leftSpaceToView(self.contentView, 0).rightSpaceToView(self.contentView, 0).heightIs(1);
    
    _contimageview3.sd_layout.leftSpaceToView(self.contentView, 5).rightSpaceToView(self.contentView, 20).topSpaceToView(_bordview, 5).heightRatioToView(_iconview, 0.8);
    
    
    _tagtitleLabel.sd_layout.topSpaceToView(_contimageview3, 10).leftSpaceToView(self.contentView, 40).rightSpaceToView(self.contentView, 40).heightIs(15);
    
    _tagontleLabel.sd_layout.topSpaceToView(_tagtitleLabel, -1).leftSpaceToView(self.contentView, 40).rightSpaceToView(self.contentView, 40).autoHeightRatio(0);
    
    
    _contpholist.sd_layout.leftSpaceToView(self.contentView, 15).topSpaceToView(_tagontleLabel, 5).widthRatioToView(self.contentView, 0.3);
    
    
    _contlabelview4.sd_layout.topSpaceToView(_contpholist, 10).leftSpaceToView(self.contentView, 10).rightSpaceToView(self.contentView, 10).autoHeightRatio(0);
    
    [self setupAutoHeightWithBottomView:_contlabelview4 bottomMargin:10];
    
    
}
-(void)layoutSubviews{
    
    [super layoutSubviews];
   // NSLog(@"sdkkkkkdkd");
   // [self setupAutoHeightWithBottomView:_contlabelview4 bottomMargin:10];
    //[self setuplaou];
   
    
}
-(void)setButtonimageString:(NSString *)buttonimageString{
    
    _buttonimageString = buttonimageString;
    
    
    
    //[self.didseletbutton setBackgroundImage:[UIImage imageNamed:buttonimageString] forState:UIControlStateNormal];
    
    [self.didseletbutton setImage:[UIImage imageNamed:buttonimageString] forState:UIControlStateNormal];
}
-(void)setBbmodel:(BBSModel *)bbmodel{
    
    _bbmodel = bbmodel;
    
    
   
 
    
   
    

    //头像
    [_iconview sd_setImageWithURL:[NSURL URLWithString:[AppNetWork_Post stringByAppendingString:bbmodel.nameimageString]] placeholderImage:[UIImage imageNamed:@"user"]];

    
    //名称
    _namelableview1.text = bbmodel.nameString;
    
    //积分
    _tianfulabeview2.text = [NSString stringWithFormat:@"%@ 積分%@",  bbmodel.taiyinString, bbmodel.score];
    //日期
    _datelableview3.text =  [NSString stringWithFormat:@"最後發表:%@",bbmodel.dateString];
   // NSLog(@"----%@",bbmodel.dateString);
    //内容
   // CGFloat bottomMargin = 0;
      CGFloat bottomMargin = 10;
    
    
 
    
  
    
    if (bbmodel.contimageString.length ==0) {
        
        //NSLog(@"--------555666666666");
      //  _contpholist.image = [UIImage imageNamed:@"user"];
        _contpholist.sd_layout.autoHeightRatio(0);
        
        
    }else{
       // NSLog(@"%@ ",bbmodel.contimageString);
      
        [_contpholist sd_setImageWithURL:[NSURL URLWithString:[AppNetWork_Post stringByAppendingString:bbmodel.contimageString]]];
        
    }
    
    
    
    
    if (bbmodel.tagnameString.length ==0) {
        
        _tagtitleLabel.sd_layout.heightIs(0);
        _tagontleLabel.sd_layout.heightIs(0);
      
        _tagontleLabel.text = @"";
        
    }else{
           _tagontleLabel.hidden = NO;
        _tagtitleLabel.sd_layout.heightIs(15);
       
        _tagtitleLabel.adjustsFontSizeToFitWidth = YES;
        _tagtitleLabel.text = [NSString stringWithFormat:@"引用    原贴由 %@於 %@发布",bbmodel.tagnameString,bbmodel.tagdateString];
        _tagontleLabel.text =bbmodel.tagcontString;
        }
    
    if (_bbmodel.titleString.length ==0) {
        
        _contimageview3.sd_layout.autoHeightRatio(0);
        
        _contlabelview4.text =  bbmodel.contentString;
        
        
    }else{
        
   
        
        NSString* string =  [NSString stringWithFormat:@"%@\n%@",bbmodel.titleString,bbmodel.contentString];
        
        NSString *stringForColor = bbmodel.titleString;
        // 创建对象.
        NSMutableAttributedString *mAttStri = [[NSMutableAttributedString alloc] initWithString:string];
        //
        NSRange range = [string rangeOfString:stringForColor];
        
        [mAttStri addAttribute:NSForegroundColorAttributeName value:fontColor(121, 101, 66) range:range];
        
        [mAttStri addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:18] range:range];
        
        
        _contlabelview4.attributedText =  mAttStri;
        
        
        UIImage * pic = [UIImage imageNamed:bbmodel.tieimage];
        CGFloat scale = pic.size.height / pic.size.width;
        _contimageview3.sd_layout.autoHeightRatio(scale);
        _contimageview3.image = pic;
        
        bottomMargin = 20;
        
    }
    
    [self setupAutoHeightWithBottomView:_contlabelview4 bottomMargin:bottomMargin];
    
    //***********************高度自适应cell设置步骤************************
    //
   // [self setupAutoHeightWithBottomView:_tagontleLabel bottomMargin:bottomMargin];
  
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
