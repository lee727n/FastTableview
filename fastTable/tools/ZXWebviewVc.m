//
//  ZXWebviewVc.m
//  BOEHealthy
//
//  Created by liu zixuan on 2020/3/18.
//  Copyright © 2020 boe.com. All rights reserved.
//

#import "ZXWebviewVc.h"
#import <WebKit/WebKit.h>
#import "SVProgressHUD.h"

@interface ZXWebviewVc ()<WKUIDelegate,WKNavigationDelegate>
@property(nonatomic,strong)WKWebView *webView;
@property(nonatomic,strong)WKWebViewConfiguration *config;
@end

@implementation ZXWebviewVc

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    self.navigationController.navigationBar.translucent = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    self.title=self.navtitle;
    [self.view addSubview:self.webView];
    
    self.navigationController.navigationBar.barTintColor = [UIColor blueColor];
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName,[UIFont fontWithName:@"Helvetica Neue" size:17.0f], NSFontAttributeName,nil]];
    UIImage *image=[UIImage imageNamed:@"back"];
    // 去掉系统自带的蓝色的渲染效果
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    

}
//控制网页内部实现后退功能，不会直接释放controller
-(void)back{
    if (_webView.canGoBack==YES) {
        //返回上级页面
        [_webView goBack];
        
    }else{
        //退出控制器
        [self.navigationController popViewControllerAnimated:YES];
    }
}

-(void)setUrlStr:(NSString *)urlStr
{
    _urlStr=urlStr;
    [SVProgressHUD show];
    NSURLRequest *request= [NSURLRequest requestWithURL:[NSURL URLWithString:urlStr] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30];
    [self.webView loadRequest:request];
}

-(WKWebView *)webView
{
    if (_webView==nil) {
              //创建网页配置对象
                self.config = [[WKWebViewConfiguration alloc] init];
                
                // 创建设置对象
                WKPreferences *preference = [[WKPreferences alloc]init];
                //最小字体大小 当将javaScriptEnabled属性设置为NO时，可以看到明显的效果
                preference.minimumFontSize = 0;
                //设置是否支持javaScript 默认是支持的
                preference.javaScriptEnabled = YES;
                // 在iOS上默认为NO，表示是否允许不经过用户交互由javaScript自动打开窗口
                preference.javaScriptCanOpenWindowsAutomatically = YES;
                self.config.preferences = preference;
                
                // 是使用h5的视频播放器在线播放, 还是使用原生播放器全屏播放
                self.config.allowsInlineMediaPlayback = YES;
                //设置视频是否需要用户手动播放  设置为NO则会允许自动播放
                self.config.mediaTypesRequiringUserActionForPlayback = YES;
                //设置是否允许画中画技术 在特定设备上有效
                self.config.allowsPictureInPictureMediaPlayback = YES;
                //设置请求的User-Agent信息中应用程序名称 iOS9后可用
                self.config.applicationNameForUserAgent = @"ChinaDailyForiPad";
                //自定义的WKScriptMessageHandler 是为了解决内存不释放的问题
                //    WeakWebViewScriptMessageDelegate *weakScriptMessageDelegate = [[WeakWebViewScriptMessageDelegate alloc] initWithDelegate:self];
                //    //这个类主要用来做native与JavaScript的交互管理
                //    WKUserContentController * wkUController = [[WKUserContentController alloc] init];
                //    //注册一个name为jsToOcNoPrams的js方法
                //    [wkUController addScriptMessageHandler:weakScriptMessageDelegate  name:@"jsToOcNoPrams"];
                //    [wkUController addScriptMessageHandler:weakScriptMessageDelegate  name:@"jsToOcWithPrams"];
                //    config.userContentController = wkUController;
        //         [self.webView addObserver:self forKeyPath:@"title" options:NSKeyValueObservingOptionNew context:NULL];
        
        _webView=[[WKWebView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight-ViewY) configuration:self.config];
        _webView.UIDelegate=self;
        _webView.navigationDelegate=self;
    
    }
    return _webView;
}
#pragma mark - WKNavigationDelegate
-(void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation
{
    [SVProgressHUD dismiss];
}
-(void)webView:(WKWebView *)webView didFailNavigation:(WKNavigation *)navigation withError:(NSError *)error
{
    [SVProgressHUD dismiss];
}
#pragma mark - WKUIDelegate
-(WKWebView *)webView:(WKWebView *)webView createWebViewWithConfiguration:(WKWebViewConfiguration *)configuration forNavigationAction:(WKNavigationAction *)navigationAction windowFeatures:(WKWindowFeatures *)windowFeatures
{
    NSLog(@"createWebViewWithConfiguration");
    //假如是重新打开窗口的话
    if (!navigationAction.targetFrame.isMainFrame) {
        [SVProgressHUD show];
        [webView loadRequest:navigationAction.request];
    }
    return nil;
}
@end
