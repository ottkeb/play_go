

#import "EGORefreshTableHeaderView.h"

#define  RefreshViewHight 65.0f
#define TEXT_COLOR	 [UIColor colorWithRed:136.0/255.0 green:136.0/255.0 blue:136.0/255.0 alpha:1.0]
#define FLIP_ANIMATION_DURATION 0.18f
#define RGB(r, g, b)    [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:1.0]
@interface EGORefreshTableHeaderView (Private)
- (id)initWithFrame:(CGRect)frame arrowImageName:(NSString *)arrow textColor:(UIColor *)textColor;
- (void)setState:(EGOPullRefreshState)aState;

@end

@implementation EGORefreshTableHeaderView

@synthesize delegate=_delegate;
@synthesize direction = _direction;


- (id) initWithFrame:(CGRect)frame byDirection:(EGOPullRefreshDirection)direc

{
     _direction = direc;
    return [self initWithFrame:frame arrowImageName:@"wanbu_refresh_arraw" textColor:TEXT_COLOR];
}

- (id) initWithFrame:(CGRect)frame byDirection:(EGOPullRefreshDirection)direc flg:(NSString *)flgStr
{
    _direction = direc;
    _flgStr=flgStr;
    return [self initWithFrame:frame arrowImageName:@"pull_down_2" textColor:TEXT_COLOR flgStr:flgStr];
    
}

- (id)initWithFrame:(CGRect)frame {
    return [self initWithFrame:frame byDirection:EGOOPullRefreshUp];    
}


- (id)initWithFrame:(CGRect)frame arrowImageName:(NSString *)arrow textColor:(UIColor *)textColor  {
    if (self = [super initWithFrame:frame]) {
		
		self.autoresizingMask = UIViewAutoresizingFlexibleWidth;
//		self.backgroundColor = [UIColor colorWithRed:226.0/255.0 green:231.0/255.0 blue:237.0/255.0 alpha:1.0];
        
        self.backgroundColor = [UIColor whiteColor];
        
		UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, frame.size.height - 30.0f, self.frame.size.width, 20.0f)];
		label.autoresizingMask = UIViewAutoresizingFlexibleWidth;
		label.font = [UIFont systemFontOfSize:12.0f];
		label.textColor = TEXT_COLOR;
		label.shadowColor = [UIColor colorWithWhite:0.9f alpha:1.0f];
		label.shadowOffset = CGSizeMake(0.0f, 1.0f);
		label.backgroundColor = [UIColor clearColor];
		label.textAlignment = UITextAlignmentCenter;
		[self addSubview:label];
		_lastUpdatedLabel=label;
        _lastUpdatedLabel.hidden = YES;
		[label release];
		
		label = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, frame.size.height - 48.0f, self.frame.size.width, 20.0f)];
		label.autoresizingMask = UIViewAutoresizingFlexibleWidth;
		label.font = [UIFont boldSystemFontOfSize:13.0f];
		label.textColor = TEXT_COLOR;
		label.shadowColor = [UIColor colorWithWhite:0.9f alpha:1.0f];
		label.shadowOffset = CGSizeMake(0.0f, 1.0f);
		label.backgroundColor = [UIColor clearColor];
		label.textAlignment = NSTextAlignmentCenter;
		[self addSubview:label];
		_statusLabel=label;
//      _statusLabel.hidden = YES;
        _statusLabel.hidden = NO;
		[label release];
		
		CALayer *layer = [CALayer layer];
		layer.frame = CGRectMake(70.0f, frame.size.height - 65.0f, 30.0f, 55.0f);
//      layer.frame = CGRectMake(135.0f, frame.size.height - 65.0f, 47.0f, 47.0f);
		layer.contentsGravity = kCAGravityResizeAspect;
		layer.contents = (id)[UIImage imageNamed:@"wanbu_refresh_arraw"].CGImage;
		
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 40000
		if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)]) {
			layer.contentsScale = [[UIScreen mainScreen] scale];
		}
#endif
		
		[[self layer] addSublayer:layer];
		_arrowImage=layer;
		
        switch (_direction) {
                
            case EGOOPullRefreshUp:
                _arrowImage.contents = (id)[UIImage imageNamed:@"wanbu_refresh_arraw"].CGImage;
                
                break;
            case EGOOPullRefreshDown:
                _arrowImage.contents = (id)[UIImage imageNamed:@"wanbu_refresh_arraw"].CGImage;
                
                break;
        }
        
        
		UIActivityIndicatorView *view = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
		view.frame = CGRectMake(25.0f, frame.size.height - 38.0f, 20.0f, 20.0f);
