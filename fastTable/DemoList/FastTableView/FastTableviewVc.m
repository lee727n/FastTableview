//
//  FastTableviewVc.m
//  fastTable
//
//  Created by liu zixuan on 2020/4/10.
//  Copyright © 2020 liu zixuan. All rights reserved.
//

#import "FastTableviewVc.h"
#import "UIColor+ZxColor.h"
#import "headcell.h"


@interface FastTableviewVc ()<UITableViewDelegate,UITableViewDataSource>
@property(strong,nonatomic)UITableView *sysTableview;
@end

@implementation FastTableviewVc

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = NO;
//   添加tableview
    [self.view addSubview:self.sysTableview];
       self.sysTableview.dataSource = self;
       self.sysTableview.delegate =self;
    //注册cell
    [self.sysTableview registerNib:[UINib nibWithNibName:@"headcell" bundle:nil] forCellReuseIdentifier:@"headcell"];
}

- (UITableView *)sysTableview{
    if (!_sysTableview) {
        _sysTableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) style:UITableViewStyleGrouped];
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
    
    return 2;
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
