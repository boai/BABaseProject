//
//  BAWebViewController.m
//  BABaseProject
//
//  Created by 博爱之家 on 16/5/16.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "BAWebViewController.h"
#import <WebKit/WebKit.h>


#define IOS8x SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"8.0")

@interface BAWebViewController ()
<UIWebViewDelegate,UIActionSheetDelegate,WKNavigationDelegate>

@property (assign, nonatomic) NSUInteger loadCount;
@property (strong, nonatomic) UIProgressView *progressView;
@property (strong, nonatomic) UIWebView *webView;
@property (strong, nonatomic) WKWebView *wkWebView;

@end

@implementation BAWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor whiteColor];
    [self configUI];
    [self configBackItem];
    [self configMenuItem];
    
}

#pragma mark - ***** 进度条
- (UIProgressView *)progressView
{
    if (!_progressView)
    {
        UIProgressView *progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 0)];
        progressView.tintColor = BA_Orange_Color;
        progressView.trackTintColor = [UIColor whiteColor];
        [self.view addSubview:progressView];
        self.progressView = progressView;
    }
    return _progressView;
}

#pragma mark - ***** UI创建
- (void)configUI
{
    self.progressView.hidden = NO;
    
//    self.urlString = @"https://www.baidu.com";
//    self.urlString = @"http://boai.github.io";

    if (!_urlString) _urlString = @"http://boai.github.io";
    else _urlString = self.urlString;
    if ([BARegularExpression ba_isUrl:self.urlString])
    {
        _urlString = self.urlString;
    }
    else
    {
        [self.view showAlertView:@"温馨提示：" message:@"不能识别的二维码！"];
        return;
    }
    
    // 网页
    if (IOS8x)
    {
        WKWebView *wkWebView = [[WKWebView alloc] initWithFrame:self.view.bounds];
        wkWebView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        wkWebView.backgroundColor = [UIColor whiteColor];
        wkWebView.navigationDelegate = self;
        [self.view insertSubview:wkWebView belowSubview:_progressView];
        
        [wkWebView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.urlString]];
        [wkWebView loadRequest:request];
        self.wkWebView = wkWebView;
    }
    else
    {
        UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
        webView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        webView.scalesPageToFit = YES;
        webView.backgroundColor = [UIColor whiteColor];
        webView.delegate = self;
        [self.view insertSubview:webView belowSubview:_progressView];
        
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.urlString]];
        [webView loadRequest:request];
        self.webView = webView;
    }
}

