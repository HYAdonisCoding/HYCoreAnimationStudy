//
//  HYCAReplicatorLayerViewController.m
//  Adonis_20181211_UsingLayer
//
//  Created by Adonis_HongYang on 2018/12/20.
//  Copyright © 2018年 Nikoyo (China）Electronics Systems Co., Ltd. All rights reserved.
//

#import "HYCAReplicatorLayerViewController.h"
#import "HYReflectionView.h"

#define kwidth 50
#define kInstanceCount 20

@interface HYCAReplicatorLayerViewController ()
@property (weak, nonatomic) IBOutlet UIView *containerView;

@end

@implementation HYCAReplicatorLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if ([self.navigationItem.title isEqualToString:@"反射"]) {
        self.navigationItem.rightBarButtonItem = nil;
        self.view.backgroundColor = [UIColor blackColor];
        self.containerView.backgroundColor = [UIColor blackColor];
        
        HYReflectionView *view = [[HYReflectionView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];

        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Anchor"]];
        
        imageView.frame = view.bounds;
        [view addSubview:imageView];
        [self.view addSubview:view];
        
    } else {
        
        //create a replicator layer and add it to pur view
        CAReplicatorLayer *replicator = [CAReplicatorLayer layer];
        replicator.frame = self.containerView.bounds;
        [self.containerView.layer addSublayer:replicator];
        
        //configure the replicator
        replicator.instanceCount = kInstanceCount;
        
        //apply a transform for each instance
        CATransform3D transform = CATransform3DIdentity;
        transform = CATransform3DTranslate(transform, 0, kwidth * .618, 0);
        transform = CATransform3DRotate(transform, M_PI * 2 / kInstanceCount, 0, 0, 1);
        transform = CATransform3DTranslate(transform, 0, -kwidth * .618, 0);
        replicator.instanceTransform = transform;
        
        //apply a color shift for each instance
        replicator.instanceBlueOffset = -0.1;
        replicator.instanceGreenOffset = -0.1;
        replicator.instanceRedOffset = -0.01;
        
        //create a sublayer and place it inside the replicator
        CALayer * layer = [CALayer layer];
        //CGRectGetWidth(self.containerView.bounds) / 2
        layer.frame = CGRectMake(CGRectGetMidX(self.containerView.bounds), 0, kwidth, kwidth);
        layer.backgroundColor = [UIColor magentaColor].CGColor;
        [replicator addSublayer:layer];
    }
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    NSString *title = [(UIBarButtonItem *)sender title];
    [segue destinationViewController].navigationItem.title = title;
}


@end
