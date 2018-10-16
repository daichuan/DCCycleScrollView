//
//  DCCycleScrollView.h
//  DCCycleScrollView
//
//  Created by cheyr on 2018/2/27.
//  Copyright © 2018年 cheyr. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DCCycleScrollView;
@protocol DCCycleScrollViewDelegate <NSObject>
/** 点击图片回调 */
- (void)cycleScrollView:(DCCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index;

@optional
/**当图片手动滑动或自动切换时回调，返回当前页码，用于外部自定义pageControl时，切换当前页使用*/
- (void)cycleScrollView:(DCCycleScrollView *)cycleScrollView currentPageIndex:(NSInteger)index;
@end


@interface DCCycleScrollView : UIView
/**是否无限循环，默认yes  如果设置成NO，则需要自己设置collectionView的pagingEnabled属性*/
@property (nonatomic,assign) BOOL infiniteLoop;
//*是否自动滑动，默认yes,如果infiniteLoop = NO，则autoScroll=NO；不能设置成YES；
@property (nonatomic,assign) BOOL autoScroll;
/**是否缩放，默认不缩放*/
@property (nonatomic,assign) BOOL isZoom;
//*自动滚动间隔时间，默认2s
@property (nonatomic,assign) CGFloat autoScrollTimeInterval;
//cell宽度
@property (nonatomic,assign) CGFloat itemWidth;
//cell间距
@property (nonatomic,assign) CGFloat itemSpace;
//imagView圆角，默认为0；
@property (nonatomic,assign) CGFloat imgCornerRadius;
//分页控制器
@property (nonatomic,strong) UIPageControl *pageControl;
/** 占位图，用于网络未加载到图片时 */
@property (nonatomic, strong) UIImage *placeholderImage;
/** cell的占位图，用于网络未加载到图片时*/
@property (nonatomic,strong) UIImage *cellPlaceholderImage;
/** 轮播图片的ContentMode，默认为 UIViewContentModeScaleToFill */
@property (nonatomic, assign) UIViewContentMode bannerImageViewContentMode;
//代理方法
@property (nonatomic,weak) id<DCCycleScrollViewDelegate> delegate;


/**初始化方法 如果infiniteLoop设置成NO，则需要调用setCollectionViewPagingEnabled方法设置pagingEnabled属性，默认pagingEnabled是NO*/
+(instancetype)cycleScrollViewWithFrame:(CGRect)frame shouldInfiniteLoop:(BOOL)infiniteLoop imageGroups:(NSArray<NSString *> *)imageGroups;

/**设置分页滑动属性（如果infiniteLoop属性为yes，则设置无效）*/
-(void)setCollectionViewPagingEnabled:(BOOL)pagingEnabled;
@end
