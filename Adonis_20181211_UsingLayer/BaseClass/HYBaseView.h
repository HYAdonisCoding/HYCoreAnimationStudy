//
//  HYBaseView.h
//  Adonis_20181211_UsingLayer
//
//  Created by Adonis_HongYang on 2018/12/21.
//  Copyright © 2018年 Nikoyo (China）Electronics Systems Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HYBaseView : UIView

/** 绘制页面 */
- (void)makeInterface;


/**
 基本设置
 */
- (void)setUp;

/**
 是否有子视图在滚动
 
 @param view 视图
 @return 是否滚动
 */
- (BOOL)anySubViewScrolling:(UIView *)view;


/**
 播放声音或者振动
 */
- (void)playSystemSound;

@end

NS_ASSUME_NONNULL_END
