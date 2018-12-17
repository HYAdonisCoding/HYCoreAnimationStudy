//
//  HYCornerRadiusViewController.m
//  Adonis_20181211_UsingLayer
//
//  Created by Adonis_HongYang on 2018/12/13.
//  Copyright © 2018年 Nikoyo (China）Electronics Systems Co., Ltd. All rights reserved.
//

#import "HYCornerRadiusViewController.h"

@interface HYCornerRadiusViewController ()
@property (weak, nonatomic) IBOutlet UIView *leftView;

@property (weak, nonatomic) IBOutlet UIView *rightView;
@end

@implementation HYCornerRadiusViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.greenView.layer.zPosition = .0;
    //set the corner radius on our layers
    self.leftView.layer.cornerRadius = 20.0f;
    self.rightView.layer.cornerRadius = 20.0f;

    //enable clipping on the second layer
    self.rightView.layer.masksToBounds = YES;
    
    if ([self.navigationItem.title isEqualToString:@"LayerBorder"]) {
        self.leftView.layer.borderWidth = 5;
        self.rightView.layer.borderWidth = 5;
        
        
//        self.leftView.layer.shadowOffset = CGSizeMake(3, 3);
        self.leftView.layer.shadowOpacity = 1;
//        self.leftView.layer.shadowRadius = 4;
        
        self.leftView.layer.shadowColor = [UIColor blueColor].CGColor;
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
