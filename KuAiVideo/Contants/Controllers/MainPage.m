//
//  MainPage.m
//  KuAiVideo
//
//  Created by mengdong on 14-9-16.
//  Copyright (c) 2014年 com.mengdongliuyaming. All rights reserved.
//

#import "MainPage.h"

#import "VideoPlayerPage.h"
#import "SettingPageViewController.h"


#import "UIViewAdditions.h"
#import "HeadersView.h"
#import "HomeScrollHeaderView.h"
#import "ItemsView.h"
#import "PersonalHeaderView.h"
#import "PersonalItemsView.h"
#import "VideoCellsView.h"


@interface MainPage ()
{
    
}
@property (nonatomic, strong) HeadersView * headersView;
@property (nonatomic, strong) UIScrollView * scrollView;
@property (nonatomic, strong) UIScrollView * personalScrollView;
@property (nonatomic, strong) PersonalHeaderView * personalHeaderView;
@property (nonatomic, strong) PersonalItemsView * personalItemsView;
@property (nonatomic, strong) VideoCellsView * seeRecordCellsView;
@property (nonatomic, strong) VideoCellsView * cacheVideoCellsView;

@property (nonatomic, strong) UIScrollView * homeScrollView;
@property (nonatomic, strong) HomeScrollHeaderView * homeHeaderView;

@property (nonatomic, strong) UIScrollView * categoryScrollView;


@property (nonatomic, strong) NSArray * headersAry;

@end

#define Gap 10
@implementation MainPage

#pragma mark - Initialization
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.view.backgroundColor = [UIColor whiteColor];
        // Custom initialization
    }
    return self;
}
- (void)initHeadersView
{
    self.headersAry = @[@"个人中心",@"酷爱首页",@"频道分类"];
    self.headersView = [[HeadersView alloc] initWithFrame:CGRectMake(0, 0, 320, 44) headers:_headersAry target:self action:@selector(responseHeadersAction:)];
    [_headersView changeButtonState:@"酷爱首页"];
    [self.view addSubview:_headersView];
}
- (void)initScrollView
{
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, _headersView.bottom, 320, 568-64-44)];
    _scrollView.backgroundColor = [UIColor redColor];
    _scrollView.contentSize = CGSizeMake(320*3, _scrollView.height);
    _scrollView.contentOffset = CGPointMake(320, 0);
    _scrollView.pagingEnabled = YES;
    _scrollView.directionalLockEnabled = YES;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.delegate = self;
    [self.view addSubview:_scrollView];
    
    [self  initPersonalScrollView];
    [self initHomeScrollView];
    [self initCategoryScrollView];
}
- (void)initHomeScrollView
{
    self.homeScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(320, 0, 320, _scrollView.height)];
    _homeScrollView.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:_homeScrollView];
    
    self.homeHeaderView = [[HomeScrollHeaderView alloc] initWithFrame:CGRectMake(Gap, Gap, 320 - Gap*2, 250) target:self action:@selector(responseHomeHeaderActions:)];
    [self.homeScrollView addSubview:_homeHeaderView];

    [self initHomeItemsViews];
}

- (void)initHomeItemsViews
{
    NSString * homeDataPath = [[NSBundle mainBundle] pathForResource:@"HomeItemsList" ofType:@"plist"];
    NSDictionary * homeDataDic = [NSDictionary dictionaryWithContentsOfFile:homeDataPath];
    
    NSArray * homeDataAry = [homeDataDic objectForKey:@"HomePage"];
    
    CGFloat homeScrollViewHeight = _homeHeaderView.bottom;
    for (int i = 0; i < homeDataAry.count; i ++) {
        NSDictionary * itemDic = [homeDataAry objectAtIndex:i];
        NSString * header = [itemDic objectForKey:@"header"];
        NSArray * items = [itemDic objectForKey:@"items"];
        ItemsView * itemsView = [[ItemsView alloc] initWithFrame:CGRectMake(_homeHeaderView.left, homeScrollViewHeight, _homeHeaderView.width, 10) header:header items:items itemsNumberOfLine:2 target:self action:@selector(responseHomeItemsActions:)];
        [_homeScrollView addSubview:itemsView];
        homeScrollViewHeight = itemsView.bottom + Gap;
    }
    _homeScrollView.contentSize = CGSizeMake(_homeScrollView.width, homeScrollViewHeight);
}

