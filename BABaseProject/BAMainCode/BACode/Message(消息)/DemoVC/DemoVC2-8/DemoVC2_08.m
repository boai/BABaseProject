//
//  DemoVC2_08.m
//  BABaseProject
//
//  Created by 博爱 on 2016/12/13.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "DemoVC2_08.h"
#import <JavaScriptCore/JavaScriptCore.h>

@interface DemoVC2_08 ()<UIWebViewDelegate>
{
    BOOL _authenticated;
    NSURLConnection *_urlConnection;
    NSMutableURLRequest *_request;
}
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (nonatomic, strong) BAButton *shareBtn;

@end

@implementation DemoVC2_08

- (BAButton *)shareBtn
{
    if (!_shareBtn)
    {
        _shareBtn = [BAButton new];
        _shareBtn.frame = CGRectMake(50, BA_SCREEN_HEIGHT - 200, 150, 40);
        [_shareBtn setTitle:@"OC按钮调用JS方法" forState:UIControlStateNormal];
        [_shareBtn setTitleColor:BA_White_Color forState:UIControlStateNormal];
        _shareBtn.titleLabel.font = BA_FontSize(14);
        [_shareBtn jm_setCornerRadius:5 withBackgroundColor:BA_Green_Color];
        _shareBtn.tag = 1001;
        [_shareBtn addTarget:self action:@selector(clickShareBtn:) forControlEvents:UIControlEventTouchUpInside];
        _shareBtn.titleLabel.textAlignment = NSTextAlignmentRight;
        
        [self.view addSubview:_shareBtn];
        
        [_shareBtn ba_shakeView];
    }
    return _shareBtn;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = BA_Yellow_Color;
    self.shareBtn.hidden = NO;
}

- (void)ba_setupUI
{
//    NSURL *url = [[NSBundle mainBundle] URLForResource:@"DemoVC2_08" withExtension:@"html"];
//    NSString *htmlContent = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
//    NSString *basePath = [[NSBundle mainBundle] bundlePath];
//    NSURL *baseURL = [NSURL fileURLWithPath:basePath];
//
//    [_webView loadHTMLString:htmlContent baseURL:baseURL];
    
    [self loadWeb];
    /*! 纯代码 */
//    UIWebView *web = [UIWebView new];
//    web.frame = CGRectMake(0, _cancleButton.bottom, KSCREEN_WIDTH, _detailView.height - _cancleButton.height);
//    web.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
//    web.scrollView.bounces = NO;
//    [self.view addSubview: web];
//    
//    NSURL *url = [[NSBundle mainBundle] URLForResource:@"video_synopsis.html" withExtension:nil];
//    NSString *htmlContent = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
//    NSString *tempContent = [htmlContent stringByReplacingOccurrencesOfString:@"<!--$content-->" withString:self.model.desc];
//    NSString *tempContent2 = [tempContent stringByReplacingOccurrencesOfString:@"<!--$title-->" withString:self.model.title];
//    NSString *tempContent3 = [tempContent2 stringByReplacingOccurrencesOfString:@"<!--$videoAmount-->" withString:self.model.viewNum];
//    NSString *tempContent4 = [tempContent3 stringByReplacingOccurrencesOfString:@"<!--$commentsAmount-->" withString:self.model.reviewNum];
//    
//    NSString *tempContent5 = [tempContent4 stringByReplacingOccurrencesOfString:@"white-space: nowrap;" withString:@" "];
    
    
//    NSString *basePath = [[NSBundle mainBundle] bundlePath];
//    NSURL *baseURL = [NSURL fileURLWithPath:basePath];
//    
//    [web loadHTMLString:tempContent5 baseURL:baseURL];
//    
//    
//    [self.view addSubview:_detailView];

}


- (void)loadWeb{
    
    //1..加载H5地址
    
    //加载地址
    
//    NSString *str = @"H5传过来的地址";
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"DemoVC2_08" withExtension:@"html"];
    NSURLRequest *reUrl = [NSURLRequest requestWithURL:url];

    [self.webView loadRequest:reUrl];
    
    ///主要 这里是直接传地址给H5 属于get方法传输 但是有参数长度限制  也有post传输 不限制参数长度  这里不另外写 很简单  也是几行代码的事情
    
    //2..JS调用OC   其实就是客户端传给H5页面的地址  这里也要约定字段
    
