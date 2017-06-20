//
//  BViewController.m
//  play_go
//
//  Created by xuwj on 17/6/15.
//  Copyright © 2017年 风影. All rights reserved.
//

#import "BViewController.h"
#import "CViewController.h"
@interface BViewController ()

@end

@implementation BViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"B";
    UIButton *butn = [[UIButton alloc]initWithFrame:CGRectMake(100, 300, 200, 100)];
    [butn setBackgroundColor:[UIColor redColor]];
    [butn addTarget:self action:@selector(butnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:butn];
    
    // Do any additional setup after loading the view.
}

- (void)butnClick {
    
    CViewController *bVC = [[CViewController alloc]init];
    
    [self.navigationController pushViewController:bVC animated:YES];
    
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