- (void)initPersonalScrollView
{
    self.personalScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, _scrollView.height)];
    _personalScrollView.backgroundColor = [UIColor greenColor];
    [_scrollView addSubview:_personalScrollView];
    
    self.personalHeaderView = [[PersonalHeaderView alloc] initWithFrame:CGRectMake(Gap, Gap, 320-Gap*2, 250) target:self action:@selector(responsePersonalHeaderActions:)];
    [_personalScrollView addSubview:_personalHeaderView];
    
    self.personalItemsView = [[PersonalItemsView alloc] initWithFrame:CGRectMake(_personalHeaderView.left, _personalHeaderView.bottom, _personalHeaderView.width, 30) target:self action:@selector(responsePersonalItemsActions:)];
    [_personalScrollView addSubview:_personalItemsView];
    
    NSString * path =[[ NSBundle mainBundle] pathForResource:@"PersonalVideosList" ofType:@"plist"];
    NSDictionary * cellsDataDic = [NSDictionary dictionaryWithContentsOfFile:path];
    NSArray * seeRecordsDataAry =[ cellsDataDic objectForKey:@"观看记录"];
    NSArray * cacheVideosDataAry =[ cellsDataDic objectForKey:@"我的缓存"];
    self.seeRecordCellsView = [[VideoCellsView alloc] initWithFrame:CGRectMake(_personalHeaderView.left, _personalItemsView.bottom + Gap, _personalHeaderView.width, 100) title:@"观看记录" describe:@"共有14条记录" cellDataAry:seeRecordsDataAry target:self action:@selector(responsePersonalSeeRecordCellsActions:)];
    [self.personalScrollView addSubview:_seeRecordCellsView];
    
    self.cacheVideoCellsView = [[VideoCellsView alloc] initWithFrame:CGRectMake(_personalHeaderView.left, _seeRecordCellsView.bottom + Gap, _personalHeaderView.width, 100) title:@"我的缓存" describe:@"已缓存2个视频，正在缓存3个视频" cellDataAry:cacheVideosDataAry target:self action:@selector(responsePersonalCacheVideoCellsAcrions:)];
    [self.personalScrollView addSubview:_cacheVideoCellsView];
    
    CGFloat personScrollViewHeight = _personalScrollView.height;
    for (UIView * view in _personalScrollView.subviews) {
        personScrollViewHeight = view.bottom + Gap;
    }
    self.personalScrollView.contentSize =CGSizeMake(self.personalScrollView.width, personScrollViewHeight);
}
- (void)initCategoryScrollView
{
    self.categoryScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(320*2, 0, 320, _scrollView.height)];
    [_scrollView addSubview:_categoryScrollView];
    
    NSString * path = [[NSBundle mainBundle] pathForResource:@"CategoriesList" ofType:@"plist"];
    NSDictionary * categoriesDataDic = [NSDictionary dictionaryWithContentsOfFile:path];
    //NSLog(@"categoryDataDic = %@", categoriesDataDic);
    NSString * header = [categoriesDataDic objectForKey:@"header"];
    //NSLog(@"header = %@", header);
    NSArray * array = [categoriesDataDic objectForKey:@"items"];
    //NSLog(@"array = %@", array);
    ItemsView * kuAiVideos = [[ItemsView alloc] initWithFrame:CGRectMake(Gap, Gap, _categoryScrollView.width - Gap*2, 300) header:header imageItems:array itemsNumberOfLine:3 target:self action:@selector(responseCategoryItemsActions:)];
    [_categoryScrollView addSubview:kuAiVideos];
    
    CGFloat  categoryScrollViewHeight = _categoryScrollView.height;
    for (UIView * view in _categoryScrollView.subviews) {
        categoryScrollViewHeight = view.bottom+Gap;
    }
    _categoryScrollView.contentSize = CGSizeMake(_categoryScrollView.width, categoryScrollViewHeight);
}

#pragma mark - Lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    [self initHeadersView];
    [self initScrollView];
    
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
}

#pragma mark- UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"scrollViewWillBeginDecelerating");
    CGFloat x = scrollView.contentOffset.x;
    NSInteger page = 0;
    if (x < 320/2) {
        page = 0;
    }else if (x > 320/2 && x < 320+320/2){
        page = 1;
    }else {
        page =2;
    }
    NSLog(@"page = %ld", (long)page);
    [_headersView changeButtonState:[_headersAry objectAtIndex:page]];
}
#pragma mark - Headers Actions
- (void)responseHeadersAction:(UIButton *)button
{
    NSLog(@"button.title = %@", button.titleLabel.text);
    NSString * header = button.titleLabel.text;
    [_headersView changeButtonState:header];
    
    for (int i = 0; i < _headersAry.count; i ++) {
        NSString * tempHeader = [_headersAry objectAtIndex:i];
        if ([header isEqualToString:tempHeader]) {
            _scrollView.contentOffset = CGPointMake(320*i, 0);
        }
    }
    
}
#pragma mark - Target Actions

- (void)responseHomeHeaderActions:(id)sender
{
    NSLog(@"responseHomeHeaderActions");
    if (!_videoPlayerPage) {
        self.videoPlayerPage = [[VideoPlayerPage alloc] initWithNibName:@"VideoPlayerPage" bundle:[NSBundle mainBundle]];
    }
    [self.navigationController pushViewController:_videoPlayerPage animated:YES];
}
- (void)responseHomeItemsActions:(id)sender
{
    NSLog(@"responseHomeItemsActions");
    if (!_videoPlayerPage) {
        self.videoPlayerPage = [[VideoPlayerPage alloc] initWithNibName:@"VideoPlayerPage" bundle:[NSBundle mainBundle]];
    }
    [self.navigationController pushViewController:_videoPlayerPage animated:YES];
}
- (void)responsePersonalItemsActions:(id)sender
{
    NSLog(@"responsePersonalItemsActions");
}
- (void)responsePersonalHeaderActions:(id)sender
{
    NSLog(@"responsePersonalHeaderActions");
    SettingPageViewController * settingPage = [[SettingPageViewController alloc] initWithNibName:@"SettingPageViewController" bundle:[NSBundle mainBundle]];
    [self.navigationController pushViewController:settingPage animated:YES];
    
}
- (void)responsePersonalSeeRecordCellsActions:(id)sender
{
    NSLog(@"responsePersonalSeeRecordCellsActions");
}
- (void)responsePersonalCacheVideoCellsAcrions:(id)sender
{
    NSLog(@"responsePersonalCacheVideoCellsAcrions");
}
- (void)responseCategoryItemsActions:(id)sender
{
    NSLog(@"responseCategoryItemsActions");
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
