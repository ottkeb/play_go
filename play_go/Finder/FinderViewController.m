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
    
    [self customeNavagationTitle:@"发现"];
    
    [self.view addSubview: self.styleLabel];
}

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



@end
