//
//  fastTable
//
//  Created by 刘梓轩 on 2019/06/21.
//  Copyright © 2018 刘梓轩. All rights reserved.
//

#import "ZxTool.h"
#import "UIColor+ZxColor.h"


@implementation ZxTool

//将color转为UIImage
+ (UIImage *)createImageWithColor:(UIColor *)color {
    
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return theImage;
}

/**
 * 判断手机号
 *
 */
+ (BOOL)validateMobileNumber:(NSString *)mobileNum {
    
    if ([mobileNum containsString:@"-"]) {
        mobileNum = [mobileNum stringByReplacingOccurrencesOfString:@"-" withString:@""];
    }
    if ([mobileNum containsString:@" "]) {
        mobileNum = [mobileNum stringByReplacingOccurrencesOfString:@" " withString:@""];
    }
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189
     */
    NSString *MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    
    /**
     * 中国移动：China Mobile
     * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     */
    NSString *CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    
    /**
     * 中国联通：China Unicom
     * 130,131,132,152,155,156,185,186
     */
    NSString *CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    
    /**
     * 中国电信：China Telecom
     * 133,1349,153,180,189
     */
    NSString *CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    
    /**
     *大陆地区固话及小灵通
     * 区号：010,020,021,022,023,024,025,027,028,029
     *号码：七位或八位
     */
    NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    NSPredicate *regextestphs = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", PHS];
    
    if (([regextestmobile evaluateWithObject:mobileNum] == YES) || ([regextestcm evaluateWithObject:mobileNum] == YES) || ([regextestct evaluateWithObject:mobileNum] == YES) || ([regextestcu evaluateWithObject:mobileNum] == YES)|| ([regextestphs evaluateWithObject:mobileNum] == YES)) {
        
        return YES;
    }else {
        return NO;
    }
}

+ (BOOL)validateNumber:(NSString *)str {
    
    if ([str containsString:@"-"]) {
        str = [str stringByReplacingOccurrencesOfString:@"-" withString:@""];
    }
    if ([str containsString:@" "]) {
        str = [str stringByReplacingOccurrencesOfString:@" " withString:@""];
    }
    if (str.length <11) return NO;
    NSString *phoneRegex = @"^[0-9]\\d{10}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:str];
}

/**
 * 判断手机号
 *
 */
+ (BOOL)validatePhoneNumber:(NSString *)str {
    
    if ([str containsString:@"-"]) {
        str = [str stringByReplacingOccurrencesOfString:@"-" withString:@""];
    }
    if ([str containsString:@" "]) {
        str = [str stringByReplacingOccurrencesOfString:@" " withString:@""];
    }
    if (str.length <11) return NO;
    NSString *phoneRegex = @"^1[3-9]\\d{9}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:str];
}

/**
 *  判断验证码 *
 */
+ (BOOL)validateCodeNumber:(NSString *)code {
    
    NSString *CodeNumberRegex =@"^[A-Zz-z0-9]{4,6}+$";
    
    NSPredicate *CodeNumberpredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",CodeNumberRegex];
    return [CodeNumberpredicate evaluateWithObject:code];
}


/**
 *  判断密码
 *
 */
+ (BOOL)validatePassword:(NSString *)passWord {
    
    NSString *passWordRegex = @"^[a-zA-Z0-9]{6,20}+$";
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",passWordRegex];
    
    return [passWordPredicate evaluateWithObject:passWord];
}

/**
 *  判断用户名
 *
 */
+ (BOOL)validateUserName:(NSString *)name {
    
    NSString *userNameRegex =@"^[A-Zz-z0-9]{6,20}+$";
    
    NSPredicate *userNamepredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",userNameRegex];
    return [userNamepredicate evaluateWithObject:name];
}

+ (BOOL)validateEmail:(NSString *)email {
    
    NSString *emailRegex =@"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

//验证邮编是否正确
+ (BOOL)validateZipCode:(NSString *)zipCode {
    
    NSString *regex = @"[0-9]\\d{5}(?!\\d)";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:zipCode];
}

//验证年月日
+ (BOOL)validateWithDate:(NSString *)date {
    
    NSString *dateRegex= @"(([0-9]{3}[1-9]|[0-9]{2}[1-9][0-9]{1}|[0-9]{1}[1-9][0-9]{2}|[1-9][0-9]{3})-(((0[13578]|1[02])-(0[1-9]|[12][0-9]|3[01]))|((0[469]|11)-(0[1-9]|[12][0-9]|30))|(02-(0[1-9]|[1][0-9]|2[0-8]))))|((([0-9]{2})(0[48]|[2468][048]|[13579][26])|((0[48]|[2468][048]|[3579][26])00))-02-29)";
    
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", dateRegex];
    return [emailTest evaluateWithObject:date];
}

