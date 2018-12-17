//
//  HYCubeViewController.m
//  Adonis_20181211_UsingLayer
//
//  Created by Adonis_HongYang on 2018/12/14.
//  Copyright © 2018年 Nikoyo (China）Electronics Systems Co., Ltd. All rights reserved.
//

#import "HYCubeViewController.h"
#import <GLKit/GLKit.h>

#define LIGHT_DIRECTION 0, 1, -0.5
#define AMBIENT_LIGHT 0.5

@interface HYCubeViewController ()
@property (nonatomic, weak) IBOutlet UIView *containerView;
@property (nonatomic, strong) IBOutletCollection(UIView) NSArray *faces;

@end

@implementation HYCubeViewController

- (void)tapAction:(UITapGestureRecognizer *)gr {
    NSLog(@"tap : %zd", gr.view.tag);
}


- (void)addFace:(NSInteger)index withTransform:(CATransform3D)transform
{
    if ([self.navigationItem.title isEqualToString:@"Cube Light"]) {
        //get the face view and add it to the container
        UIView *face = self.faces[index];
        // MARK: - 几种正确的方案：把除了表面3的其他视图userInteractionEnabled属性都设置成NO来禁止事件传递。或者简单通过代码把视图3覆盖在视图6上。无论怎样都可以点击按钮了
        if (index == 3 || index == 4 || index == 5) {
            face.userInteractionEnabled = NO;
        }
        face.backgroundColor = [UIColor whiteColor];
        [[face subviews] enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            obj.backgroundColor = UICOLOR_RANDOM;
        }];
        [self.containerView addSubview:face];
        //center the face view within the container
        CGSize containerSize = self.containerView.bounds.size;
        face.center = CGPointMake(containerSize.width / 2.0, containerSize.height / 2.0);
        // apply the transform
        face.layer.transform = transform;
        //apply lighting
        [self applyLightingToFace:face.layer];
        UITapGestureRecognizer *gr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
        [face addGestureRecognizer:gr];
    } else {
        //get the face view and add it to the container
        UIView *face = self.faces[index];
        face.backgroundColor = UICOLOR_RANDOM;
        [self.containerView addSubview:face];
        
        //center the face view within the container
        CGSize containerSize = self.containerView.bounds.size;
        face.center = CGPointMake(containerSize.width / 2.0,
                                  containerSize.height / 2.0);
        
        //apply the transform
        face.layer.transform = transform;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if ([self.navigationItem.title isEqualToString:@"Cube Light"]) {
        //set up the container sublayer transform
        CATransform3D perspective = CATransform3DIdentity;
        perspective.m34 = -1.0 / 500.0;
        perspective = CATransform3DRotate(perspective, -M_PI_4, 1, 0, 0);
        perspective = CATransform3DRotate(perspective, -M_PI_4, 0, 1, 0);
        self.containerView.layer.sublayerTransform = perspective;
        //add cube face 1
        CATransform3D transform = CATransform3DMakeTranslation(0, 0, 100);
        [self addFace:0 withTransform:transform];
        //add cube face 2
        transform = CATransform3DMakeTranslation(100, 0, 0);
        transform = CATransform3DRotate(transform, M_PI_2, 0, 1, 0);
        [self addFace:1 withTransform:transform];
        //add cube face 3
        transform = CATransform3DMakeTranslation(0, -100, 0);
        transform = CATransform3DRotate(transform, M_PI_2, 1, 0, 0);
        [self addFace:2 withTransform:transform];
        //add cube face 4
        transform = CATransform3DMakeTranslation(0, 100, 0);
        transform = CATransform3DRotate(transform, -M_PI_2, 1, 0, 0);
        [self addFace:3 withTransform:transform];
        //add cube face 5
        transform = CATransform3DMakeTranslation(-100, 0, 0);
        transform = CATransform3DRotate(transform, -M_PI_2, 0, 1, 0);
        [self addFace:4 withTransform:transform];
        //add cube face 6
        transform = CATransform3DMakeTranslation(0, 0, -100);
        transform = CATransform3DRotate(transform, M_PI, 0, 1, 0);
        [self addFace:5 withTransform:transform];
    } else {
        //set up the container sublayer transform
        CATransform3D perspective = CATransform3DIdentity;
        perspective.m34 = -1.0 / 500.0;
        perspective = CATransform3DRotate(perspective, -M_PI_4, 1, 0, 0);
        perspective = CATransform3DRotate(perspective, -M_PI_4, 0, 1, 0);
        self.containerView.layer.sublayerTransform = perspective;
        
        //add cube face 1
        CATransform3D transform = CATransform3DMakeTranslation(0, 0, 100);
        [self addFace:0 withTransform:transform];
        
        //add cube face 2
        transform = CATransform3DMakeTranslation(100, 0, 0);
        transform = CATransform3DRotate(transform, M_PI_2, 0, 1, 0);
        [self addFace:1 withTransform:transform];
        
        //add cube face 3
        //move this code after the setup for face no. 6 to enable button
        transform = CATransform3DMakeTranslation(0, -100, 0);
        transform = CATransform3DRotate(transform, M_PI_2, 1, 0, 0);
        [self addFace:2 withTransform:transform];
        
        //add cube face 4
        transform = CATransform3DMakeTranslation(0, 100, 0);
        transform = CATransform3DRotate(transform, -M_PI_2, 1, 0, 0);
        [self addFace:3 withTransform:transform];
        
        //add cube face 5
        transform = CATransform3DMakeTranslation(-100, 0, 0);
        transform = CATransform3DRotate(transform, -M_PI_2, 0, 1, 0);
        [self addFace:4 withTransform:transform];
        
        //add cube face 6
        transform = CATransform3DMakeTranslation(0, 0, -100);
        transform = CATransform3DRotate(transform, M_PI, 0, 1, 0);
        [self addFace:5 withTransform:transform];
    }
    
    
    UIRotationGestureRecognizer *gr = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotation:)];
    [self.view addGestureRecognizer:gr];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //
    CATransform3D transform = CATransform3DMakeRotation(M_PI, 0, 0, 1);
    self.containerView.layer.transform = transform;
}
- (void)rotation:(UIRotationGestureRecognizer *)recognizer {
    
    self.containerView.layer.transform = CATransform3DMakeRotation(recognizer.rotation * 10, 1, 0, 1);
}