//        wanbu_LoadingImageView = [[UIImageView alloc]initWithFrame:CGRectMake(135, frame.size.height - 60, 47, 47)];
        wanbu_LoadingImageView = [[UIImageView alloc]initWithFrame:CGRectMake(70, frame.size.height - 60, 47, 47)];
        
        [self addSubview:wanbu_LoadingImageView];
		[self addSubview:view];
		_activityView = view;
		[view release];
		
		[self setState:EGOOPullRefreshNormal];
		
    }
    return self;
	
}

- (id)initWithFrame:(CGRect)frame arrowImageName:(NSString *)arrow textColor:(UIColor *)textColor flgStr:(NSString *)str  {
    if (self = [super initWithFrame:frame]) {
        
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth;
//        		self.backgroundColor = [UIColor colorWithRed:226.0/255.0 green:231.0/255.0 blue:237.0/255.0 alpha:1.0];
        
        self.backgroundColor = RGB(0.0, 151.0, 224.0);
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, frame.size.height - 30.0f, self.frame.size.width, 20.0f)];
        label.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        label.font = [UIFont systemFontOfSize:12.0f];
        label.textColor = [UIColor whiteColor];
//        label.shadowColor = [UIColor colorWithWhite:0.9f alpha:1.0f];
        label.shadowOffset = CGSizeMake(0.0f, 1.0f);
        label.backgroundColor = [UIColor clearColor];
        label.textAlignment = UITextAlignmentCenter;
        [self addSubview:label];
        _lastUpdatedLabel=label;
        _lastUpdatedLabel.hidden = YES;
        [label release];
        
        label = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, frame.size.height - 48.0f, self.frame.size.width, 20.0f)];
        label.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        label.font = [UIFont boldSystemFontOfSize:13.0f];
        label.textColor = [UIColor whiteColor];
//        label.shadowColor = [UIColor colorWithWhite:0.9f alpha:1.0f];
        label.shadowOffset = CGSizeMake(0.0f, 1.0f);
        label.backgroundColor = [UIColor clearColor];
        label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:label];
        _statusLabel=label;
        //_statusLabel.hidden = YES;
        _statusLabel.hidden = NO;
        [label release];
        
        CALayer *layer = [CALayer layer];
        layer.frame = CGRectMake(70.0f, frame.size.height - 65.0f, 30.0f, 55.0f);
        //        layer.frame = CGRectMake(135.0f, frame.size.height - 65.0f, 47.0f, 47.0f);
        layer.contentsGravity = kCAGravityResizeAspect;
        layer.contents = (id)[UIImage imageNamed:@"pull_down_2"].CGImage;
        
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 40000
        if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)]) {
            layer.contentsScale = [[UIScreen mainScreen] scale];
        }
#endif
        
        [[self layer] addSublayer:layer];
        _arrowImage=layer;
        
        switch (_direction) {
                
            case EGOOPullRefreshUp:
                _arrowImage.contents = (id)[UIImage imageNamed:@"pull_down_2"].CGImage;
                
                break;
            case EGOOPullRefreshDown:
                _arrowImage.contents = (id)[UIImage imageNamed:@"pull_down_3"].CGImage;
                
                break;
        }
        
        
        UIActivityIndicatorView *view = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        view.frame = CGRectMake(25.0f, frame.size.height - 38.0f, 20.0f, 20.0f);
        //        wanbu_LoadingImageView = [[UIImageView alloc]initWithFrame:CGRectMake(135, frame.size.height - 60, 47, 47)];
        wanbu_LoadingImageView = [[UIImageView alloc]initWithFrame:CGRectMake(70, frame.size.height - 60, 47, 47)];
        
        [self addSubview:wanbu_LoadingImageView];
        [self addSubview:view];
        _activityView = view;
        [view release];
        
        
        [self setState:EGOOPullRefreshNormal];
        
    }
    self.layer.borderWidth = 0;
    
    return self;
    
}


#pragma mark -
#pragma mark Setters