//身份证号
+ (BOOL) validateIdentityCard: (NSString *)identityCard {
    
    BOOL flag;
    
    if (identityCard.length < 18  ) {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [identityCardPredicate evaluateWithObject:identityCard];
}

// 银行开户
+ (BOOL)validateBankCard: (NSString *)bankCard {
    
    NSString *regex2 = @"^([0-9]{16}|[0-9]{19})$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [identityCardPredicate evaluateWithObject:bankCard];
}

//昵称
+ (BOOL)validateNickname:(NSString *)nickname {
    
    //国外人名字[u4e00-u9fa5]
    //[\u4E00-\u9FA5]{2,5}(?:·[\u4E00-\u9FA5]{2,5})*
    //     NSString *nicknameRegex = @"^[\u4e00-\u9fa5]{4,8}$";
    NSString *nicknameRegex = @"[\u4e00-\u9fa5]";
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",nicknameRegex];
    return [passWordPredicate evaluateWithObject:nickname];
}

+ (BOOL)isBlankString:(NSString *)string {
    
    if ([string isEqual:[NSNull null]]) {
        
        return YES;
    }
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length] == 0) {
        return YES;
    }
    return NO;
}

+ (NSString *)numberStringWithString:(NSString *)string {
    
    NSString *result = [[string componentsSeparatedByCharactersInSet:[[NSCharacterSet characterSetWithCharactersInString:@"0123456789"] invertedSet]] componentsJoinedByString:@""];
    return result;
}

+ (NSString *)timeWithTimeIntervalString:(NSString *)timeString {
    
    // 格式化时间
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"beijing"];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    // 毫秒值转化为秒
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[timeString doubleValue]/ 1000.0];
    NSString *dateString = [formatter stringFromDate:date];
    return dateString;
}

+ (NSString *)timeWithTimeIntervalString:(NSString *)timeString formatString:(NSString *)formatString {
    
    // 格式化时间
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"beijing"];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:formatString];
    
    // 毫秒值转化为秒
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[timeString doubleValue]/ 1000.0];
    NSString *dateString = [formatter stringFromDate:date];
    return dateString;
}


+ (NSString *)getTypeNameWithType:(NSInteger)type {
    
    NSString *typeName = [NSString stringWithFormat:@"C%ld", type];
    
    if(type > 2 && type <= 4){
        
        typeName = [NSString stringWithFormat:@"B%ld", type - 2];
        
    }else if(type > 4){
        
        typeName = [NSString stringWithFormat:@"A%ld", type - 4];
    }
    return typeName;
}



+(UIImage *)drawOvalWithImage:(UIImage *)image borderWidth:(CGFloat)border borderColor:(UIColor *)borderColor{
    
    //设置边框宽度
    
    CGFloat imageWH = image.size.width;
    
    //计算外圆的尺寸
    
    CGFloat ovalWH = imageWH + 2 * border;
    
    //开启上下文
    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(ovalWH, ovalWH), NO, 0);
    
    //画一个大的圆形
    
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, ovalWH, ovalWH)];
    
    [borderColor set];
    
    [path fill];
    
    //设置裁剪区域
    
    UIBezierPath *path1 = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(border, border, imageWH, imageWH)];
    
    [path1 addClip];
    
    //绘制图片
    
    [image drawAtPoint:CGPointMake(border, border)];
    
    //从上下文中获取图片
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    //关闭上下文
    
    UIGraphicsEndImageContext();
    
    return newImage;
    
}

+ (CAShapeLayer *)drawRoundWidgetWith:(CGRect)rect corderRadius:(CGFloat)radius{
    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:radius];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = rect;
    maskLayer.path = maskPath.CGPath;
    
    return maskLayer;
}
//获取当前屏幕显示的viewcontroller
+ (UIViewController *)currentController {
    return [ZxTool getCurrentVCFrom:[[UIApplication sharedApplication].keyWindow rootViewController]];
}

+ (UIViewController *)getCurrentVCFrom:(UIViewController *)rootVC
{
    UIViewController *currentVC;
    if ([rootVC presentedViewController]) {
        // 视图是被presented出来的
        rootVC = [rootVC presentedViewController];
    }
    if ([rootVC isKindOfClass:[UITabBarController class]]) {
        // 根视图为UITabBarController
        currentVC = [self getCurrentVCFrom:[(UITabBarController *)rootVC selectedViewController]];
    } else if ([rootVC isKindOfClass:[UINavigationController class]]){
        // 根视图为UINavigationController
        currentVC = [self getCurrentVCFrom:[(UINavigationController *)rootVC visibleViewController]];
    } else {
        // 根视图为非导航类
        currentVC = rootVC;
    }
    return currentVC;
}

