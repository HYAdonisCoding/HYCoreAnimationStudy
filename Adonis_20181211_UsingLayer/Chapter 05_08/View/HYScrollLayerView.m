//
//  HYScrollLayerView.m
//  Adonis_20181211_UsingLayer
//
//  Created by Adonis_HongYang on 2018/12/21.
//  Copyright © 2018年 Nikoyo (China）Electronics Systems Co., Ltd. All rights reserved.
//

#import "HYScrollLayerView.h"

@implementation HYScrollLayerView

+ (Class)layerClass {
    return [CAScrollLayer class];
}

- (void)setUp {
    //enable clipping
    self.layer.masksToBounds = YES;
    
    //attach pan gesture recognizer
    UIPanGestureRecognizer *recognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self addGestureRecognizer:recognizer];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setUp];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setUp];
}


- (void)pan:(UIPanGestureRecognizer *)recognizer {
    //get the offset by subtracting the pan gesture
    //translation from the current bounds origin
    CGPoint offset = self.bounds.origin;
    offset.x -= [recognizer translationInView:self].x;
    offset.y -= [recognizer translationInView:self].y;
    
    //scroll the layer
    [(CAScrollLayer *)self.layer scrollPoint:offset];
    
    //reset the pan gesture translation
    [recognizer setTranslation:CGPointZero inView:self];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
