//
//  HYCAGradientLayerViewController.m
//  Adonis_20181211_UsingLayer
//
//  Created by Adonis_HongYang on 2018/12/20.
//  Copyright © 2018年 Nikoyo (China）Electronics Systems Co., Ltd. All rights reserved.
//

#import "HYCAGradientLayerViewController.h"

@interface HYCAGradientLayerViewController ()
@property (weak, nonatomic) IBOutlet UIView *containerView;

@end

@implementation HYCAGradientLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if ([self.navigationItem.title isEqualToString:@"彩虹🌈"]) {
        self.navigationItem.rightBarButtonItem = nil;

        //create gradient layer and add it to our container view
        CAGradientLayer *gradientLayer = [CAGradientLayer layer];
        gradientLayer.frame = self.containerView.bounds;
        [self.containerView.layer addSublayer:gradientLayer];

        //set gradient colors
        gradientLayer.colors = @[(__bridge id)[UIColor redColor].CGColor,(__bridge id)[UIColor blueColor].CGColor, (__bridge id)[UIColor greenColor].CGColor];

        //set location
        gradientLayer.locations = @[@0.0, @0.25, @0.5];

        //set gradient start and end points
        gradientLayer.startPoint = CGPointMake(0, 0);
        gradientLayer.endPoint = CGPointMake(1, 1);

        NSLog(@"%@", self.navigationItem.title);
    }
    else
    {
        
        //create gradient layer and add it to our container view
        CAGradientLayer *gradientLayer = [CAGradientLayer layer];
        gradientLayer.frame = self.containerView.bounds;
        [self.containerView.layer addSublayer:gradientLayer];
        
        //set gradient colors
        gradientLayer.colors = @[(__bridge id)[UIColor redColor].CGColor,(__bridge id)[UIColor blueColor].CGColor];
        
        //set gradient start and end points
        gradientLayer.startPoint = CGPointMake(0, 0);
        gradientLayer.endPoint = CGPointMake(1, 1);
        NSLog(@"%@", self.navigationItem.title);
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
