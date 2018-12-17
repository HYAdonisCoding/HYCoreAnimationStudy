//
//  HYGCDViewController.m
//  Adonis_20181211_UsingLayer
//
//  Created by Adonis_HongYang on 2018/12/14.
//  Copyright © 2018年 Nikoyo (China）Electronics Systems Co., Ltd. All rights reserved.
//

#import "HYGCDViewController.h"

@interface HYGCDViewController ()

@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation HYGCDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSInteger __block i = 0;
    while (i < 5) {
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            i++;
            dispatch_async(dispatch_get_main_queue(), ^{
                
            });
            
        });
        
    }
    NSLog(@"%zd", i);
    _textView.text = [NSString stringWithFormat:@"%@\n%zd %@", _textView.text, i,@"out"];
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
