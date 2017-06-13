//
//  loginViewController.m
//  play_go
//
//  Created by xuwj on 16/7/26.
//  Copyright © 2016年 风影. All rights reserved.
//

#import "loginViewController.h"
#import "MainTabBarController.h"
#import "loginHandleTool.h"
@interface loginViewController ()<UITextFieldDelegate>

@property (nonatomic,strong)UITapGestureRecognizer *contentTap;

@property (nonatomic,strong)UIImageView *contentImageView;

@property (nonatomic,strong)UIImageView *logoImageView;

@property (nonatomic,strong)UITextField *userText;

@property (nonatomic,strong)UIImageView *userTextLine;

@property (nonatomic,strong)UITextField *passwordText;

@property (nonatomic,strong)UIImageView *passwordTextLine;

@property (nonatomic,strong)UIButton    *loginButn;

@end

@implementation loginViewController
-(void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:UIKeyboardWillHideNotification object:nil];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor =kNavBgColor;
    [self _initViews];
    _userText.delegate = self;
    _passwordText.delegate =self;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hideKeyBoard) name:UIKeyboardWillHideNotification object:nil] ;
    
}


- (void)_initViews
{
    [self.view addGestureRecognizer:self.contentTap];
    [self.view addSubview: self.contentImageView];
    [self.contentImageView addSubview: self.logoImageView];
    [self.contentImageView addSubview: self.userText];
    [self.contentImageView addSubview: self.userTextLine];
    [self.contentImageView addSubview: self.passwordText];
    [self.contentImageView addSubview: self.passwordTextLine];
    [self.contentImageView addSubview: self.loginButn];
}
- (UITapGestureRecognizer *)contentTap
{
    if (!_contentTap) {
        _contentTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hideKeyBoard)];
    }
    return _contentTap;
}
- (UIImageView *)contentImageView
{
    if (!_contentImageView) {
        _contentImageView = [[UIImageView alloc]initWithFrame:self.view.bounds];
        _contentImageView.userInteractionEnabled = YES;
        _contentImageView.image = [UIImage imageNamed:@"login_change_bg"];
    }
    return _contentImageView;
}

- (UIImageView *)logoImageView
{
    if (!_logoImageView) {
        _logoImageView = [[UIImageView alloc]init];
        if (KHeight>480) {
            _logoImageView.frame = CGRectMake((KWidth-100)/2, 40, 100, 150);
            _logoImageView.image = [UIImage imageNamed:@"ic_login_ch_hulu"];
        }
    }

    return _logoImageView;
}

- (UITextField *)userText
{
    if (!_userText) {
        _userText = [[UITextField alloc]init];
        _userText.placeholder = @"用户名/昵称";
        _userText.textColor = [UIColor whiteColor];
        _userText.enablesReturnKeyAutomatically = YES;
        _userText.clearButtonMode = UITextFieldViewModeWhileEditing;
        _userText.returnKeyType = UIReturnKeyNext;
        [_userText setAutocorrectionType:UITextAutocorrectionTypeNo];
        [_userText setAutocapitalizationType:UITextAutocapitalizationTypeNone];
        
        if (KHeight>480) {
            _userText.frame = CGRectMake(90, _logoImageView.bottom+15, KWidth-180, 40);
        }
        if ([_userText respondsToSelector:@selector(setAttributedPlaceholder:)]) {
            _userText.attributedPlaceholder = [[NSAttributedString alloc]initWithString:_userText.placeholder attributes:@{NSForegroundColorAttributeName :[UIColor whiteColor]}];
        }
        
    }
    
    return _userText;
}