- (void)refreshLastUpdatedDate {
	
	if ([_delegate respondsToSelector:@selector(egoRefreshTableHeaderLastUpPage:)]) {
		
		//int pag = [_delegate egoRefreshTableHeaderLastUpPage:self];

		//_lastUpdatedLabel.text = [NSString stringWithFormat:@"当前纪录第%d页",pag/20+1];
        
        NSDateFormatter *foematter = [[NSDateFormatter alloc] init];
        [foematter setDateFormat:@"yyyy.MM.dd HH:mm"];
        NSString *dateString = [foematter stringFromDate:[NSDate date]];
        _lastUpdatedLabel.text = [NSString stringWithFormat:@"最近更新: %@",dateString];
        
        [foematter release];

		[[NSUserDefaults standardUserDefaults] setObject:_lastUpdatedLabel.text forKey:@"EGORefreshTableView_LastRefresh"];
		[[NSUserDefaults standardUserDefaults] synchronize];
		
	} else {
		
		_lastUpdatedLabel.text = nil;
		
	}
    
}

- (void)setState:(EGOPullRefreshState)aState{
	
	switch (aState) {
		case EGOOPullRefreshPulling:
			
			_statusLabel.text = NSLocalizedString(@"松开即可更新...", @"松开加载更多...");
			[CATransaction begin];
			[CATransaction setAnimationDuration:FLIP_ANIMATION_DURATION];
			//_arrowImage.transform = CATransform3DMakeRotation((M_PI / 180.0) * 180.0f, 0.0f, 0.0f, 1.0f);
			[CATransaction commit];
			
			break;
		case EGOOPullRefreshNormal:
			
			if (_state == EGOOPullRefreshPulling) {
				[CATransaction begin];
				[CATransaction setAnimationDuration:FLIP_ANIMATION_DURATION];
				//_arrowImage.transform = CATransform3DIdentity;
				[CATransaction commit];
			}
			
            switch (_direction) {
                    
                case EGOOPullRefreshUp:                    
                    _statusLabel.text = NSLocalizedString(@"上拉加载更多...", @"上拉加载更多...");                    
                    break;
                case EGOOPullRefreshDown:                    
                    _statusLabel.text = NSLocalizedString(@"下拉更新数据...", @"下拉更新数据...");                    
                    break;
                    
            } 
            
			//[_activityView stopAnimating];
            [wanbu_LoadingImageView stopAnimating];
			[CATransaction begin];
			[CATransaction setValue:(id)kCFBooleanTrue forKey:kCATransactionDisableActions]; 
			_arrowImage.hidden = NO;
			_arrowImage.transform = CATransform3DIdentity;
			[CATransaction commit];
			
			[self refreshLastUpdatedDate];
			
			break;
		case EGOOPullRefreshLoading:
			
			_statusLabel.text = NSLocalizedString(@"正在加载中...", @"正在加载中...");
			//[_activityView startAnimating];
			[CATransaction begin];
			[CATransaction setValue:(id)kCFBooleanTrue forKey:kCATransactionDisableActions]; 
			_arrowImage.hidden = YES;
			[CATransaction commit];
			wanbu_LoadingImageView.animationImages = [NSArray arrayWithObjects:[UIImage imageNamed:@"wanbu_refresh_arraw"],[UIImage imageNamed:@"wanbu_refresh_arraw1"], nil];
            
            if ([self.flgStr isEqualToString:@"yes"]) {
                wanbu_LoadingImageView.animationImages = [NSArray arrayWithObjects:[UIImage imageNamed:@"pull_down_2"],[UIImage imageNamed:@"pull_down_3"], nil];
            }
            wanbu_LoadingImageView.animationDuration = 0.4;
            wanbu_LoadingImageView.animationRepeatCount = 0;
            [wanbu_LoadingImageView startAnimating];
			break;
		default:
			break;
	}
	
	_state = aState;
}

#pragma mark -
#pragma mark ScrollView Methods

//手指屏幕上不断拖动调用此方法
- (void)egoRefreshScrollViewDidScroll:(UIScrollView *)scrollView {	
	
	if (_state == EGOOPullRefreshLoading) {
		

	} else if (scrollView.isDragging) {
		
        BOOL _loading = NO;
        
        if ([_delegate respondsToSelector:@selector(egoRefreshTableHeaderDataSourceIsLoading:)]) {
            
            _loading = [_delegate egoRefreshTableHeaderDataSourceIsLoading:self];
            
        }
        
        
        switch (_direction) {
                
            case EGOOPullRefreshUp:
                
                if (_state == EGOOPullRefreshPulling && scrollView.contentOffset.y + (scrollView.frame.size.height) < scrollView.contentSize.height + RefreshViewHight && scrollView.contentOffset.y > 0.0f && !_loading) {
                    
                    [self setState:EGOOPullRefreshNormal];
                    
                } else if (_state == EGOOPullRefreshNormal && scrollView.contentOffset.y + (scrollView.frame.size.height) > scrollView.contentSize.height + RefreshViewHight  && !_loading) {
                    
                    [self setState:EGOOPullRefreshPulling];
                    
                }
                
                break;
                
                
            case EGOOPullRefreshDown:
                
                if (_state == EGOOPullRefreshPulling && scrollView.contentOffset.y > -65.0f && scrollView.contentOffset.y < 0.0f && !_loading) {
                    
                    [self setState:EGOOPullRefreshNormal];
                    
                } else if (_state == EGOOPullRefreshNormal && scrollView.contentOffset.y < -65.0f && !_loading) {
                    
                    [self setState:EGOOPullRefreshPulling];
                    
                }
                
                break;
                
        }
		
		if (scrollView.contentInset.bottom != 0) {
			scrollView.contentInset = UIEdgeInsetsZero;
		}
		
	}
	
}

