//
//  fastTable
//
//  Created by 刘梓轩 on 2019/06/21.
//  Copyright © 2018 刘梓轩. All rights reserved.
//

#import "UIColor+ZxColor.h"

#define DEFAULT_VOID_COLOR ([UIColor blackColor])
#define MyPROFILE_COLOR     [UIColor colorWithHexString:@"#37D961"]

@implementation UIColor (ZxColor)

+ (UIColor *)colorWithIntRed:(uint)red green:(uint)green blue:(uint)blue alpha:(uint)alpha {
    return [self colorWithRed:red / 255.0f green:green / 255.0f blue:blue / 255.0f alpha:alpha / 255.0f];
}

+ (UIColor*)colorWithARGB:(NSInteger)argb {
    CGFloat red = (argb>>16)&0xFF;
    CGFloat green = (argb>>8)&0xFF;
    CGFloat blue = argb&0xFF;
    CGFloat alpha = 255;
    if (argb > 0xFFFFFF)
    {
        alpha = (argb>>24)&0xFF;
    }
    return [UIColor colorWithIntRed:red green:green blue:blue alpha:alpha];
}

+ (UIColor *)colorWithRGB:(uint)rgb {
    return [UIColor colorWithARGB:rgb];
}

@end

@implementation UIColor (string)

+ (UIColor*)colorWithHex:(int)hex {
    float red = ((hex >> 24) & 0xFF)/255.0f;
    float green = ((hex >> 16) & 0xFF00)/255.0f;
    float blue = ((hex >> 8) & 0xFF0000)/255.0f;
    float alpha = ((hex >> 0) & 0xFF000000)/255.0f;
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

+ (UIColor *)colorWithHexString:(NSString *)hxString {
    NSString *cString = [[hxString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) return DEFAULT_VOID_COLOR;
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"]) cString = [cString substringFromIndex:1];
    if ([cString length] != 6) return DEFAULT_VOID_COLOR;
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:1.0f];
}

@end

@implementation UIColor (image)

+ (UIImage *)createImageWithColor:(UIColor *)color {
    return [UIColor createImageWithColor:color size:CGSizeMake(1.0f, 1.0f)];
}

+ (UIImage *)createImageWithColor:(UIColor *)color size:(CGSize)size {
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return theImage;
}

+ (UIImage *)createImageWithColor:(UIColor *)color withRadius:(float)Radius {
    CGRect rect = CGRectMake(0.0f, 0.0f, 5.0f+Radius*2, 5.0f+Radius*2);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:Radius];
    CGContextAddPath(context, bezierPath.CGPath);
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextEOFillPath(context);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

+(UIImage*) circleImage:(UIImage*) image withParam:(CGFloat) inset {
    UIGraphicsBeginImageContext(image.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 1);
    CGContextSetStrokeColorWithColor(context,MyPROFILE_COLOR.CGColor);
    CGRect rect = CGRectMake(inset, inset, image.size.width - inset * 2.0f, image.size.height - inset * 2.0f);
    CGContextAddEllipseInRect(context, rect);
    CGContextClip(context);
    
    [image drawInRect:rect];
    CGContextAddEllipseInRect(context, rect);
    CGContextStrokePath(context);
    UIImage *newimg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newimg;
}

@end


@implementation UIColor (layer)

//绘制渐变色颜色的方法
+ (CAGradientLayer *)setGradualChangingColor:(UIView *)view fromColor:(NSString *)fromHexColorStr toColor:(NSString *)toHexColorStr{
    //    CAGradientLayer类对其绘制渐变背景颜色、填充层的形状(包括圆角)
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = view.bounds;
    //  创建渐变色数组，需要转换为CGColor颜色
    gradientLayer.colors = @[(__bridge id)[UIColor colorWithHexString:fromHexColorStr].CGColor,(__bridge id)[UIColor colorWithHexString:toHexColorStr].CGColor];
    //  设置渐变颜色方向，左上点为(0,0), 右下点为(1,1)
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1, 1);
    //  设置颜色变化点，取值范围 0.0~1.0
    gradientLayer.locations = @[@0,@1];
    return gradientLayer;
}

@end

