//
//  fastTable
//
//  Created by 刘梓轩 on 2019/06/21.
//  Copyright © 2018 刘梓轩. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (ZxColor)

+ (UIColor *)colorWithIntRed:(uint)red green:(uint)green blue:(uint)blue alpha:(uint)alpha;
+ (UIColor *)colorWithRGB:(uint)rgb;
+ (UIColor*)colorWithARGB:(NSInteger)argbOrRGB;

@end

@interface UIColor (string)

+ (UIColor *)colorWithHexString:(NSString *)hxString;
+ (UIColor *)colorWithHex:(int)hex;

@end

@interface UIColor (image)

+ (UIImage *)createImageWithColor:(UIColor *)color;
+ (UIImage *)createImageWithColor:(UIColor *)color size:(CGSize)size;
+ (UIImage *)createImageWithColor:(UIColor *)color withRadius:(float)Radius;
+(UIImage*)circleImage:(UIImage*) image withParam:(CGFloat) inset;

@end

@interface UIColor (layer)

+ (CAGradientLayer *)setGradualChangingColor:(UIView *)view fromColor:(NSString *)fromHexColorStr toColor:(NSString *)toHexColorStr;

@end