//当用户停止拖动，并且手指从屏幕中拿开的的时候调用此方法
- (void)egoRefreshScrollViewDidEndDragging:(UIScrollView *)scrollView {
	
	BOOL _loading = NO;
	if ([_delegate respondsToSelector:@selector(egoRefreshTableHeaderDataSourceIsLoading:)]) {
		_loading = [_delegate egoRefreshTableHeaderDataSourceIsLoading:self];
	}
    
    switch (_direction) {
            
        case EGOOPullRefreshUp:
            
            if (scrollView.contentOffset.y + (scrollView.frame.size.height) > scrollView.contentSize.height + RefreshViewHight && !_loading) {
                
                
                
                if ([_delegate respondsToSelector:@selector(egoRefreshTableHeaderDidTriggerRefresh:direction:)]) {
                    
                    [_delegate egoRefreshTableHeaderDidTriggerRefresh:self direction:_direction];
                    
                }
                
                [self setState:EGOOPullRefreshLoading];
//                dispatch_async(dispatch_get_main_queue(), ^{
                    [UIView beginAnimations:nil context:NULL];
                    [UIView setAnimationDuration:0.5];
                    scrollView.contentInset = UIEdgeInsetsMake(0.0f, 0.0f, RefreshViewHight, 0.0f);
                    [scrollView setContentOffset:CGPointMake(0,RefreshViewHight) animated:YES];
                    [UIView commitAnimations];
//                });
               
        
            }
            
            break;
            
        case EGOOPullRefreshDown:
            
            if (scrollView.contentOffset.y <= - 65.0f && !_loading) {
                
                
                
                if ([_delegate respondsToSelector:@selector(egoRefreshTableHeaderDidTriggerRefresh:direction:)]) {
                    
                    [_delegate egoRefreshTableHeaderDidTriggerRefresh:self direction:_direction];
                    
                }
                
                [self setState:EGOOPullRefreshLoading];
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    [UIView beginAnimations:nil context:NULL];
                    [UIView setAnimationDuration:0.5];
                    scrollView.contentInset = UIEdgeInsetsMake(RefreshViewHight, 0.0f, 0.0f, 0.0f);
                    [scrollView setContentOffset:CGPointMake(0, -RefreshViewHight) animated:YES];
                    [UIView commitAnimations];
                });
                
                
            }
            
            break;
            
    }	
}

- (void)loadState:(UIScrollView *)scrollView
{
    [self setState:EGOOPullRefreshLoading];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5];
    scrollView.contentInset = UIEdgeInsetsMake(RefreshViewHight, 0.0f, 0.0f, 0.0f);
    [UIView commitAnimations];
    
    if ([_delegate respondsToSelector:@selector(egoRefreshTableHeaderDidTriggerRefresh:direction:)]) {
        
        [_delegate egoRefreshTableHeaderDidTriggerRefresh:self direction:_direction];
        
    }
}

//当开发者页面页面刷新完毕调用此方法，[delegate egoRefreshScrollViewDataSourceDidFinishedLoading: scrollView];
- (void)egoRefreshScrollViewDataSourceDidFinishedLoading:(UIScrollView *)scrollView {
	
    
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:0.5];
	[scrollView setContentInset:UIEdgeInsetsMake(0.0f, 0.0f, 0.0f, 0.0f)];
	[UIView commitAnimations];
	
	[self setState:EGOOPullRefreshNormal];
    
}

#pragma mark -
#pragma mark Dealloc

- (void)dealloc {
	
	_delegate=nil;
	_activityView = nil;
	_statusLabel = nil;
	_arrowImage = nil;
	_lastUpdatedLabel = nil;
    _flgStr = nil;
    [super dealloc];
}


@end
