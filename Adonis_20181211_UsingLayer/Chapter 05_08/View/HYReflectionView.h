//
//  HYReflectionView.h
//  Adonis_20181211_UsingLayer
//
//  Created by Adonis_HongYang on 2018/12/21.
//  Copyright © 2018年 Nikoyo (China）Electronics Systems Co., Ltd. All rights reserved.
//

#import "HYBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface HYReflectionView : HYBaseView

@property (nonatomic, assign) CGFloat reflectionGap;
@property (nonatomic, assign) CGFloat reflectionScale;
@property (nonatomic, assign) CGFloat reflectionAlpha;
@property (nonatomic, assign) BOOL dynamic;

- (void)update;

@end

NS_ASSUME_NONNULL_END
