//
//  HYCoordinateSystemController.m
//  Adonis_20181211_UsingLayer
//
//  Created by Adonis_HongYang on 2018/12/13.
//  Copyright © 2018年 Nikoyo (China）Electronics Systems Co., Ltd. All rights reserved.
//

#import "HYCoordinateSystemController.h"

@interface HYCoordinateSystemController ()

@property (weak, nonatomic) IBOutlet UIView *greenView;
@property (weak, nonatomic) IBOutlet UIView *redView;

/** 点击layer还是View */
@property (nonatomic, assign) BOOL isLayer;

@end

@implementation HYCoordinateSystemController
- (IBAction)actionChange:(UISwitch *)sender {
    self.isLayer = !self.isLayer;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.greenView.layer.zPosition = 1.0;
    
    UITapGestureRecognizer *gr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction1:)];
    [self.greenView addGestureRecognizer:gr];

    gr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction2:)];
    [self.redView addGestureRecognizer:gr];
    
    self.isLayer = YES;
}

- (void)tapAction1:(UITapGestureRecognizer *)gr {
    if (self.isLayer) {
        return;
    }
    NSLog(@"点击了greenView");
    [[[UIAlertView alloc] initWithTitle:@"Tap greenView"
                                message:nil
                               delegate:nil
                      cancelButtonTitle:@"OK"
                      otherButtonTitles:nil] show];
}

- (void)tapAction2:(UITapGestureRecognizer *)gr {
    if (self.isLayer) {
        return;
    }

    NSLog(@"点击了redView");
    [[[UIAlertView alloc] initWithTitle:@"Tap redView"
                                message:nil
                               delegate:nil
                      cancelButtonTitle:@"OK"
                      otherButtonTitles:nil] show];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    if (!self.isLayer) {
        return;
    }
    // MARK: - Hit Testing
    //get touch position
    CGPoint point = [[touches anyObject] locationInView:self.view];
    //get touched layer
    CALayer *layer = [self.view.layer hitTest:point];
    //get layer using hitTest
    if (layer == self.greenView.layer) {
        [[[UIAlertView alloc] initWithTitle:@"Inside greenView Layer"
                                    message:nil
                                   delegate:nil
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil] show];
    } else if (layer == self.redView.layer) {
        [[[UIAlertView alloc] initWithTitle:@"Inside redView Layer"
                                    message:nil
                                   delegate:nil
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil] show];
    } else {
        [[[UIAlertView alloc] initWithTitle:@"Outside Layer"
                                    message:nil
                                   delegate:nil
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil] show];
    }
}

@end
