//
//  HYTransform3DViewController.m
//  Adonis_20181211_UsingLayer
//
//  Created by Adonis_HongYang on 2018/12/14.
//  Copyright © 2018年 Nikoyo (China）Electronics Systems Co., Ltd. All rights reserved.
//

#import "HYTransform3DViewController.h"

@interface HYTransform3DViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *layerView;

@end

@implementation HYTransform3DViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)rotate3D:(id)sender {
    //rotate the layer 45 degrees along the Y axis
    CATransform3D transform = CATransform3DMakeRotation(M_PI_4, 0, 1, 0);
    self.layerView.layer.transform = transform;
}
- (IBAction)reset:(id)sender {
    //reset rotate the layer 45 degrees along the Y axis
    CATransform3D transform = CATransform3DMakeRotation(0, 0, 1, 0);
    self.layerView.layer.transform = transform;
    
}
// MARK: - 透视投影
- (IBAction)perspective:(id)sender {
    //create a new transform
    CATransform3D transform = CATransform3DIdentity;
    //apply perspective
    transform.m34 = - 1.0 / 500.0;
    //rotate by 45 degrees along the Y axis
    transform = CATransform3DRotate(transform, M_PI_4, 0, 1, 0);
    //apply to layer
    self.layerView.layer.transform = transform;
}

// MARK: - be背面
- (IBAction)backLayer:(id)sender {
    /** CALayer有一个叫做doubleSided的属性来控制图层的背面是否要被绘制。这是一个BOOL类型，默认为YES，如果设置为NO，那么当图层正面从相机视角消失的时候，它将不会被绘制。 */
    self.layerView.layer.doubleSided = !self.layerView.layer.doubleSided;
    CATransform3D transform = CATransform3DMakeRotation(M_PI, 0, 1, 0);
    self.layerView.layer.transform = transform;
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
