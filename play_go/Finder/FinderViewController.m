//
//  FinderViewController.m
//  play_go
//
//  Created by xuwj on 16/7/26.
//  Copyright © 2016年 风影. All rights reserved.
//

#import "FinderViewController.h"
@interface FinderViewController ()

@property(nonatomic,copy) UILabel *styleLabel;

@end

@implementation FinderViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"发现";
    
    [self cacheManage];
    
   // [self.view addSubview: self.styleLabel];
}

- (void)cacheManage {
    
  // NSString *str = @"https://wap.wanbu.com.cn/NewWanbu/App/Api/index.php/MemberInfo/GetStepsNum/userid/785688/starttime/1497581913/position/left/count/20";
    ;
    //可以存入字典，数组，字符串，
    NSDictionary *rr = @{@"222":@"xuwj"};
  
    [NSUserDefaults setValue:rr forKey:@"rr0000"];
    
    id obj = [NSUserDefaults objectForKey:@"rr"];
    ULog(@"----obj---->%@",obj);
    
}




#if 0
- (UILabel *)styleLabel
{
    if (!_styleLabel) {
        _styleLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 200, 500)];
        _styleLabel.backgroundColor = [UIColor greenColor];
        _styleLabel.numberOfLines = 0;
        _styleLabel.text = @"开心就好开心就好开心就还哦";
      
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:_styleLabel.text];
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        
        [paragraphStyle setLineSpacing:20];//调整行间距
        
        [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [_styleLabel.text length])];
        _styleLabel.attributedText = attributedString;
        [_styleLabel sizeToFit];
        
    }
    return _styleLabel;
}
#endif


@end
