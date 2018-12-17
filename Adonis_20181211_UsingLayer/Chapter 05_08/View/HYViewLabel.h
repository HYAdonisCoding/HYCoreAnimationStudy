//
//  HYViewLabel.h
//  Adonis_20181211_UsingLayer
//
//  Created by Adonis_HongYang on 2018/12/14.
//  Copyright © 2018年 Nikoyo (China）Electronics Systems Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HYViewLabel : UIView

/** 文字 */
@property (nonatomic, copy) NSString *text;

/** 字体 */
@property (nonatomic, strong) UIFont *font;

/** 富文本 */
@property (nonatomic, copy) NSAttributedString *attributeString;


@end

NS_ASSUME_NONNULL_END
