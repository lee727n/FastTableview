//
//  fastTable
//
//  Created by 刘梓轩 on 2019/06/21.
//  Copyright © 2018 刘梓轩. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^ActionOne)(void);

@interface ZxTool : NSObject

//  颜色转成图片
+ (UIImage *)createImageWithColor:(UIColor *)color;

/**
 * 判断手机号+固话
 */
+ (BOOL)validateNumber:(NSString *)str;

/**
 * 判断手机号
 */
+ (BOOL)validatePhoneNumber:(NSString *)str;

/**
 * 判断座机号码
 */
+ (BOOL)validateMobileNumber:(NSString *)mobileNum;

/**
 *  判断验证码
 */
+ (BOOL)validateCodeNumber:(NSString *)code;

/**
 *  判断密码
 */
+ (BOOL)validatePassword:(NSString *)passWord;

/**
 *  判断用户名
 */
+ (BOOL)validateUserName:(NSString *)name;

//邮箱验证
+(BOOL)validateEmail:(NSString *)email;

//验证邮编
+ (BOOL)validateZipCode:(NSString *)zipCode;

//验证年月日
+ (BOOL)validateWithDate:(NSString *)date;

//昵称
+ (BOOL)validateNickname:(NSString *)nickname;

//身份证号
+ (BOOL)validateIdentityCard: (NSString *)identityCard;

// 银行开户
+ (BOOL)validateBankCard: (NSString *)bankCard;

+ (NSString *)timeWithTimeIntervalString:(NSString *)timeString;

+ (NSString *)timeWithTimeIntervalString:(NSString *)timeString formatString:(NSString *)formatString;

// 判断字符串是否为空
+ (BOOL)isBlankString:(NSString *)string;

//  返回只有数字的字符串
+ (NSString *)numberStringWithString:(NSString *)string;


+ (NSString *)getTypeNameWithType:(NSInteger)type;

/* 把图片剪切成圆形的图片 */
+ (UIImage *)drawOvalWithImage:(UIImage *)image borderWidth:(CGFloat)border borderColor:(UIColor *)borderColor;

+ (CAShapeLayer *)drawRoundWidgetWith:(CGRect)rect corderRadius:(CGFloat)radius;

//获取当前屏幕显示的viewcontroller
+ (UIViewController *)currentController;

+ (UIViewController *)getCurrentVCFrom:(UIViewController *)rootVC;

//显示提示框
+(void)showAlertWithTitle:(NSString*)title Message:(NSString*)Message CancelTitle:(NSString *)cancel OkTitle:(NSString *)Ok OkAction:(ActionOne)Action;

//时间处理
+ (NSString *)getCurrentTime;
+ (NSInteger)timeSwitchTimestamp:(NSString *)formatTime andFormatter:(NSString *)format;
+ (NSString *)ConvertStrToTime:(NSString *)timeStr;

//估算行高
+(CGFloat)estimateLabelHeightwithWidth:(NSString *)Str withSpace:(CGFloat)space withFont:(UIFont*)font withWidth:(CGFloat)width;
//设置行间距
+(void)setLabelSpace:(UILabel*)label withSpace:(CGFloat)space withFont:(UIFont*)font;

//字符串分段处理
+(void)setFontWithFont:(NSString *)font Size:(CGFloat) size Color6f:(NSString *) color6F withLabel:(UILabel *)label withString:(NSString*)str;

//快速添加手势
+(void)addGestureToView:(UIView*) view withTarget:(UIViewController*)target WithfuncName:(NSString *) name;
@end

