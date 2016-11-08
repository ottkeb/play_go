//
//  CWRefreshTableView .m
//  TableviewUpDownPull
//
//  Created by Zaishi Huang on 12-1-10.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.


#import "CWRefreshTableView.h"

@interface CWRefreshTableView()
@property (nonatomic,strong)NSString *flgStr;

- (void) initControl;
- (void) initPullDownView;
- (void) initPullUpView;
- (void) initPullAllView;
- (void) updatePullViewFrame;

@end

@implementation CWRefreshTableView

@synthesize pullTableView = _pullTableView;
@synthesize delegate = _delegate;

- (id) initWithTableView:(UITableView *)tView 
           pullDirection:(CWRefreshTableViewDirection) cwDirection
{
    self.flgStr=@"no";
    if ((self = [super init])) {
        
        _pullTableView = [tView retain];
        _direction = cwDirection;
        
        [self initControl];
    }
    return self;
}
- (id) initWithTableView:(UITableView *)tView
           pullDirection:(CWRefreshTableViewDirection) cwDirection isNewSportVC:(NSString *)flg {
    self.flgStr=@"yes";
    if ((self = [super init])) {
        _pullTableView = tView;
        _direction = cwDirection;
        [self initControl];
    }
    return self;
}

#pragma mark private

- (void) initControl
{
    switch (_direction) {
            
        case CWRefreshTableViewDirectionUp:
            
            [self initPullUpView];
            
            break;
            
        case CWRefreshTableViewDirectionDown:
            
            if ([self.flgStr isEqualToString:@"no"]) {
                [self initPullDownView];
            }
            else if ([self.flgStr isEqualToString:@"yes"]){
            
                [self initPullDownView:self.flgStr];
            }
            break;
            
        case CWRefreshTableViewDirectionAll:
            [self initPullAllView];
            break;
    }
}

- (void) initPullDownView
{
    CGFloat fWidth = _pullTableView.frame.size.width;
    
    EGORefreshTableHeaderView *view = [[EGORefreshTableHeaderView alloc] initWithFrame:CGRectMake(0.0f,0.0f - 650.0f, fWidth, 650) 
                                                                          byDirection:EGOOPullRefreshDown];
    view.delegate = self;
    [_pullTableView addSubview:view];
    
    _headView = view;
    [view release];
    [_headView refreshLastUpdatedDate];
}

- (void)initPullDownView :(NSString *)flgStr
{
    CGFloat fWidth = _pullTableView.frame.size.width;
    EGORefreshTableHeaderView *view = [[EGORefreshTableHeaderView alloc]initWithFrame:CGRectMake(0.0f,0.0f - 650.0f, fWidth, 650) byDirection:EGOOPullRefreshDown flg:self.flgStr];
    view.delegate = self;
    [_pullTableView addSubview:view];
    _headView = view;
    [view release];
    [_flgStr release];
    [_headView refreshLastUpdatedDate];
}
- (void) initPullUpView
{
    CGFloat fWidth = _pullTableView.frame.size.width;
    
    CGFloat originY = _pullTableView.contentSize.height;
    DULog(@"_pullTableView.contentSize.height = %f",_pullTableView.contentSize.height);
    
    if (originY < _pullTableView.frame.size.height) {
        
        originY = _pullTableView.frame.size.height;
    }
    
    EGORefreshTableHeaderView *view = [[EGORefreshTableHeaderView alloc] initWithFrame:CGRectMake(0, originY, fWidth, 65)               byDirection:EGOOPullRefreshUp];
    view.delegate = self;
    [_pullTableView addSubview:view];
    _footerView = view;
    [view release];    
    [_footerView refreshLastUpdatedDate];
}

- (void) initPullAllView
{
    [self initPullUpView];    
    [self initPullDownView];
}

- (void) updatePullViewFrame
{
    CGRect footerFrame = _headView.frame;
    
    if (_headView != nil) {  
        
        CGFloat fWidth = _pullTableView.frame.size.width;        
        
        if (!CGRectEqualToRect(_headView.frame, CGRectMake(0, 0.0f - _pullTableView.bounds.size.height, fWidth, _pullTableView.bounds.size.height))) {
            
            CGRect frame = _headView.frame;
            frame.origin.y = 0.0f - 650.0f;
            _headView.frame = frame;  
            
        }
    }
    
    if (_footerView != nil) {
        
        CGFloat fWidth = _pullTableView.frame.size.width;        
        CGFloat originY = _pullTableView.contentSize.height;        
        
        if (originY < _pullTableView.frame.size.height) {
            originY = _pullTableView.frame.size.height;
        }
        
        if (!CGRectEqualToRect(_footerView.frame, CGRectMake(0, originY, fWidth, _pullTableView.bounds.size.height))) {
            CGRect frame = footerFrame;
            frame.origin.y = originY;
            _footerView.frame = frame;  
        }
    }
}


- (void)loadState
{
    _pullTableView.contentOffset = CGPointMake(0, -65);
    [_headView loadState:_pullTableView];
}

#pragma mark -
#pragma mark UIScrollViewDelegate Methods

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    if (scrollView.contentOffset.y < 0.0f) {
        
        [_headView egoRefreshScrollViewDidScroll:scrollView];  
    }
    else if (scrollView.contentOffset.y >  (scrollView.contentSize.height - self.pullTableView.frame.size.height))
    {
        [_footerView egoRefreshScrollViewDidScroll:scrollView];
    }
    
    [self updatePullViewFrame];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
        
    if (scrollView.contentOffset.y < -0.0f) {
        [_headView egoRefreshScrollViewDidEndDragging:scrollView];  
    }
    else if ( scrollView.contentOffset.y >  (scrollView.contentSize.height - self.pullTableView.frame.size.height))
    {
        [_footerView egoRefreshScrollViewDidEndDragging:scrollView];
    }
}


#pragma mark -
#pragma mark Data Source Loading / Reloading Methods

- (void) DataSourceDidFinishedLoading
{
    _reloading = NO;    
    [_headView egoRefreshScrollViewDataSourceDidFinishedLoading:_pullTableView];    
    [_footerView egoRefreshScrollViewDataSourceDidFinishedLoading:_pullTableView];
}


#pragma mark -
#pragma mark EGORefreshTableHeaderDelegate Methods

- (void)egoRefreshTableHeaderDidTriggerRefresh:(EGORefreshTableHeaderView*)view 
                                     direction:(EGOPullRefreshDirection)direc{
    
    if (_delegate != nil && [_delegate respondsToSelector:@selector(CWRefreshTableViewReloadTableViewDataSource:)]) {
        
        if (direc == EGOOPullRefreshUp) {
            _reloading = [_delegate CWRefreshTableViewReloadTableViewDataSource:CWRefreshTableViewPullTypeLoadMore]; 
        }
        else if (direc == EGOOPullRefreshDown)
        {
            _reloading = [_delegate CWRefreshTableViewReloadTableViewDataSource:CWRefreshTableViewPullTypeReload];
        }
    }
}

- (BOOL)egoRefreshTableHeaderDataSourceIsLoading:(EGORefreshTableHeaderView*)view{
    
    return _reloading; // should return if data source model is reloading
}

- (NSUInteger)egoRefreshTableHeaderLastUpPage:(EGORefreshTableHeaderView*)view{
    if([_delegate respondsToSelector:@selector(CWRefreshTableViewLastUpPage:)]){
        return [_delegate CWRefreshTableViewLastUpPage:self];
    }
    else{
         return 0;
    }
}


@end