//
//  CWRefreshTableView .h
//  TableviewUpDownPull
//
//  Created by Zaishi Huang on 12-1-10.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.


#import <Foundation/Foundation.h>
#import "EGORefreshTableHeaderView.h"

typedef enum {
    
    CWRefreshTableViewDirectionUp,
    CWRefreshTableViewDirectionDown,
    CWRefreshTableViewDirectionAll
    
}CWRefreshTableViewDirection;

//pull type
typedef enum {
    
    CWRefreshTableViewPullTypeReload,           //从新加载
    CWRefreshTableViewPullTypeLoadMore,         //加载更多
    
}CWRefreshTableViewPullType;

@protocol CWRefreshTableViewDelegate;

@interface CWRefreshTableView: NSObject<EGORefreshTableHeaderDelegate>
{    
    BOOL                        _reloading;    
    EGORefreshTableHeaderView  *_headView;
    EGORefreshTableHeaderView  *_footerView;
    CWRefreshTableViewDirection    _direction;
}

@property (nonatomic, assign) UITableView  *pullTableView;
@property (nonatomic, assign) id<CWRefreshTableViewDelegate> delegate;

//方向
- (id) initWithTableView:(UITableView *) tView
           pullDirection:(CWRefreshTableViewDirection) cwDirection;
- (id) initWithTableView:(UITableView *)tView
           pullDirection:(CWRefreshTableViewDirection) cwDirection isNewSportVC:(NSString *)flg;
//加载完成调用
- (void) DataSourceDidFinishedLoading;
- (void)scrollViewDidScroll:(UIScrollView *)scrollView;
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate;

- (void)loadState;

@end


@protocol CWRefreshTableViewDelegate <NSObject>

//从新加载 egoRefreshTableHeaderDataSourceLastUpdated

- (BOOL)CWRefreshTableViewReloadTableViewDataSource:(CWRefreshTableViewPullType) refreshType;
- (NSUInteger) CWRefreshTableViewLastUpPage:(CWRefreshTableView*)view;

@end