#pragma mark 导航栏的返回按钮
- (void)configBackItem
{
    UIImage *backImage = [UIImage imageNamed:@"navigationbar_back"];
    backImage = [backImage imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    UIButton *backBtn = [[UIButton alloc] init];
    [backBtn setTintColor:BA_Orange_Color];
    [backBtn setBackgroundImage:backImage forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [backBtn sizeToFit];
    
    UIBarButtonItem *colseItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = colseItem;
}

#pragma mark 导航栏的菜单按钮
- (void)configMenuItem
{
    UIImage *menuImage = [UIImage imageNamed:@"navigationbar_more"];
    menuImage = [menuImage imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
//    WithFrame:CGRectMake(0, 0, 40, 40)
    UIButton *menuBtn = [[UIButton alloc] init];
    [menuBtn setTintColor:BA_Orange_Color];
    [menuBtn setImage:menuImage forState:UIControlStateNormal];
    [menuBtn addTarget:self action:@selector(menuBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [menuBtn sizeToFit];

    UIBarButtonItem *menuItem = [[UIBarButtonItem alloc] initWithCustomView:menuBtn];
    self.navigationItem.rightBarButtonItem = menuItem;
}

#pragma mark 导航栏的关闭按钮
- (void)configColseItem
{
    UIButton *colseBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 44, 44)];
    [colseBtn setTitle:@"关闭" forState:UIControlStateNormal];
    [colseBtn setTitleColor:BA_Orange_Color forState:UIControlStateNormal];
    [colseBtn addTarget:self action:@selector(colseBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [colseBtn sizeToFit];
    
    UIBarButtonItem *colseItem = [[UIBarButtonItem alloc] initWithCustomView:colseBtn];
    NSMutableArray *newArr = [NSMutableArray arrayWithObjects:self.navigationItem.leftBarButtonItem,colseItem, nil];
    self.navigationItem.leftBarButtonItems = newArr;
}

#pragma mark - ***** 按钮点击事件
#pragma mark 返回按钮点击
- (void)backBtnAction:(UIButton *)sender
{
    if (IOS8x)
    {
        if (self.wkWebView.canGoBack)
        {
            [self.wkWebView goBack];
            if (self.navigationItem.leftBarButtonItems.count == 1)
            {
                [self configColseItem];
            }
        }else {
            [self.navigationController popViewControllerAnimated:YES];
        }
    }
    else
    {
        if (self.webView.canGoBack)
        {
            [self.webView goBack];
            if (self.navigationItem.leftBarButtonItems.count == 1)
            {
                [self configColseItem];
            }
        }
        else
        {
            [self.navigationController popViewControllerAnimated:YES];
        }
    }
}

#pragma mark 菜单按钮点击
- (void)menuBtnAction:(UIButton *)sender

{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"safari打开",@"复制链接",@"分享",@"刷新", nil];
    [actionSheet showInView:self.view];
}

#pragma mark 关闭按钮点击
- (void)colseBtnAction:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    NSString *urlStr = [NSURL URLWithString:self.urlString].absoluteString;
    if (IOS8x) urlStr = self.wkWebView.URL.absoluteString;
    else urlStr = self.webView.request.URL.absoluteString;
    if (buttonIndex == 0)
    {
        /*! safari打开 */
        BA_OpenUrl([NSURL URLWithString:urlStr]);
    }
    else if (buttonIndex == 1)
    {
        /*! 复制链接 */
        if (urlStr.length > 0)
        {
            BA_CopyContent(urlStr);
            [self.view showAlertView:@"温馨提示：" message:@"亲爱的，已复制URL到黏贴板中！"];
            return;
        }
    }
    else if (buttonIndex == 2)
    {
        NSString *shareUrlSrt = @"http://www.cnblogs.com/boai/";
        NSString *shareText = [NSString stringWithFormat:@"测试（博爱BABaseProject）分享【博爱之家】！详情点击：%@", shareUrlSrt];
        // 注意：图片不能为空
        UIImage *shareImage = [UIImage imageNamed:@"icon1.jpg"];
        
        [[BAShareManage shareManage] BA_UMshareListWithViewControll:self withShareText:shareText image:shareImage url:shareUrlSrt];
    }
    else if (buttonIndex == 3)
    {
        /*! 刷新 */
        if (IOS8x) [self.wkWebView reload];
        else [self.webView reload];
    }
}

#pragma mark - wkWebView代理
#pragma mark 如果不添加这个，那么wkwebview跳转不了AppStore
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler
{
    if ([webView.URL.absoluteString hasPrefix:@"https://itunes.apple.com"])
    {
        BA_OpenUrl(navigationAction.request.URL);
        decisionHandler(WKNavigationActionPolicyCancel);
    }
    else
    {
        decisionHandler(WKNavigationActionPolicyAllow);
    }
}

- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation
{
    // 类似UIWebView的 -webViewDidStartLoad:
    NSLog(@"didStartProvisionalNavigation");
    BASharedApplication.networkActivityIndicatorVisible = YES;
}

- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation
{
    NSLog(@"didCommitNavigation");
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation
{
    // 类似 UIWebView 的 －webViewDidFinishLoad:
    NSLog(@"didFinishNavigation");
    if (webView.title.length > 0)
    {
        self.title = webView.title;
    }
}

- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation withError:(NSError *)error
{
    // 类似 UIWebView 的- webView:didFailLoadWithError:
    
    NSLog(@"didFailProvisionalNavigation");
}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler
{
    decisionHandler(WKNavigationResponsePolicyAllow);
}

//- (void)webView:(WKWebView *)webView didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition, NSURLCredential *))completionHandler
//{
//    
//}

//- (WKWebView *)webView:(WKWebView *)webView createWebViewWithConfiguration:(WKWebViewConfiguration *)configuration forNavigationAction:(WKNavigationAction *)navigationAction windowFeatures:(WKWindowFeatures *)windowFeatures
//{
//    // 接口的作用是打开新窗口委托
////    [self createNewWebViewWithURL:webView.URL.absoluteString config:configuration];
////    
////    return currentSubView.webView;
//}

- (void)webView:(WKWebView *)webView runJavaScriptConfirmPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(BOOL))completionHandler
{
    //  js 里面的alert实现，如果不实现，网页的alert函数无效  ,
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:message
                                                                             message:nil
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"确定"
                                                        style:UIAlertActionStyleDefault
                                                      handler:^(UIAlertAction *action) {
                                                          completionHandler(YES);
                                                      }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"取消"
                                                        style:UIAlertActionStyleCancel
                                                      handler:^(UIAlertAction *action){
                                                          completionHandler(NO);
                                                      }]];
    
    [self presentViewController:alertController animated:YES completion:^{}];
    
}

- (void)webView:(WKWebView *)webView runJavaScriptTextInputPanelWithPrompt:(NSString *)prompt defaultText:(NSString *)defaultText initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(NSString *))completionHandler
{
    completionHandler(@"Client Not handler");
}

#pragma mark 计算wkWebView进度条
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (object == self.wkWebView && [keyPath isEqualToString:@"estimatedProgress"])
    {
        CGFloat newprogress = [[change objectForKey:NSKeyValueChangeNewKey] doubleValue];
        if (newprogress == 1)
        {
            self.progressView.hidden = YES;
            [self.progressView setProgress:0 animated:NO];
        }
        else
        {
            self.progressView.hidden = NO;
            [self.progressView setProgress:newprogress animated:YES];
        }
    }
}

#pragma mark - ***** dealloc 记得取消监听
- (void)dealloc
{
    if (IOS8x)
    {
        [self.wkWebView removeObserver:self forKeyPath:@"estimatedProgress"];
    }
}

#pragma mark - ***** UIWebViewDelegate
#pragma mark 计算webView进度条
- (void)setLoadCount:(NSUInteger)loadCount
{
    _loadCount = loadCount;
    if (loadCount == 0)
    {
        self.progressView.hidden = YES;
        [self.progressView setProgress:0 animated:NO];
    }
    else
    {
        self.progressView.hidden = NO;
        CGFloat oldP = self.progressView.progress;
        CGFloat newP = (1.0 - oldP) / (loadCount + 1) + oldP;
        if (newP > 0.95)
        {
            newP = 0.95;
        }
        [self.progressView setProgress:newP animated:YES];
    }
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    self.loadCount ++;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    self.loadCount --;
    BASharedApplication.networkActivityIndicatorVisible = NO;
    self.title = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    self.loadCount --;
}



@end
