//
//  HYCATextLayerViewController.m
//  Adonis_20181211_UsingLayer
//
//  Created by Adonis_HongYang on 2018/12/14.
//  Copyright © 2018年 Nikoyo (China）Electronics Systems Co., Ltd. All rights reserved.
//

#import "HYCATextLayerViewController.h"
#import "HYViewLabel.h"
#import "HYTextLayerLabel.h"
#import <CoreText/CoreText.h>

@interface HYCATextLayerViewController ()
@property (weak, nonatomic) IBOutlet UIView *labelView;

@end

@implementation HYCATextLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //create a text layer
    CATextLayer *textLayer = [CATextLayer layer];
    textLayer.frame = self.labelView.bounds;
    [self.labelView.layer addSublayer:textLayer];
    
    //set text attributes
    textLayer.foregroundColor = [UIColor blackColor].CGColor;
    textLayer.alignmentMode = kCAAlignmentJustified;
    textLayer.wrapped = YES;
    //以Retina的质量来显示文字，我们就得手动地设置CATextLayer的contentsScale属性
    textLayer.contentsScale = [UIScreen mainScreen].scale;
    //choose a font
    UIFont *font = [UIFont systemFontOfSize:15];
    
    //set layer font
    CFStringRef fontName = (__bridge CFStringRef)font.fontName;
    CGFontRef fontRef = CGFontCreateWithFontName(fontName);
    textLayer.font = fontRef;
    textLayer.fontSize = font.pointSize;
    CGFontRelease(fontRef);
    
    //choose some text
    NSString *text = @"Lorem ipsum dolor sit amet, consectetur adipiscing \ elit. Quisque massa arcu, eleifend vel varius in, facilisis pulvinar \ leo. Nunc quis nunc at mauris pharetra condimentum ut ac neque. Nunc elementum, libero ut porttitor dictum, diam odio congue lacus, vel \ fringilla sapien diam at purus. Etiam suscipit pretium nunc sit amet \ lobortis";
    
    //set layer text
    textLayer.string = text;
    
    HYViewLabel *myLabel = [[HYViewLabel alloc] initWithFrame:CGRectMake(10, 88, 100, 30)];
    myLabel.text = @"This is black Friday!";
    myLabel.font = [UIFont fontWithName:@"Courier" size:13];
    //set text attributes
    NSDictionary *attribs = @{
                              NSFontAttributeName:[UIFont systemFontOfSize:14],
                              NSForegroundColorAttributeName: [UIColor blueColor],
                              NSBaselineOffsetAttributeName:@1.0,
                              };;
    
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:myLabel.text];
    [string setAttributes:attribs range:NSMakeRange(0, [string length])];
    attribs = @{
                NSFontAttributeName:[UIFont systemFontOfSize:14],
                NSForegroundColorAttributeName: [UIColor redColor],
                NSBaselineOffsetAttributeName:@1.0,
                };;
    [string setAttributes:attribs range:NSMakeRange(5, 2)];
    myLabel.attributeString = string;
//    myLabel.backgroundColor = [UIColor magentaColor];
    [self.view addSubview:myLabel];
    
    HYTextLayerLabel *label = [[HYTextLayerLabel alloc] initWithFrame:CGRectMake(10, 120, 150, 30)];
    label.text = @"This is black Friday!";
    label.font = [UIFont fontWithName:@"Courier" size:13];
    //set text attributes
    attribs = @{
                              NSFontAttributeName:[UIFont systemFontOfSize:14],
                              NSForegroundColorAttributeName: [UIColor blueColor],
                              NSBaselineOffsetAttributeName:@1.0,
                              };
    
    string = [[NSMutableAttributedString alloc] initWithString:label.text];
    [string setAttributes:attribs range:NSMakeRange(0, [string length])];
    attribs = @{
                NSFontAttributeName:[UIFont systemFontOfSize:14],
                NSForegroundColorAttributeName: [UIColor redColor],
                NSBaselineOffsetAttributeName:@1.0,
                };;
    [string setAttributes:attribs range:NSMakeRange(5, 2)];
    label.attributedText = string;
    label.layerBackgroundColor = [UIColor magentaColor];
    [self.view addSubview:label];

    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(100, 200, 50, 50);
    layer.backgroundColor = [UIColor magentaColor].CGColor;
    [self.view.layer addSublayer:layer];
    
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(200, 200, 120, 140)];
    label1.numberOfLines = 0;
    label1.text = @"手机信用卡\n米动健康联名信用卡金卡";
    [self.view addSubview:label1];
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
