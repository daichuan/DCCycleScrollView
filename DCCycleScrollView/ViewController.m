//
//  ViewController.m
//  DCCycleScrollView
//
//  Created by cheyr on 2018/2/27.
//  Copyright © 2018年 cheyr. All rights reserved.
//

#import "ViewController.h"
#import "DCCycleScrollView.h"
#import "DCPushVC.h"
@interface ViewController ()<DCCycleScrollViewDelegate>
@property (nonatomic,strong) UIPageControl *pageControl;
@property (nonatomic,strong) DCCycleScrollView *banner;
@property (nonatomic,strong) NSArray *imageArr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    self.view.backgroundColor = [UIColor whiteColor];

    DCCycleScrollView *banner = [DCCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 135) shouldInfiniteLoop:YES imageGroups:self.imageArr];
//    banner.placeholderImage = [UIImage imageNamed:@"placeholderImage"];
//    banner.cellPlaceholderImage = [UIImage imageNamed:@"placeholderImage"];
    banner.autoScrollTimeInterval = 3;
    banner.autoScroll = YES;
    banner.isZoom = YES;
    banner.itemSpace = 0;
    banner.imgCornerRadius = 10;
    banner.itemWidth = self.view.frame.size.width - 100;
    banner.delegate = self;
    //隐藏pageControl
    banner.pageControl.hidden = YES;
    self.banner = banner;
    [self.view addSubview:banner];
    
    //添加pageControl
    [self setupPageControl];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)setupPageControl
{
    self.pageControl.frame = CGRectMake(0, 115, self.view.frame.size.width, 10);
    self.pageControl.numberOfPages = self.imageArr.count;
    self.pageControl.currentPage = 0;
    [self.banner addSubview:self.pageControl];
}


#pragma mark cycleScrollView delegate
-(void)cycleScrollView:(DCCycleScrollView *)cycleScrollView currentPageIndex:(NSInteger)index
{
    //设置当前页
    self.pageControl.currentPage = index;
}

//点击图片的代理
-(void)cycleScrollView:(DCCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    DCPushVC *vc = [[DCPushVC alloc]init];
    vc.title = [NSString stringWithFormat:@"第%ld张图片",index];
    [self.navigationController pushViewController:vc animated:YES];
}


#pragma mark setter

-(UIPageControl *)pageControl
{
    if(_pageControl == nil)
    {
        _pageControl = [[UIPageControl alloc]init];
        _pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
        _pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
    }
    return _pageControl;
}

-(NSArray *)imageArr
{
    if(_imageArr == nil)
    {
        _imageArr = @[@"h1.jpg",
                      @"h2.jpg",
                      @"h3.jpg",
                      @"h4.jpg",
                      ];
    }
    return _imageArr;
}
@end
