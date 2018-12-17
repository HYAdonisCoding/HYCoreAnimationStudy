//
//  HYLayerAndViewController.m
//  Adonis_20181211_UsingLayer
//
//  Created by Adonis_HongYang on 2018/12/11.
//  Copyright © 2018年 Nikoyo (China）Electronics Systems Co., Ltd. All rights reserved.
//

#import "HYLayerAndViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface HYLayerAndViewController ()

@property (weak, nonatomic) IBOutlet UIView *layerView;

@end

@implementation HYLayerAndViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}



- (void)normalLayer {
    //create sublayer
    CALayer *blueLayer = [CALayer layer];
    blueLayer.frame = CGRectMake(50.0f, 50.0f, 100.0f, 100.0f);
    blueLayer.backgroundColor = [UIColor blueColor].CGColor;
    //add it to our view
    //    [self.layerView.layer addSublayer:blueLayer];
    
    //load an image
    UIImage *image = [UIImage imageNamed:@"ImageFlower"];
    
    //add it directly to our view's layer
    self.layerView.layer.contents = (__bridge id _Nullable)(image.CGImage);
    //    self.layerView.layer.contentsGravity = kCAGravityResizeAspect;
    //center the image
    self.layerView.layer.contentsGravity = kCAGravityCenter;
    
    //set the contentsScale to match image
    //    self.layerView.layer.contentsScale = image.scale;;
    self.layerView.layer.contentsScale = [UIScreen mainScreen].scale;
    //是否显示超出边界的内容
    self.layerView.layer.masksToBounds = YES;
    
    self.layerView.layer.contentsRect = CGRectMake(0, 0, 0.5, .5);
    
}

@end
