//
//  UIImage+SLAdd.m
//  SLPasswordInputView-Demo
//
//  Created by zhangsl on 16/7/29.
//  Copyright © 2016年 zhangsl. All rights reserved.
//

#import "UIImage+SLAdd.h"

@implementation UIImage (SLAdd)

+ (UIImage *)sl_dotImageWithColor:(UIColor *)color radius:(CGFloat)radius {
    CGSize size = CGSizeMake(radius * 2, radius * 2);
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
    
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:(CGRect){0, 0, size}];
    [color set];
    [path fill];
    
    UIImage *resultImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return resultImage;
}

@end