+(void)showAlertWithTitle:(NSString*)title Message:(NSString*)Message CancelTitle:(NSString *)cancel OkTitle:(NSString *)Ok OkAction:(ActionOne)Okction{
    UIAlertController *alert= [UIAlertController alertControllerWithTitle:title message:Message preferredStyle:(UIAlertControllerStyleAlert)];
 
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:Ok style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"点击确定");
        Okction();
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancel style:UIAlertActionStyleCancel handler:nil ];
    
    [alert addAction:okAction];
    [alert addAction:cancelAction];
  
    [[ZxTool currentController] presentViewController:alert animated:YES completion:nil];
}
#pragma mark - 时间相关处理
//获取当地时间
+ (NSString *)getCurrentTime {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *dateTime = [formatter stringFromDate:[NSDate date]];
    return dateTime;
}
//指定时间转时间戳
+(NSInteger)timeSwitchTimestamp:(NSString *)formatTime andFormatter:(NSString *)format{
    //用法:
    //NSInteger todayStamp =  [self timeSwitchTimestamp:todaynoon andFormatter:@"yyyy-MM-dd HH:mm:ss"];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    
    [formatter setDateFormat:format]; //(@"YYYY-MM-dd hh:mm:ss") ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    
    
    
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    
    [formatter setTimeZone:timeZone];
    
    
    
    NSDate* date = [formatter dateFromString:formatTime]; //------------将字符串按formatter转成nsdate
    
    //时间转时间戳的方法:
    
    NSInteger timeSp = [[NSNumber numberWithDouble:[date timeIntervalSince1970]] integerValue];
    
    
    
    NSLog(@"将某个时间转化成 时间戳&&&&&&&timeSp:%ld",(long)timeSp); //时间戳的值
    
    
    
    return timeSp;
    
}
//时间戳变为格式时间
+ (NSString *)ConvertStrToTime:(NSString *)timeStr

{
    
    long long time=[timeStr longLongValue];
    //    如果服务器返回的是13位字符串，需要除以1000，否则显示不正确(13位其实代表的是毫秒，需要除以1000)
    //    long long time=[timeStr longLongValue] / 1000;
    
    NSDate *date = [[NSDate alloc]initWithTimeIntervalSince1970:time];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    
    [formatter setDateFormat:@"yyyy-MM-dd"];
    
    NSString*timeString=[formatter stringFromDate:date];
    
    return timeString;
    
}
#pragma mark - label动态行高
//计算UILabel的高度(带有行间距的情况)
+(CGFloat)estimateLabelHeightwithWidth:(NSString*)Str withSpace:(CGFloat)space withFont:(UIFont*)font withWidth:(CGFloat)width{
    
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineBreakMode = NSLineBreakByCharWrapping;
    paraStyle.alignment = NSTextAlignmentLeft;
    paraStyle.lineSpacing = space;
    paraStyle.hyphenationFactor = 1.0;
    paraStyle.firstLineHeadIndent = 0.0;
    paraStyle.paragraphSpacingBefore = 0.0;
    paraStyle.headIndent = 0;
    paraStyle.tailIndent = 0;
    NSDictionary *dic = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paraStyle, NSKernAttributeName:@0.0f};
    CGSize size = [Str boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    return size.height;
    
}
//设置行间距段落格式等
+(void)setLabelSpace:(UILabel*)label withSpace:(CGFloat)space withFont:(UIFont*)font{
    
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineBreakMode = NSLineBreakByCharWrapping;
    paraStyle.alignment = NSTextAlignmentLeft;
    paraStyle.lineSpacing = space; //设置行间距
    paraStyle.hyphenationFactor = 1.0;
    paraStyle.firstLineHeadIndent = 0.0;
    paraStyle.paragraphSpacingBefore = 0.0;
    paraStyle.headIndent = 0;
    paraStyle.tailIndent = 0;
    //设置字间距 NSKernAttributeName:@1.5f
    NSDictionary *dic = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paraStyle, NSKernAttributeName:@0.0f
                          };
    NSAttributedString *attributeStr = [[NSAttributedString alloc] initWithString:label.text attributes:dic];
    label.attributedText = attributeStr;
}
#pragma mark - 分段字符串

+(void)setFontWithFont:(NSString *)font Size:(CGFloat) size Color6f:(NSString *) color6F withLabel:(UILabel *)label withString:(NSString*)str{
NSRange  range  = [label.text rangeOfString:str];
NSMutableAttributedString *atrributeStr2=[[NSMutableAttributedString alloc] initWithString:label.text];
//设置字体颜色
[atrributeStr2 addAttribute:NSFontAttributeName
                      value:[UIFont fontWithName:font size:size]
                      range:range];
    
[atrributeStr2 addAttribute:NSForegroundColorAttributeName
                      value:[UIColor colorWithHexString:color6F]
                      range:range];
    
label.attributedText=atrributeStr2;
}
#pragma mark - 快速添加手势
+(void)addGestureToView:(UIView*) view withTarget:(UIViewController*)target WithfuncName:(NSString *)name {
    SEL act = NSSelectorFromString(name);
    UITapGestureRecognizer *singleTapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:target action:act];
    [singleTapGestureRecognizer setNumberOfTapsRequired:1];
    [view addGestureRecognizer:singleTapGestureRecognizer];
    
}
@end
