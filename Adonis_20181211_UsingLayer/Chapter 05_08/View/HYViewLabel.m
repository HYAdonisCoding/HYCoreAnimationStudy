//
//  HYViewLabel.m
//  Adonis_20181211_UsingLayer
//
//  Created by Adonis_HongYang on 2018/12/14.
//  Copyright © 2018年 Nikoyo (China）Electronics Systems Co., Ltd. All rights reserved.
//

#import "HYViewLabel.h"

@interface HYViewLabel ()

/** 图层 */
@property (nonatomic, strong) CATextLayer *textLayer;

@end

@implementation HYViewLabel

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self makeInterface];
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self makeInterface];
    }
    return self;
}

- (void)setText:(NSString *)text {
    _text = text;
    self.textLayer.string = text;
}

- (void)setFrame:(CGRect)frame {
    
    [super setFrame:frame];
    self.textLayer.frame = self.bounds;
}

- (void)setFont:(UIFont *)font {
    _font = font;
    //set layer font
    CFStringRef fontName = (__bridge CFStringRef)font.fontName;
    CGFontRef fontRef = CGFontCreateWithFontName(fontName);
    self.textLayer.font = fontRef;
    self.textLayer.fontSize = font.pointSize;
    CGFontRelease(fontRef);
}

- (void)setAttributeString:(NSAttributedString *)attributeString {
    _attributeString = attributeString;
    self.textLayer.string = attributeString;
}


- (void)makeInterface {
    //create a text layer
    self.textLayer = [CATextLayer layer];
    self.textLayer.frame = self.bounds;
    [self.layer addSublayer:self.textLayer];
    
    //set text attributes
//    self.textLayer.foregroundColor = [UIColor blackColor].CGColor;
    self.textLayer.alignmentMode = kCAAlignmentJustified;
    self.textLayer.wrapped = YES;
    //以Retina的质量来显示文字，我们就得手动地设置CATextLayer的contentsScale属性
    self.textLayer.contentsScale = [UIScreen mainScreen].scale;
    
    //choose a font
    UIFont *font = [UIFont systemFontOfSize:12.0];
    
    //set layer font
    CFStringRef fontName = (__bridge CFStringRef)font.fontName;
    CGFontRef fontRef = CGFontCreateWithFontName(fontName);
    self.textLayer.font = fontRef;
    self.textLayer.fontSize = font.pointSize;
    CGFontRelease(fontRef);
    
    //set layer text
    self.textLayer.string = self.text;
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
