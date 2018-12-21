//
//  HYBaseViewController.h
//  Adonis_20181211_UsingLayer
//
//  Created by Adonis_HongYang on 2018/12/13.
//  Copyright © 2018年 Nikoyo (China）Electronics Systems Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

/** 随机颜色 */
#define UICOLOR_RANDOM  [UIColor colorWithRed:(arc4random()%255)/255.0 green:(arc4random()%255)/255.0 blue:(arc4random()%255)/255.0 alpha:1.0]

/** 角度转弧度 */
#define RADIANS_TO_DEGREES(x) ((x)/M_PI*180.0)

NS_ASSUME_NONNULL_BEGIN

@interface HYBaseViewController : UIViewController

@end

NS_ASSUME_NONNULL_END