- (UIImageView *)userTextLine
{
    if (!_userTextLine) {
        _userTextLine = [[UIImageView alloc]initWithFrame:CGRectMake(40, _userText.bottom+1, KWidth -80, 1)];
        _userTextLine.image = [UIImage imageNamed:@"ic_login_ch_line"];
    }
    UIImageView *userImageView = [[UIImageView alloc]initWithFrame:CGRectMake(_userTextLine.left+5, _userText.bottom-30, 20, _userText.height-20)];
    userImageView.image = [UIImage imageNamed:@"icon1"];
    [self.contentImageView addSubview:userImageView];
        return _userTextLine;

}
- (UITextField *)passwordText
{
    if (!_passwordText) {
        _passwordText = [[UITextField alloc]init];
        _passwordText.placeholder = @"密码";
        _passwordText.textColor = [UIColor whiteColor];
        _passwordText.clearButtonMode = UITextFieldViewModeWhileEditing;
        _passwordText.returnKeyType = UIReturnKeyDone;
        [_passwordText setAutocorrectionType:UITextAutocorrectionTypeNo];
        [_passwordText setAutocapitalizationType:UITextAutocapitalizationTypeNone];
        _passwordText.font = [UIFont boldSystemFontOfSize:16];
        
        if (KHeight>480) {
            _passwordText.frame = CGRectMake(_userText.left, _userText.bottom+15, _userText.width, 40);
        }
        if ([_passwordText respondsToSelector:@selector(setAttributedPlaceholder:)]) {
            _passwordText.attributedPlaceholder = [[NSAttributedString alloc]initWithString:_passwordText.placeholder attributes:@{NSForegroundColorAttributeName :[UIColor whiteColor]}];
        }
    }
    return _passwordText;
}

- (UIImageView *)passwordTextLine
{
    if (!_passwordTextLine) {
        _passwordTextLine = [[UIImageView alloc]initWithFrame:CGRectMake(40, _passwordText.bottom+1, KWidth -80, 1)];
        _passwordTextLine.image = [UIImage imageNamed:@"ic_login_ch_line"];
    }
    UIImageView *passWordImageView = [[UIImageView alloc]initWithFrame:CGRectMake(_passwordTextLine.left+5, _passwordText.bottom-30, 20, _passwordText.height-20)];
    passWordImageView.image = [UIImage imageNamed:@"iocn2"];
    [self.contentImageView addSubview:passWordImageView];
    
    
    return _passwordTextLine;
}

- (UIButton *)loginButn
{
    if (!_loginButn) {
        _loginButn = [[UIButton alloc]initWithFrame:CGRectMake(_passwordTextLine.left, _passwordTextLine.bottom+20, _passwordTextLine.width, 40)];
        [_loginButn setBackgroundColor:kNavBgColor];
        [_loginButn setTitle:@"登 录" forState:UIControlStateNormal];
        [_loginButn addTarget:self action:@selector(loginClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _loginButn;

}


#pragma mark -  登录事件
- (void)loginClick
{
    [_userText resignFirstResponder];
    [_passwordText resignFirstResponder];
    DULog(@"点击了登录按钮");
    if (_userText.text.length ==0||_passwordText.text.length ==0) {
        [Toast show:incompleteImagation];
    }
    else{
      DULog(@"%@,%@",_userText.text,_passwordText.text);
//      kWindow.rootViewController =[[MainTabBarController alloc]init];
        
        [loginHandleTool loginClickWithUserName:_userText.text password:_passwordText.text];
    }
}

#pragma mark - 收起键盘

- (void)hideKeyBoard
{
    if ([_userText isFirstResponder]) {
        [_userText resignFirstResponder];
    }
    else if ([_passwordText isFirstResponder])
    {
        [_passwordText resignFirstResponder];
    }
    [UIView animateWithDuration:0.2 animations:^{
        self.contentImageView.top = 0;
    }];

}


#pragma mark - UITextFieldDelegate

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    
    if ([textField isEqual:_userText]) {
        
       [UIView animateWithDuration:0.2 animations:^{
           self.contentImageView.top=-40;
       }];
    }
    else if ([textField isEqual:_passwordText])
    {
        [UIView animateWithDuration:0.2 animations:^{
            self.contentImageView.top=-60;
        }];
    }
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{

}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if ([textField isEqual:_userText]) {
        [_passwordText becomeFirstResponder];
    }
    else if ([textField isEqual:_passwordText])
    {
        [self loginClick];
    }
    return YES;
}


#pragma mark - server数据请求处理




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