//    NSString *string = [NSString stringWithFormat:@"?约定字段={\"参数名\":\"参数内容\"}"];
//    string = [string stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//    NSString *strURL = [NSString stringWithFormat:@"%@%@",str,string];
//    NSURL *cateUrl = [NSURL URLWithString:strURL];
//    NSURLRequest *request = [NSURLRequest requestWithURL:cateUrl];
//    [self.webView loadRequest:request];
    
}
//
//
//
//
#pragma mark - OC 拦截 JS 方法！ 方法一：【原生 webView】！
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSLog(@"URL scheme:%@", [request.URL scheme]);
    NSLog(@"URL query: %@", [request.URL query]);
    NSString *jsonText = [[request.URL query] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    /*!
     注意：1. JS中的  function asdbtn() ,在拦截到的url scheme全都被转化为小写。
     2.html中需要设置编码，否则中文参数可能会出现编码问题。
     3.JS用打开一个iFrame的方式替代直接用document.location的方式，以避免多次请求，被替换覆盖的问题。
     */
    NSURL *jsUrl = [request URL];
    NSString *scheme = [jsUrl scheme];
    NSLog(@"scheme = %@",scheme);
    /*! 判断是不是https */
//    if (!_authenticated) {
//        
//        _authenticated = NO;
//        _urlConnection = [[NSURLConnection alloc] initWithRequest:_request delegate:self];
//        
//        [_urlConnection start];
//        
//        return NO;
//    }
    
//    if ([scheme isEqualToString:@"ba_shareClick"])
//    {
//        NSArray *h5Params = [jsUrl.query componentsSeparatedByString:@"&"];
//        NSMutableDictionary *h5Dict = [NSMutableDictionary dictionary];
//        for (NSString *paramString in h5Params)
//        {
//            NSArray *array = [paramString componentsSeparatedByString:@"="];
//            if (array.count > 1)
//            {
//                NSString *decodeValue = [array[1] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//                [h5Dict setObject:decodeValue forKey:array[0]];
//            }
//        }
//        [self.view BA_showAlertWithTitle:@"这是OC原生的弹出窗！"];
//        return NO;
//    }
    /*! 和 H5 端约定的字段名【ba://】 */
    if([request.URL.absoluteString rangeOfString:@"ba_shareFunction://" options:NSCaseInsensitiveSearch].location != NSNotFound)
    {
//        NSString *jsonStr = [request.URL.absoluteString componentsSeparatedByString:@"ba_shareFunction://"][1];

//        NSDictionary *dict = [jsonText mj_JSONObject];
//        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:[jsonText dataUsingEncoding:NSUTF8StringEncoding] options:0 error:nil];

        NSArray *params =[request.URL.query componentsSeparatedByString:@"&"];
        
        NSMutableDictionary *tempDic = [NSMutableDictionary dictionary];
        for (NSString *paramStr in params)
        {
            NSArray *dicArray = [paramStr componentsSeparatedByString:@"="];
            if (dicArray.count > 1)
            {
                NSString *decodeValue = [dicArray[1] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
                [tempDic setObject:decodeValue forKey:dicArray[0]];
            }
        }

        NSLog(@"从H5端获取的参数字典：%@", tempDic);
        
        /*! 
         从H5端获取的参数字典：
         {
             content = "欢迎使用博爱分享2.1版本";
             imagePath = "图片地址";
             title = "博爱分享2.1版本";
             url = "www.baidu.com";
         }
         */
        
        /*! 
         与后台进行交互  上传服务器  这里是测试demo  假设传回来的字典参数都上传服务器
         */
        NSString *msg = [NSString stringWithFormat:@"分享标题：%@，\n内容：%@，\n图片URL：%@，\nURL：%@", tempDic[@"title"], tempDic[@"content"], tempDic[@"imagePath"], tempDic[@"url"]];
        [[[UIAlertView alloc] initWithTitle:@"这是OC原生的弹出窗！" message:msg delegate:self cancelButtonTitle:@"收到" otherButtonTitles:nil] show];
        return NO;
    }
    return YES;
}

#pragma mark - OC 拦截 JS 方法二：【JavaScriptCore 库】！
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    /*! 
     在iOS 7之后，apple添加了一个新的库JavaScriptCore，用来做JS交互，因此JS与原生OC交互也变得简单了许多。
     首先导入JavaScriptCore库, 然后在OC中获取JS的上下文
     
     */
    /*! 获取webView上的js */
    JSContext *contest = [webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    
    /*! 
     再然后定义好JS需要调用的方法，例如JS要调用 asdbtn 方法：
     则可以在UIWebView加载url完成后，在其代理方法中添加要调用的 asdbtn 方法：
    */
//    contest[@"asdbtn"] = ^(){
//
//        NSLog(@"+++++++Begin Log+++++++");
//        NSArray *args = [JSContext currentArguments];
//        
//        /*! 
//         注意：
//         可能最新版本的iOS系统做了改动，现在（iOS10，Xcode 7.2，去年使用Xcode 6 和iOS 8没有线程问题）中测试,block中是在子线程，因此执行UI操作，控制台有警告，需要回到主线程再操作UI。
//         */
//        dispatch_async(dispatch_get_main_queue(), ^{
//            // 这里网页上的按钮被点击了, 客户端可以在这里拦截到,并进行操作
//            [self.view BA_showAlertWithTitle:@"这是OC原生的弹出窗！"];
//            
//        });
//        
//        for (JSValue *jsVal in args) {
//            NSLog(@"%@", jsVal.toString);
//        }
//        
//        NSLog(@"-------End Log-------");
//    };
    
}

#pragma mark - OC 按钮调用 JS 方法：【JavaScriptCore 库】！
- (IBAction)clickShareBtn:(UIButton *)sender
{
    /*! 
     方式一 ：
     需要传给 JS 的参数可以拼接在后面即可！
     */
//    NSString *jsStr = [NSString stringWithFormat:@"showAlert('%@')",@"这里是JS中alert弹出的message"];
//    [_webView stringByEvaluatingJavaScriptFromString:jsStr];
    
    /*! 
     方式二
     继续使用JavaScriptCore库来做JS交互。
     */
    JSContext *context = [self.webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    NSString *textJS = [NSString stringWithFormat:@"showAlert('%@')",@"这里是JS中alert弹出的message"];
    [context evaluateScript:textJS];
    
    /*! 
     重点：
     stringByEvaluatingJavaScriptFromString是一个同步的方法，使用它执行JS方法时，如果JS 方法比较耗的时候，会造成界面卡顿。尤其是js 弹出alert 的时候。
     alert 也会阻塞界面，等待用户响应，而stringByEvaluatingJavaScriptFromString又会等待js执行完毕返回。这就造成了死锁。
     官方推荐使用WKWebView的evaluateJavaScript:completionHandler:代替这个方法。
     其实我们也有另外一种方式，自定义一个延迟执行alert 的方法来防止阻塞，然后我们调用自定义的alert 方法。同理，耗时较长的js 方法也可以放到setTimeout 中。
     */
}
@end
