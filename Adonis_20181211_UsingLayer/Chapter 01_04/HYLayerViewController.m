//
//  HYLayerViewController.m
//  Adonis_20181211_UsingLayer
//
//  Created by Adonis_HongYang on 2018/12/11.
//  Copyright © 2018年 Nikoyo (China）Electronics Systems Co., Ltd. All rights reserved.
//

#import "HYLayerViewController.h"

@interface HYLayerViewController ()
@property (weak, nonatomic) IBOutlet UIView *iglooView;
@property (weak, nonatomic) IBOutlet UIView *coneView;
@property (weak, nonatomic) IBOutlet UIView *anchorView;
@property (weak, nonatomic) IBOutlet UIView *shipView;

@end

@implementation HYLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self loadSprite];
}


- (void)addSpriteImage:(UIImage *)image withContentRect:(CGRect)rect ￼toLayer:(CALayer *)layer {
    //set image
    layer.contents = (__bridge id)image.CGImage;
    
    //scale contents to fit
    layer.contentsGravity = kCAGravityResizeAspect;
//    layer.contentsScale = image.scale;;
    
    //set contentsRect
    layer.contentsRect = rect;
    
}

- (void)loadSprite {
    //load sprite sheet
    UIImage *image = [UIImage imageNamed:@"Sprites"];
    //set igloo sprite
    [self addSpriteImage:image withContentRect:CGRectMake(0, 0, .5, .5) ￼toLayer:self.iglooView.layer];
    //set cone sprite
    [self addSpriteImage:image withContentRect:CGRectMake(.5, 0, .5, .5) ￼toLayer:self.coneView.layer];
    //set anchor sprite
    [self addSpriteImage:image withContentRect:CGRectMake(0, .5, .5, .5) ￼toLayer:self.anchorView.layer];
    //set spaceship sprite
    [self addSpriteImage:image withContentRect:CGRectMake(0.5, 0.5, 0.5, 0.5) ￼toLayer:self.shipView.layer];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
