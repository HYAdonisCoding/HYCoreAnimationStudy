//
//  HYReflectionView.m
//  Adonis_20181211_UsingLayer
//
//  Created by Adonis_HongYang on 2018/12/21.
//  Copyright © 2018年 Nikoyo (China）Electronics Systems Co., Ltd. All rights reserved.
//

#import "HYReflectionView.h"
#import <QuartzCore/QuartzCore.h>
#import <Availability.h>

#if !__has_feature(objc_arc)
#error This class requires automatic reference counting
#endif


#pragma GCC diagnostic ignored "-Wreceiver-is-weak"
#pragma GCC diagnostic ignored "-Warc-repeated-use-of-weak"
#pragma GCC diagnostic ignored "-Wobjc-missing-property-synthesis"
#pragma GCC diagnostic ignored "-Wdirect-ivar-access"
#pragma GCC diagnostic ignored "-Wunused-macros"
#pragma GCC diagnostic ignored "-Wconversion"
#pragma GCC diagnostic ignored "-Wformat-nonliteral"
#pragma GCC diagnostic ignored "-Wgnu"

@interface HYReflectionView ()

@property (nonatomic, strong) CAGradientLayer *gradientLayer;
@property (nonatomic, strong) UIImageView *reflectionView;


@end

@implementation HYReflectionView

+ (Class)layerClass {
    return [CAReplicatorLayer class];
}

- (void)update {
    if (_dynamic)
    {
        //remove gradient view
        [_reflectionView removeFromSuperview];
        self.reflectionView = nil;
        
        //update instances
        CAReplicatorLayer *layer = (CAReplicatorLayer *)self.layer;
        layer.shouldRasterize = YES;
        layer.rasterizationScale = [UIScreen mainScreen].scale;
        layer.instanceCount = 2;
        CATransform3D transform = CATransform3DIdentity;
        transform = CATransform3DTranslate(transform, 0.0f, layer.bounds.size.height + _reflectionGap, 0.0f);
        transform = CATransform3DScale(transform, 1.0f, -1.0f, 0.0f);
        layer.instanceTransform = transform;
        layer.instanceAlphaOffset = _reflectionAlpha - 1.0f;
        
        //create gradient layer
        if (!_gradientLayer)
        {
            _gradientLayer = [[CAGradientLayer alloc] init];
            self.layer.mask = _gradientLayer;
            _gradientLayer.colors = @[(__bridge id)[UIColor blackColor].CGColor,
                                      (__bridge id)[UIColor blackColor].CGColor,
                                      (__bridge id)[UIColor clearColor].CGColor];
        }
        
        //update mask
        [CATransaction begin];
        [CATransaction setDisableActions:YES]; // don't animate
        CGFloat total = layer.bounds.size.height * 2.0f + _reflectionGap;
        CGFloat halfWay = (layer.bounds.size.height + _reflectionGap) / total - 0.01f;
        _gradientLayer.frame = CGRectMake(0.0f, 0.0f, self.bounds.size.width, total);
        _gradientLayer.locations = @[@0.0f, @(halfWay), @(halfWay + (1.0f - halfWay) * _reflectionScale)];
        [CATransaction commit];
    }
    else
    {
        //remove gradient layer
        self.layer.mask = nil;
        self.gradientLayer = nil;
        
        //update instances
        CAReplicatorLayer *layer = (CAReplicatorLayer *)self.layer;
        layer.shouldRasterize = NO;
        layer.instanceCount = 1;
        
        //create reflection view
        if (!_reflectionView)
        {
            _reflectionView = [[UIImageView alloc] initWithFrame:self.bounds];
            _reflectionView.contentMode = UIViewContentModeScaleToFill;
            _reflectionView.userInteractionEnabled = NO;
            [self addSubview:_reflectionView];
        }
        
        //get reflection bounds
        CGSize size = CGSizeMake(self.bounds.size.width, self.bounds.size.height * _reflectionScale);
        if (size.height > 0.0f && size.width > 0.0f)
        {
            //create gradient mask
            UIGraphicsBeginImageContextWithOptions(size, YES, 0.0f);
            CGContextRef gradientContext = UIGraphicsGetCurrentContext();
            CGFloat colors[] = {1.0f, 1.0f, 0.0f, 1.0f};
            CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceGray();
            CGGradientRef gradient = CGGradientCreateWithColorComponents(colorSpace, colors, NULL, 2);
            CGPoint gradientStartPoint = CGPointMake(0.0f, 0.0f);
            CGPoint gradientEndPoint = CGPointMake(0.0f, size.height);
            CGContextDrawLinearGradient(gradientContext, gradient, gradientStartPoint,
                                        gradientEndPoint, kCGGradientDrawsAfterEndLocation);
            CGImageRef gradientMask = CGBitmapContextCreateImage(gradientContext);
            CGGradientRelease(gradient);
            CGColorSpaceRelease(colorSpace);
            UIGraphicsEndImageContext();
            
            //create drawing context
            UIGraphicsBeginImageContextWithOptions(size, NO, 0.0f);
            CGContextRef context = UIGraphicsGetCurrentContext();
            CGContextScaleCTM(context, 1.0f, -1.0f);
            CGContextTranslateCTM(context, 0.0f, -self.bounds.size.height);
            
            //clip to gradient
            CGContextClipToMask(context, CGRectMake(0.0f, self.bounds.size.height - size.height,
                                                    size.width, size.height), gradientMask);
            CGImageRelease(gradientMask);
            
            //draw reflected layer content
            [self.layer renderInContext:context];
            
            //capture resultant image
            _reflectionView.image = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
        }
        
        //update reflection
        _reflectionView.alpha = _reflectionAlpha;
        _reflectionView.frame = CGRectMake(0, self.bounds.size.height + _reflectionGap, size.width, size.height);
    }
}
    
- (void)setUp {
    
    //set default properties
    _reflectionGap = 4.0f;
    _reflectionScale = 0.5f;
    _reflectionAlpha = 0.5f;
    
    //update reflection
    [self setNeedsLayout];
    
    //configure replicator
//    CAReplicatorLayer *layer = (CAReplicatorLayer *)self.layer;
//    layer.instanceCount = 2;
//
//    //move reflection instance below original and flip vertically
//    CATransform3D transform = CATransform3DIdentity;
//    CGFloat verticalOffset = self.bounds.size.height + 2;
//    transform = CATransform3DTranslate(transform, 0, verticalOffset, 0);
//    transform = CATransform3DScale(transform, 1, -1, 0);
//    layer.instanceTransform = transform;
//
//    //reduce alpha of reflection layer
//    layer.instanceAlphaOffset = -0.6;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setUp];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
}


- (void)setReflectionGap:(CGFloat)reflectionGap {
    _reflectionGap = reflectionGap;
    [self setNeedsLayout];
}

- (void)setReflectionScale:(CGFloat)reflectionScale {
    _reflectionScale = reflectionScale;
    [self setNeedsLayout];
}

- (void)setReflectionAlpha:(CGFloat)reflectionAlpha {
    _reflectionAlpha = reflectionAlpha;
    [self setNeedsLayout];
}

- (void)setDynamic:(BOOL)dynamic {
    _dynamic = dynamic;
    [self setNeedsLayout];
}

- (void)layoutSubviews {
    [self update];
    [super layoutSubviews];
}


- (void)awakeFromNib {
    [super awakeFromNib];
    [self setUp];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