// MARK: - 光亮和阴影
- (void)applyLightingToFace:(CALayer *)face
{
    //add lighting layer
    CALayer *layer = [CALayer layer];
    layer.frame = face.bounds;
    [face addSublayer:layer];
    //convert the face transform to matrix
    //(GLKMatrix4 has the same structure as CATransform3D)
    //译者注：GLKMatrix4和CATransform3D内存结构一致，但坐标类型有长度区别，所以理论上应该做一次float到CGFloat的转换，感谢[@zihuyishi](https://github.com/zihuyishi)同学~
    CATransform3D transform = face.transform;
    GLKMatrix4 matrix4 = *(GLKMatrix4 *)&transform;
    GLKMatrix3 matrix3 = GLKMatrix4GetMatrix3(matrix4);
    //get face normal
    GLKVector3 normal = GLKVector3Make(0, 0, 1);
    normal = GLKMatrix3MultiplyVector3(matrix3, normal);
    normal = GLKVector3Normalize(normal);
    //get dot product with light direction
    GLKVector3 light = GLKVector3Normalize(GLKVector3Make(LIGHT_DIRECTION));
    float dotProduct = GLKVector3DotProduct(light, normal);
    //set lighting layer opacity
    CGFloat shadow = 1 + dotProduct - AMBIENT_LIGHT;
    UIColor *color = [UIColor colorWithWhite:0 alpha:shadow];
    layer.backgroundColor = color.CGColor;
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
