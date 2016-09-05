//
//  UIImage+ImageWithColor.m
//  Friendship-UP
//
//  Created by Distillery Mac on 06.09.16.
//  Copyright © 2016 ed8009. All rights reserved.
//

#import "UIImage+ImageWithColor.h"

@implementation UIImage (ImageWithColor)

+ (UIImage *)resizeableImageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 3.0f, 3.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(1, 1, 1, 1)];
    
    return image;
}

@end
