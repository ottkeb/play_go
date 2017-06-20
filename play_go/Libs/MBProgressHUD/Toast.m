//
//  Toast.m
//  VIPClub
//
//  Created by Wu Yifan on 12-5-18.
//  Copyright (c) 2012年 BUPT. All rights reserved.
//

#import "Toast.h"
#import "MBProgressHUD.h"

#define kWindown [UIApplication sharedApplication].keyWindow

static MBProgressHUD *g_hudToast = nil;
static MBProgressHUD *getToast()
{
    static dispatch_once_t onceInIt;

    dispatch_once(&onceInIt, ^{
		//g_hudToast = [[MBProgressHUD alloc] initWithView:kWindown];
        g_hudToast = [[MBProgressHUD alloc] initWithFrame:CGRectMake(100, 200, 230, 200)];
		//g_hudToast.mode = MBProgressHUDModeText;
    });
    g_hudToast.center = CGPointMake(kWindown.frame.size.width/2.0f, kWindown.frame.size.height/2.0f-20);
    [kWindown addSubview:g_hudToast];

	return g_hudToast;
}

@implementation Toast

+ (void)show:(NSString*)message
{
    static MBProgressHUD *hudToast = nil;
    static dispatch_once_t onceInIt;
    
    dispatch_once(&onceInIt, ^{
        hudToast = [[MBProgressHUD alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    });
    
    CGSize size = [message sizeWithFont:hudToast.labelFont constrainedToSize:CGSizeMake(10000, 50)];
    if (size.width > 100) {
        CGRect rect = hudToast.frame;
        rect.size.width = size.width + 100;
        hudToast.frame = rect;
    }
    
    hudToast.center = CGPointMake(kWindown.frame.size.width/2.0f, kWindown.frame.size.height/2.0 - 20);
    [kWindown addSubview:hudToast];
    
    hudToast.mode = MBProgressHUDModeText;
	hudToast.labelText = message;
    hudToast.dimBackground = NO;
    
	[hudToast show:YES];
	[hudToast hide:YES afterDelay:1.0f];
}

+ (void)show1:(NSString*)message
{
    static MBProgressHUD *hudToast = nil;
    static dispatch_once_t onceInIt;
    
    dispatch_once(&onceInIt, ^{
        hudToast = [[MBProgressHUD alloc] initWithFrame:CGRectMake(0, 0, 250, 40)];
    });
    
    CGSize size = [message sizeWithFont:hudToast.labelFont constrainedToSize:CGSizeMake(100, 50)];
    if (size.width > 100) {
        CGRect rect = hudToast.frame;
        rect.size.width = size.width + 100;
        hudToast.frame = rect;
    }
    
    hudToast.center = CGPointMake(kWindown.frame.size.width/2.0f, kWindown.frame.size.height/2.0 - 20);
    [kWindown addSubview:hudToast];
    
    hudToast.mode = MBProgressHUDModeText;
    hudToast.labelText = message;
    hudToast.labelFont = [UIFont systemFontOfSize:15.0];
    hudToast.dimBackground = NO;
    [hudToast show:YES];
    [hudToast hide:YES afterDelay:1.0f];
    
}

+ (void)show2:(NSString *)message
{
    static MBProgressHUD *hudToast = nil;
    static dispatch_once_t onceInIt;
    
    dispatch_once(&onceInIt, ^{
        hudToast = [[MBProgressHUD alloc] initWithFrame:CGRectMake(0, 0, 250, 100)];
    });
    
    CGSize size = [message sizeWithFont:hudToast.labelFont constrainedToSize:CGSizeMake(10000, 50)];
    if (size.width > 100) {
        CGRect rect = hudToast.frame;
        rect.size.width = size.width + 100;
        hudToast.frame = rect;
    }
    
    hudToast.center = CGPointMake(kWindown.frame.size.width/2.0f, kWindown.frame.size.height/2.0 - 20);
    [kWindown addSubview:hudToast];
    
    hudToast.mode = MBProgressHUDModeText;
    hudToast.labelText = message;
    hudToast.dimBackground = NO;
    
    [hudToast show:YES];
    [hudToast hide:YES afterDelay:1.0f];

}
+ (void)shows:(NSString *)message detailMessage:(NSString*)detailmessage
{
    static MBProgressHUD *hudToast = nil;
    hudToast = [[MBProgressHUD alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    CGSize size = [message sizeWithFont:hudToast.labelFont constrainedToSize:CGSizeMake(10000, 50)];
    if (size.width > 100) {
        CGRect rect = hudToast.frame;
        rect.size.width = size.width + 100;
        hudToast.frame = rect;
    }
    
    hudToast.center = CGPointMake(kWindown.frame.size.width/2.0f, kWindown.frame.size.height/2.0 - 20);
    [kWindown addSubview:hudToast];
    
    hudToast.mode = MBProgressHUDModeText;
    hudToast.labelText = message;
    hudToast.detailsLabelText = detailmessage;
    hudToast.dimBackground = NO;
    
    [hudToast show:YES];
    [hudToast hide:YES afterDelay:2.0f];
}
+ (void)show:(NSString*)message inView:(UIView *)view
{
    MBProgressHUD *hudToast = [[[MBProgressHUD alloc] initWithView:view] autorelease];
    [view addSubview:hudToast];
    UIImageView *checkV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"noshuju"]];
    
    hudToast.customView = checkV;
    hudToast.mode = MBProgressHUDModeCustomView;
	hudToast.labelText = message;
    hudToast.dimBackground =NO;
	[hudToast show:YES];
	[hudToast hide:YES afterDelay:2.0f];
    [checkV release];

}
+ (void)show:(NSString*)message inViews:(UIView *)view
{
    MBProgressHUD *hudToast =[[MBProgressHUD alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
    hudToast.center = CGPointMake(kWindown.frame.size.width/2.0f, kWindown.frame.size.height/2.0 - 20);
    [kWindow addSubview:hudToast];
    UIImageView *checkV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"noshuju"]];
    
    hudToast.customView = checkV;
    hudToast.mode = MBProgressHUDModeCustomView;
    hudToast.detailsLabelText = message;
    hudToast.dimBackground =NO;
    [hudToast show:YES];
    [hudToast hide:YES afterDelay:2.0f];
    [checkV release];
    
}
+ (void)showActiveMessage:(NSString *)message withBackground:(BOOL)backG
{
    MBProgressHUD *HUD = getToast();
    HUD.mode = MBProgressHUDModeIndeterminate;
    //HUD.dimBackground = backG;
    HUD.dimBackground = NO;
    HUD.labelText = message;
    //[HUD hide:YES afterDelay:2.0f];
    [HUD show:YES];
}
+ (void)showActiveMessage1:(NSString *)message withBackground:(BOOL)backG
{
    MBProgressHUD *HUD = getToast();
    HUD.mode = MBProgressHUDModeIndeterminate;
    //HUD.dimBackground = backG;
    HUD.dimBackground = NO;
    HUD.labelText = message;
    [HUD hide:YES afterDelay:2.0f];
    [HUD show:YES];
}
+ (void)hideActiveHud
{
    [getToast() hide:YES];
}

//成功提示
+ (void)showCheckmarkViewWithMessage:(NSString *)message detailMessage:(NSString*)detailmessage  inView:(UIView *)view
{
    MBProgressHUD *hud = [[[MBProgressHUD alloc] initWithView:view] autorelease];
    [view addSubview:hud];
    
    UIImageView *checkV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"xiugaichenggong"]];

	hud.customView = checkV;
	
	//Set custom view mode
	hud.mode = MBProgressHUDModeCustomView;
	
	hud.labelText = message;
    hud.detailsLabelText = detailmessage;
    [hud show:YES];
	[hud hide:YES afterDelay:2.0f];
    [checkV release];
}

@end
