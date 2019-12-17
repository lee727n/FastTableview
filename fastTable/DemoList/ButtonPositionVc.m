//
//  ButtonPositionVc.m
//  fastTable
//
//  Created by liu zixuan on 2019/12/17.
//  Copyright © 2019 liu zixuan. All rights reserved.
//

#import "ButtonPositionVc.h"
#import "UIColor+ZxColor.h"
#import "UIButton+LXMImagePosition.h"

@interface ButtonPositionVc ()
@property(nonatomic,strong)UIButton *leftBtn;
@end

@implementation ButtonPositionVc

- (void)viewDidLoad {
    [super viewDidLoad];
    [self CreateButton];
}
- (IBAction)setLeft:(id)sender {
    [self.leftBtn setImagePosition:LXMImagePositionLeft spacing:10];
}
- (IBAction)setRight:(id)sender {
    [self.leftBtn setImagePosition:LXMImagePositionRight spacing:10];
}
- (IBAction)seletedStatus:(id)sender {
    self.leftBtn.selected = YES;
}
- (IBAction)originStatus:(id)sender {
    self.leftBtn.selected = NO;
}


-(void)CreateButton{
    self.leftBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    self.leftBtn.backgroundColor=[UIColor whiteColor];
    [self.leftBtn setTitle:@"连接设备" forState:UIControlStateNormal];
    [self.leftBtn setTitle:@"断开设备" forState:UIControlStateSelected];
    [self.leftBtn setTitleColor:[UIColor colorWithHexString:@"#33B7F5"] forState:UIControlStateNormal];
    [_leftBtn addTarget:self action:@selector(leftAction) forControlEvents:UIControlEventTouchUpInside];
    [self.leftBtn setImage:[UIImage imageNamed:@"icon_break"] forState:UIControlStateSelected];
    [self.leftBtn setImage:[UIImage imageNamed:@"icon_connect"] forState:UIControlStateNormal];
    
    self.leftBtn.titleLabel.font=[UIFont systemFontOfSize:14];
    self.leftBtn.frame=CGRectMake(0, 200, ScreenWidth, 75);
    [self.view addSubview:self.leftBtn];
    
    [self.leftBtn setImagePosition:LXMImagePositionLeft spacing:10];
}

-(void)leftAction{
    NSLog(@"没有相应事件");
}
@end
