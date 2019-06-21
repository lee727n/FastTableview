//
//  UIView+Extension.h
//  fastTable
//
//  Created by 刘梓轩 on 2019/06/21.
//  Copyright © 2018 刘梓轩. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface UIView (Extension)

@property (nonatomic, assign) CGFloat width;

@property (nonatomic, assign) CGFloat height;

@property (nonatomic, assign) CGFloat x;

@property (nonatomic, assign) CGFloat y;

@property (nonatomic) CGFloat centerX;

@property (nonatomic) CGFloat centerY;

@property (nonatomic) CGSize size;

@property (nonatomic) CGFloat top;

@property (nonatomic) CGFloat left;

@property (nonatomic) CGFloat right;

@property (nonatomic) CGFloat bottom;

//  给View添加底部阴影
- (void)addShadow:(CGFloat)shadowRadius shadowColor:(UIColor *)shadowColor;

/**
 快速给View添加边框
 width:边框宽度
 borderColor:边框颜色
 */
- (void)setBorderWidth:(CGFloat)width borderColor:(UIColor *)borderColor;

//  给View添加圆角
- (void)addCornerRadius:(CGFloat)radius;

- (void)addCornerRadius:(CGFloat)radius shadowRadius:(CGFloat)shadowRadius shadowColor:(UIColor *)shadowColor;

- (void)addCornerRadius:(CGFloat)radius shadowRadius:(CGFloat)shadowRadius;

@end


