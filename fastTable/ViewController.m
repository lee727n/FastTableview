//
//  ViewController.m
//  fastTable
//
//  Created by liu zixuan on 2019/6/21.
//  Copyright © 2019 liu zixuan. All rights reserved.
//

#import "ViewController.h"
#import "UIColor+JKColor.h"
#import "headcell.h"

#define ScreenWidth             [UIScreen mainScreen].bounds.size.width
#define ScreenHeight            [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(strong,nonatomic)UITableView *sysTableview;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //添加tableview
    [self.view addSubview:self.sysTableview];
    self.sysTableview.dataSource = self;
    self.sysTableview.delegate =self;
    
    //注册cell
    [self.sysTableview registerNib:[UINib nibWithNibName:@"headcell" bundle:nil] forCellReuseIdentifier:@"headcell"];
    [self WriteToSandbox];
}
-(void)WriteToSandbox{
        UIView *v = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 200, 200)];
        v.backgroundColor = [UIColor purpleColor];
        v.hidden = YES;
        [self.view addSubview:v];
    
    //Document目录 documents (Documents)
    NSArray *paths =
    NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *path = [paths objectAtIndex:0];
    NSLog(@"%@",path);
    
//    //Libaray目录 various documentation, support, and configuration files, resources (Library)
//    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory,NSUserDomainMask,YES);
//    NSString *path = [paths objectAtIndex:0];
//
//    //Cache目录 location of discardable cache files (Library/Caches)
//    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask,YES);
//    NSString *path = [paths objectAtIndex:0];
    
    //通过归档把v 转成NSData
        NSData *viewData = [NSKeyedArchiver archivedDataWithRootObject:v];
    
        [viewData writeToFile:[NSString stringWithFormat:@"%@/view.arch",path] atomically:YES];
    


}
- (UITableView *)sysTableview{
    if (!_sysTableview) {
        _sysTableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, ScreenWidth, ScreenHeight ) style:UITableViewStyleGrouped];
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
