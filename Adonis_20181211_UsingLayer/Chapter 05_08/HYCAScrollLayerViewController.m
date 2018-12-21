//
//  HYCAScrollLayerViewController.m
//  Adonis_20181211_UsingLayer
//
//  Created by Adonis_HongYang on 2018/12/21.
//  Copyright © 2018年 Nikoyo (China）Electronics Systems Co., Ltd. All rights reserved.
//

#import "HYCAScrollLayerViewController.h"
#import "HYScrollLayerView.h"

@interface HYCAScrollLayerViewController ()

@end

@implementation HYCAScrollLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if ([self.navigationItem.title isEqualToString:@"CATiledLayer"]) {
        
    } else if ([self.navigationItem.title isEqualToString:@"CAScrollLayer"]) {
        HYScrollLayerView *view = [[HYScrollLayerView alloc] initWithFrame:CGRectMake(10, 100, 1500, 1500)];
        view.backgroundColor = [UIColor greenColor];
        
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ImageFlower"]];
        imageView.frame = view.bounds;
        [view addSubview:imageView];
        [self.view addSubview:view];
    }
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
