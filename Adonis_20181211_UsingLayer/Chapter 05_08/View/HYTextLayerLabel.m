//
//  HYTextLayerLabel.m
//  Adonis_20181211_UsingLayer
//
//  Created by Adonis_HongYang on 2018/12/14.
//  Copyright © 2018年 Nikoyo (China）Electronics Systems Co., Ltd. All rights reserved.
//

#import "HYTextLayerLabel.h"
#import <QuartzCore/QuartzCore.h>

@implementation HYTextLayerLabel

+ (Class)layerClass
{
    //this makes our label create a CATextLayer
    //instead of a regular CALayer for its backing layer
    return [CATextLayer class];
}

- (CATextLayer *)textLayer
{
    return (CATextLayer *)self.layer;
}

- (void)setUp
{
    //set defaults from UILabel settings
    self.text = self.text;
    self.textColor = self.textColor;
    self.font = self.font;
    if (self.attributedText.length > 0) {
        self.attributedText = self.attributedText;
    }
    
    //we should really derive these from the UILabel settings too
    //but that's complicated, so for now we'll just hard-code them
    [self textLayer].alignmentMode = kCAAlignmentJustified;
    [self textLayer].wrapped = YES;
    
    [self.layer display];
}

- (id)initWithFrame:(CGRect)frame
{
    //called when creating label programmatically
    if (self = [super initWithFrame:frame])
    {
        self.backgroundColor = [UIColor whiteColor];
        [self setUp];
    }
    return self;
}

- (void)awakeFromNib
{
    //called when creating label using Interface Builder
    [self setUp];
    [super awakeFromNib];
}

- (void)setText:(NSString *)text
{
    super.text = text;
    
    //set layer text
    [self textLayer].string = text;
}

- (void)setAttributedText:(NSAttributedString *)attributedText {
    super.attributedText = attributedText;
    
    [self textLayer].string = attributedText;
}

- (void)setTextColor:(UIColor *)textColor
{
    super.textColor = textColor;
    
    //set layer text color
    [self textLayer].foregroundColor = textColor.CGColor;
}

- (void)setFont:(UIFont *)font
{
    super.font = font;
    
    //set layer font
    CFStringRef fontName = (__bridge CFStringRef)font.fontName;
    CGFontRef fontRef = CGFontCreateWithFontName(fontName);
    [self textLayer].font = fontRef;
    [self textLayer].fontSize = font.pointSize;
    CGFontRelease(fontRef);
}

//- (void)setBackgroundColor:(UIColor *)backgroundColor {
//    super.backgroundColor = backgroundColor;
//    
//    [self textLayer].backgroundColor = backgroundColor.CGColor;
//}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
