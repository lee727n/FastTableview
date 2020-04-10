//
//  ViewController.m
//  fastTable
//
//  Created by liu zixuan on 2019/6/21.
//  Copyright © 2019 liu zixuan. All rights reserved.
//

#import "ViewController.h"
#import "UIColor+ZxColor.h"
#import "headcell.h"
#import "UIButton+LXMImagePosition.h"
#import "SandBoxVc.h"
#import "ButtonPositionVc.h"
#import "ZXWebviewVc.h"
#import "FastTableviewVc.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //不避让导航 控制器从顶部开始 即：导航控制器会盖住一部分viewController内容
    self.navigationController.navigationBar.translucent = YES;
    
    self.title = @"实用demo集合";

    
}
- (IBAction)GotoSandBoxDemo:(id)sender {
    SandBoxVc *vc = [SandBoxVc new];
    [self.navigationController pushViewController:vc animated:YES];
    vc.title = @"沙盒演示demo";
}
- (IBAction)GotoButtonPosition:(id)sender {
    ButtonPositionVc *vc = [ButtonPositionVc new];
    [self.navigationController pushViewController:vc animated:YES];
    vc.title = @"快速设置按钮布局";
}
- (IBAction)WebDemo:(id)sender {
    ZXWebviewVc *vc= [ZXWebviewVc new];
    vc.navtitle= @"高性能web框架";
    vc.urlStr = @"https://blog.csdn.net/lee727n";
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)fastTableview:(id)sender {
    FastTableviewVc *vc = [FastTableviewVc new];
    [self.navigationController pushViewController:vc animated:YES];
    vc.title = @"快速tableview模板";
}


@end
