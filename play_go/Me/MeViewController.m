//
//  MeViewController.m
//  play_go
//
//  Created by xuwj on 16/7/26.
//  Copyright © 2016年 风影. All rights reserved.
//

#import "MeViewController.h"
#import "BViewController.h"
@interface MeViewController ()<UITextFieldDelegate>


@end

@implementation MeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"我";
    
    UITextField *textFile = [[UITextField alloc]initWithFrame:CGRectMake(100, 100, KWidth - 200, 50)];
    
    textFile.delegate = self;
    textFile.backgroundColor = [UIColor redColor];
    [self.view addSubview:textFile];
    
    UIButton *butn = [[UIButton alloc]initWithFrame:CGRectMake(100, 300, 200, 100)];
    [butn setBackgroundColor:[UIColor redColor]];
    [butn addTarget:self action:@selector(butnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:butn];
    
    
    //1、可在重货，最大载重，最大体积，0~999
    CGFloat inputWeight = 10;//输入框内的内容
    if (inputWeight >0 && inputWeight <=999) {
        CGFloat weight = [[NSString stringWithFormat:@"%.2f",inputWeight]floatValue];
        NSLog(@"--------->载重--》%f",weight);
    }else {
        NSLog(@"输入内容不合法");
    }
    

    //2、车辆长度 0~99
    CGFloat inputLength = 22;
    if (inputLength > 0 && inputLength <= 99) {
        CGFloat carLength = [[NSString stringWithFormat:@"%.2f",inputLength]floatValue];
        NSLog(@"--------->车辆长度--》%f",carLength);
    }
}

- (void)butnClick {

    BViewController *bVC = [[BViewController alloc]init];
    
    [self.navigationController pushViewController:bVC animated:YES];

}




- (void)textFieldEditChanged:(UITextField *)textField  {
    
    NSLog(@"textfield text %@",textField.text);
    
    textField.text = @"200000";
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {

    [textField resignFirstResponder];
    textField.text = @"200000";

    return YES;
}

@end
