# BANetManager
![](https://img.shields.io/badge/platform-iOS-red.svg) ![](https://img.shields.io/badge/language-Objective--C-orange.svg) ![](https://img.shields.io/badge/license-MIT%20License-brightgreen.svg)  [![](https://img.shields.io/badge/微博-博爱1616-red.svg)](http://weibo.com/538298123)

### 基于AFNetworking 3.1最新版本的封装


## 1、更新内容

```
最新更新时间：2017-05-03 【倒叙】
最新Version：【Version：2.2】
更新内容：
2.2.1、优化方法名命名规范
2.2.2、优化网络状态实时监测 block 回调，去除多余设置，需要网络判断，直接调用block回调即可
2.2.3、新增 YYCache 缓存处理
2.2.4、新增自定义：超时设置，取消单个网络请求和取消所有网络请求
2.2.5、新增自定义：requestSerializer设置
2.2.6、新增自定义：responseSerializer设置
2.2.7、新增自定义：请求头设置
2.2.8、新增自定义 CA 证书 和 HTTPS 请求配置，只需把证书导入项目目录即可，无需设置
2.2.9、新增史上最全的 AFN 请求 NSLog 打印，详见 demo 控制台打印结果
2.2.10、新增 DEBUG 模式下的 NSLog 判断，release 下不会打印，请放心使用
2.2.11、如果打印数据不完整，是因为 Xcode 8 版本问题，请下断点打印数据
2.2.12、由于新版本改动较大，原有方法命名可能有所改动，希望老用户见谅！
2.2.13、目前版本较稳定，稍后奉上 pod 版本！请大家耐心等待


最新更新时间：2016-11-24 【倒叙】
最新Version：【Version：2.1】
更新内容：
2.1.1、优化方法名命名规范
2.1.2、新增网络状态实时监测 block 回调，新增单独网络监测 bool 返回，详见 demo
2.1.3、新增旧方法更新提示
2.1.4、优化各种注释

最新更新时间：2016-11-17
最新Version：【Version：2.0】
更新内容：
2.0.1、优化方法名命名规范
2.0.2、新增部分注释
2.0.3、视频上传方法对接，目前有很多项目对接成功
```

## 2、功能列表
- 10、视频上传部分已经亲测可用，目前多个项目检测暂无问题，大家可以放心使用了！
- 9、如果使用PHP后台，后台不会对接此接口的话，博爱已经为你们量身定做了PHP后台接口，你们只需要把文件夹中的 postdynamic.php 文件发送给你们的PHP后台同事，他们就知道了，里面都有详细说明！
- 8、优化自定义CA证书的导入配置
- 7、新增https请求参数设置，新增详细打印参数！
- 6、优化，新增https请求参数设置，新增详细打印参数！
- 5、集成网络监测，让你实时监测你的宝贝APP的网络状态【已经测试通过】
- 3、集成视频上传/下载，和文件下载，让视频的上传下载更方便，支持异步下载【已测试多个项目通过】
- 2、集成单图/多图上传，让图片上传更简单，自带压缩处理【已经测试通过】
- 1、集成 get / post / put / delete 等常用请求方式的封装【已经测试通过】

## 3、图片展示

![image](https://github.com/boai/BANetManager/blob/master/images/image.png)

## 4、数据打印展示

get 请求结果打印：

```
2017-05-03 10:32:38.070372+0800 BANetManagerDemo[1472:479146] ******************** 请求参数 ***************************
2017-05-03 10:32:38.070784+0800 BANetManagerDemo[1472:479146] 
请求头: {
    "Accept-Language" = "zh-Hans-CN;q=1";
    "User-Agent" = "BANetManagerDemo/1.0 (iPhone; iOS 10.3.2; Scale/2.00)";
}
超时时间设置：30.0 秒【默认：30秒】
AFHTTPResponseSerializer：<AFJSONResponseSerializer: 0x17005e4e0>【默认：AFJSONResponseSerializer】
AFHTTPRequestSerializer：<AFJSONRequestSerializer: 0x1700a2e20>【默认：AFJSONRequestSerializer】
请求方式: GET
请求URL: http://chanyouji.com/api/users/likes/268717.json
请求param: (null)
是否启用缓存：开启【默认：开启】
目前总缓存大小：0.005991M

2017-05-03 10:32:38.070833+0800 BANetManagerDemo[1472:479146] ********************************************************

```

post 请求结果打印：

```
2017-05-03 10:33:07.165523+0800 BANetManagerDemo[1472:479146] ******************** 请求参数 ***************************
2017-05-03 10:33:07.166295+0800 BANetManagerDemo[1472:479146] 
请求头: {
    Accept = "application/json";
    "Accept-Encoding" = gzip;
    "Accept-Language" = "zh-Hans-CN;q=1";
    "User-Agent" = "BANetManagerDemo/1.0 (iPhone; iOS 10.3.2; Scale/2.00)";
}
超时时间设置：15.0 秒【默认：30秒】
AFHTTPResponseSerializer：<AFJSONResponseSerializer: 0x17005e4e0>【默认：AFJSONResponseSerializer】
AFHTTPRequestSerializer：<AFJSONRequestSerializer: 0x1700a2e20>【默认：AFJSONRequestSerializer】
请求方式: POWT
请求URL: http://chanyouji.com/api/users/likes/268717.json
请求param: {
    page = 1;
    "per_page" = 10;
}
是否启用缓存：开启【默认：开启】
目前总缓存大小：0.008538M

2017-05-03 10:33:07.166472+0800 BANetManagerDemo[1472:479146] ********************************************************
```

## 5、自定义设置示例：
```
    // 1、自定义超时设置
    BANetManagerShare.timeoutInterval = 15;
    
    // 2、自定义添加请求头
    NSDictionary *headerDict = @{@"Accept":@"application/json", @"Accept-Encoding":@"gzip"};
    BANetManagerShare.httpHeaderFieldDictionary = headerDict;
    
    // 3、自定义更改 requestSerializer
//    BANetManagerShare.requestSerializer = BAHttpRequestSerializerHTTP;
     // 4、自定义更改 responseSerializer
//    BANetManagerShare.responseSerializer = BAHttpRequestSerializerHTTP;

```

## 6、请求示例
```
#pragma mark - ***** get
- (IBAction)getData:(UIButton *)sender
{
    BAWeak;
    // 如果打印数据不完整，是因为 Xcode 8 版本问题，请下断点打印数据
    [BANetManager ba_request_GETWithUrlString:url5 isNeedCache:YES parameters:nil successBlock:^(id response) {
        NSLog(@"get请求数据成功： *** %@", response);
        
    } failureBlock:^(NSError *error) {
        
    } progress:nil];
}

#pragma mark - ***** post
- (IBAction)postData:(UIButton *)sender
{
    BAWeak;
    // 1、自定义超时设置
    BANetManagerShare.timeoutInterval = 15;
    
    // 2、自定义添加请求头
    NSDictionary *headerDict = @{@"Accept":@"application/json", @"Accept-Encoding":@"gzip"};
    BANetManagerShare.httpHeaderFieldDictionary = headerDict;
    
    // 3、自定义更改 requestSerializer
//    BANetManagerShare.requestSerializer = BAHttpRequestSerializerHTTP;
     // 4、自定义更改 responseSerializer
//    BANetManagerShare.responseSerializer = BAHttpRequestSerializerHTTP;
    
    int page = 1;
    NSDictionary *parameters = [NSDictionary dictionaryWithObjectsAndKeys:@(page).stringValue, @"page", @"10", @"per_page", nil];;
    
    // 如果打印数据不完整，是因为 Xcode 8 版本问题，请下断点打印数据
    [BANetManager ba_request_POSTWithUrlString:url5 isNeedCache:YES parameters:parameters successBlock:^(id response) {
        NSLog(@"post请求数据成功： *** %@", response);

    } failureBlock:^(NSError *error) {
        
    } progress:nil];
}


#pragma mark - ***** 下载视频、图片
- (IBAction)downloadData:(UIButton *)sender
{
    UIButton *downloadBtn = (UIButton *)sender;
    NSString *path1 = [NSHomeDirectory() stringByAppendingString:[NSString stringWithFormat:@"/Documents/半塘.mp4"]];
    //    NSString *path2 = [NSHomeDirectory() stringByAppendingString:[NSString stringWithFormat:@"/Documents/image123.mp3"]];
    
    NSLog(@"路径：%@", path1);
    
    /*! 查找路径中是否存在"半塘.mp4"，是，返回真；否，返回假。 */
    //    BOOL result2 = [path1 hasSuffix:@"半塘.mp4"];
    //    NSLog(@"%d", result2);
    
    /*!
     下载前先判断该用户是否已经下载，目前用了两种方式：
     1、第一次下载完用变量保存，
     2、查找路径中是否包含改文件的名字
     如果下载完了，就不要再让用户下载，也可以添加alert的代理方法，增加用户的选择！
     */
    //    if (isFinishDownload || result2)
    //    {
    //        [[[UIAlertView alloc] initWithTitle:@"温馨提示：" message:@"您已经下载该视频！" delegate:nil cancelButtonTitle:@"确 定" otherButtonTitles:nil, nil] show];
    //        return;
    //    }
    BAWeak;
    NSString *url = @"http://static.yizhibo.com/pc_live/static/video.swf?onPlay=YZB.play&onPause=YZB.pause&onSeek=YZB.seek&scid=pALRs7JBtTRU9TWy";
    self.tasks = [BANetManager ba_downLoadFileWithUrlString:url
                                                 parameters:nil
                                                   savaPath:path1
                                               successBlock:^(id response) {

        NSLog(@"下载完成，路径为：%@", response);
        self.downloadLabel.text = @"下载完成";
        isFinishDownload = YES;
        [downloadBtn setTitle:@"下载完成" forState:UIControlStateNormal];
        [downloadBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        BAKit_ShowAlertWithMsg(@"视频下载完成！");
        
    } failureBlock:^(NSError *error) {
        
    } downLoadProgress:^(int64_t bytesProgress, int64_t totalBytesProgress) {
        /*! 封装方法里已经回到主线程，所有这里不用再调主线程了 */
        self.downloadLabel.text = [NSString stringWithFormat:@"下载进度：%.2lld%%",100 * bytesProgress/totalBytesProgress];
        [downloadBtn setTitle:@"下载中..." forState:UIControlStateNormal];
    }];
    
//    sender.selected = !sender.selected;
//    if (sender.selected)
//    {
//        [self.tasks resume];
//    }
//    else
//    {
//        [self.tasks suspend];
//        UIButton *downloadBtn = (UIButton *)sender;
//        [downloadBtn setTitle:@"暂停下载" forState:UIControlStateNormal];
//    }
    
}


#pragma mark - ***** 上传图片
- (IBAction)uploadImageData:(UIButton *)sender
{
    /*! 
     
     1、此上传图片单张、多图上传都经过几十个项目亲测可用，大家可以放心使用，使用过程中有问题，请加群：479663605 进行反馈，多谢！
     2、此处只需要传URL 和 parameters，和你的image数组、FileName就行了，具体压缩方法都已经做好处理！
     
     
     3、注意：如果使用PHP后台，后台不会对接此接口的话，博爱已经为你们量身定做了PHP后台接口，你们只需要把文件夹中的 postdynamic.php 文件发送给你们的PHP后台同事，他们就知道了，里面都有详细说明！
     
     */

    [BANetManager ba_uploadImageWithUrlString:nil parameters:nil imageArray:nil fileName:nil successBlock:^(id response) {
        
    } failurBlock:^(NSError *error) {
        
    } upLoadProgress:^(int64_t bytesProgress, int64_t totalBytesProgress) {
        
    }];
}

#pragma mark - ***** 上传视频
- (IBAction)uploadVideoData:(UIButton *)sender
{
    /*!
     
     1、此上传视频都经过几十个项目亲测可用，大家可以放心使用，使用过程中有问题，请加群：479663605 进行反馈，多谢！
     2、此处只需要传URL 和 parameters就行了，具体压缩方法都已经做好处理！

     */
    [BANetManager ba_uploadVideoWithUrlString:nil parameters:nil videoPath:nil successBlock:^(id response) {
        
    } failureBlock:^(NSError *error) {
        
    } uploadProgress:^(int64_t bytesProgress, int64_t totalBytesProgress) {
        
    }];
}

- (IBAction)putData:(UIButton *)sender
{
    NSString *url = @"http://120.76.245.240:8080/bda/resetPassword/?account=761463699@qq.com&password=q&OTP=634613";
    NSDictionary *dict = @{@"EquipmentType":@"iPhone", @"EquipmentGUID":@"b61df00d-87db-426f-bc5a-bc8fffa907db"};
    
    [BANetManager ba_request_PUTWithUrlString:url parameters:dict successBlock:^(id response) {
        NSLog(@"*********00000 : %@", response);
    } failureBlock:^(NSError *error) {
        
    } progress:nil];
}

- (IBAction)deleteData:(UIButton *)sender
{
    [BANetManager ba_request_DELETEWithUrlString:nil parameters:nil successBlock:nil failureBlock:nil progress:nil];
}

```

## 5、demo 下载
详情demo，请前往[『BABaseProject』](https://github.com/boai/BABaseProject)！<br>
Code4App 下载链接：[『BANetManager』](http://www.code4app.com/forum.php?mod=viewthread&tid=11787)！
