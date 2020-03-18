//
//  SandBoxVc.m
//  fastTable
//
//  Created by liu zixuan on 2019/12/17.
//  Copyright © 2019 liu zixuan. All rights reserved.
//

#import "SandBoxVc.h"

@interface SandBoxVc ()
@property (weak, nonatomic) IBOutlet UILabel *displayPath;
@property(nonatomic,copy) NSString *selectedPath;

@end

@implementation SandBoxVc

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //演示demo需要真机环境下才能正确显示哦~
}
- (IBAction)WriteToSandBox:(id)sender {
        UIView *v = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 200, 200)];
        v.backgroundColor = [UIColor purpleColor];
        v.hidden = YES;
        [self.view addSubview:v];
       //通过归档把v 转成NSData
        NSData *viewData = [NSKeyedArchiver archivedDataWithRootObject:v];
        
        [viewData writeToFile:[NSString stringWithFormat:@"%@/view.arch",self.selectedPath] atomically:YES];
         
        NSLog(@"保存成功");
}

- (IBAction)DocumentPath:(id)sender {
    //Document目录 documents (Documents)
    NSArray *paths =
    NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *path = [paths objectAtIndex:0];
    self.selectedPath = path;
    self.displayPath.text = path;
}
- (IBAction)LibarayPath:(id)sender {
        //Libaray目录 various documentation, support, and configuration files, resources (Library)
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory,NSUserDomainMask,YES);
        NSString *path = [paths objectAtIndex:0];
        self.selectedPath = path;
        self.displayPath.text = path;
}
- (IBAction)LibraraycachePath:(id)sender {
        //Cache目录 location of discardable cache files (Library/Caches)
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask,YES);
        NSString *path = [paths objectAtIndex:0];
        self.selectedPath = path;
        self.displayPath.text = path;
}
- (IBAction)LibaraypreferencePath:(id)sender {
        //Preferences目录 location of discardable cache files (Library/Caches)
        NSString *path = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES).lastObject stringByAppendingPathComponent:@"Preferences"];
       self.selectedPath = path;
       self.displayPath.text = path;
}
- (IBAction)tempPath:(id)sender {
    //    //获取temp路径
        NSString *path = NSTemporaryDirectory();
        self.selectedPath = path;
        self.displayPath.text = path;
}

@end
