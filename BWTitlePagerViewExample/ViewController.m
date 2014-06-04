//
//  ViewController.m
//  BWTitlePagerViewExample
//
//  Created by cesar4 on 4/06/14.
//  Copyright 2014 brunow. All rights reserved.
//

#import "ViewController.h"

#import "BWTitlePagerView.h"

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@interface ViewController ()

@property (nonatomic, strong) UIScrollView *scrollView;

@end


////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation ViewController

////////////////////////////////////////////////////////////////////////////////////////////////////
- (id)init {
    self = [super init];
    if (self) {
        self.title = nil;
    }
    return self;
}

////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)loadView {
    self.scrollView = [[UIScrollView alloc] init];
    self.scrollView.pagingEnabled = YES;
    self.view = self.scrollView;
}

////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)viewDidLoad {
    [super viewDidLoad];
    
    BWTitlePagerView *pagingTitleView = [[BWTitlePagerView alloc] init];
    pagingTitleView.frame = CGRectMake(0, 0, 200, 40);
    pagingTitleView.font = [UIFont systemFontOfSize:18];
    pagingTitleView.textColor = [UIColor redColor];
    pagingTitleView.pageIndicatorTintColor = [UIColor darkGrayColor];
    pagingTitleView.currentPageIndicatorTintColor = [UIColor blackColor];
    [pagingTitleView observeScrollView:self.scrollView];
    [pagingTitleView addTitles:@[ @"Questions", @"Messages" ]];
    
    self.navigationItem.titleView = pagingTitleView;
}

////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self.scrollView showsHorizontalScrollIndicator];
}

////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width*2, self.view.frame.size.height-64);
}


@end
