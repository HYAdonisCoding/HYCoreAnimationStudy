//
//  HYTransformViewController.m
//  Adonis_20181211_UsingLayer
//
//  Created by Adonis_HongYang on 2018/12/14.
//  Copyright © 2018年 Nikoyo (China）Electronics Systems Co., Ltd. All rights reserved.
//

#import "HYTransformViewController.h"

@interface HYTransformViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation HYTransformViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //rotate the layer 45 degrees
}
- (IBAction)reset:(id)sender {
    //恢复初始位置
    CGAffineTransform transform = CGAffineTransformMakeRotation(RADIANS_TO_DEGREES(0));
    self.imageView.layer.affineTransform = transform;
    
    //混合变换 -- 先缩小50%，再旋转30度，最后向右移动200个像素
    //create a new transform
    transform = CGAffineTransformIdentity;
    //scale by 50%
    transform = CGAffineTransformScale(transform, 1, 1);
    //rotate by 30 degrees
    transform = CGAffineTransformRotate(transform, RADIANS_TO_DEGREES(0));
    //translate by 200 points
    transform = CGAffineTransformTranslate(transform, 0, 0);
    //apply transform to layer
    self.imageView.layer.affineTransform = transform;

}
- (IBAction)rotate:(id)sender {
    CGAffineTransform transform = CGAffineTransformMakeRotation(M_PI_4);
    self.imageView.layer.affineTransform = transform;
}
- (IBAction)mixRotate:(id)sender {
    //混合变换 -- 先缩小50%，再旋转30度，最后向右移动200个像素
    //create a new transform
    CGAffineTransform transform = CGAffineTransformIdentity;
    //scale by 50%
    transform = CGAffineTransformScale(transform, 0.5, 0.5);
    //rotate by 30 degrees
    transform = CGAffineTransformRotate(transform, M_PI / 180.0 * 30.0);
    //translate by 200 points
    transform = CGAffineTransformTranslate(transform, 200, 0);
    //apply transform to layer
    self.imageView.layer.affineTransform = transform;
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
