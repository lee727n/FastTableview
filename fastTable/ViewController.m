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

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(strong,nonatomic)UITableView *sysTableview;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //不避让导航 控制器从顶部开始 即：导航控制器会盖住一部分viewController内容
    self.navigationController.navigationBar.translucent = YES;
    
    self.title = @"实用demo集合";
//添加tableview
//    [self.view addSubview:self.sysTableview];
//    self.sysTableview.dataSource = self;
//    self.sysTableview.delegate =self;
    //    //注册cell
    //    [self.sysTableview registerNib:[UINib nibWithNibName:@"headcell" bundle:nil] forCellReuseIdentifier:@"headcell"];
    
////调整按钮布局demo
//     [self CreateButton];

////沙盒存储demo
//    [self WriteToSandbox];
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

- (UITableView *)sysTableview{
    if (!_sysTableview) {
        _sysTableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, ScreenWidth, ScreenHeight) style:UITableViewStyleGrouped];
        _sysTableview.separatorStyle = UITableViewCellSeparatorStyleNone;
        _sysTableview.backgroundColor = [UIColor colorWithHexString:@"F7F9FA"];
        _sysTableview.showsVerticalScrollIndicator = NO;
        _sysTableview.scrollEnabled = YES;
        
        //声明tableView的位置 添加下面代码
        if (@available(iOS 11.0, *)) {
            _sysTableview.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
            //            _WatchTableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
            //            _WatchTableView.scrollIndicatorInsets = _WatchTableView.contentInset;
            //iOS11默认开启Self-Sizing，关闭Self-Sizing即可
            _sysTableview.estimatedRowHeight = 0;
            _sysTableview.estimatedSectionHeaderHeight = 0;
            _sysTableview.estimatedSectionFooterHeight = 0;
        }
    }
    return _sysTableview;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
        headcell *headcell = [tableView dequeueReusableCellWithIdentifier:@"headcell" forIndexPath:indexPath];
        
        headcell.selectionStyle = UITableViewCellSelectionStyleNone;
    
        return headcell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

        return 80;
    
}
// 隐藏UITableViewStyleGrouped下边多余的间隔
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01f;
}
-(CGFloat)tableView:(UITableView*)tableView heightForHeaderInSection:(NSInteger)section
{
        return 20;

}
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return [UIView new];
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return [UIView new];
}

@end
