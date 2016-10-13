# Uncomment this line to define a global platform for your project
# platform :ios, '8.0'
# Uncomment this line if you're using Swift
# use_frameworks!

project 'BABaseProject.project'


# 去掉由pod引入的第三方库的警告，需要更新命令才生效
inhibit_all_warnings!

# pod 快速更新方法
# pod update --verbose --no-repo-update

target 'BABaseProject' do
    
    # 自定义button框架
    pod 'BAButton', '~> 1.0.1'
    
    # 一个完全实现自定义的alertView！目前为止，最为精简的alert封装！
    pod 'BACustomAlertView'
    
    # 对系统原生的AutoLayout 的 NSLayoutConstraints类的封装，优雅的链式语法，GitHub 排名第三
    pod 'Masonry', '~> 0.6.4'
    
    # 两个都是自动布局框架
    pod 'SDAutoLayout'
    
    # 为UI控件提供网络图片加载和缓存功能，AF已经整合了此功能，一般用AF就够了，据专业人士说：SD比AF快0.02秒，如果，同时引用AF和SD，那么AF的网络图片加载方法会被划线
    pod 'SDWebImage', '~> 3.7.5'
    
    # 为滚动控件（UIScrollView, UITableView, UICollectionView）添加头部脚部刷新UI
    pod 'MJRefresh', '~> 3.1.0'
    
    # 键盘框架
    pod 'IQKeyboardManager'
    
    # 专门用于转换 Array/Dictionary -> 对象模型 主要用于JSON解析，基本都用这个框架（必会）
    pod 'MJExtension', '~> 3.0.10'
    
    # GitHub 排名第一的网络操作框架，底层使用NSURLSession+NSOperation(多线程)
    pod 'AFNetworking', '~> 3.0'
    
    # 在屏幕中间显示 加载框 类似于安卓的toast效果
    pod 'MBProgressHUD'
    
    # 网络或本地 多张图片浏览 控制器
#    pod 'MWPhotoBrowser'

    # 友盟分享
#    pod 'UMengSocial', '~> 4.4'
    pod 'UMengSocialCOM', '~> 5.2.1'

    # 百度地图SDK
    pod 'BaiduMapKit'

    # 二维码
    #pod 'LBXScan','~> 1.1.1'
#    pod 'LBXAlertAction'
#    pod 'ZXingObjC', '~> 3.0'

    # 离屏渲染，切边角
    pod 'JMRoundedCorner'
    
    # 把系统的target+selector/委托模式 转为 Block语法，让代码结构更加紧凑
    pod 'BlocksKit'
    
    # 自定义提示框
#    pod 'Toast', '~> 3.0'

    # 线性布局MyLinearLayout/相对布局MyRelativeLayout/框架布局MyFrameLayout/表格布局MyTableLayout/流式布局MyFlowLayout/浮动布局MyFloatLayout/SizeClass的支持
    pod 'MyLayout', '~> 1.1.6'

    # 各种封装的集合！大神的多年积累！
    pod 'YYKit'
    
    # 内存泄露检测工具
    pod 'MLeaksFinder'
    
    # 空数据的处理
    pod 'NullSafe'
    
    # oc 与 js 交互框架
#    pod 'WebViewJavascriptBridge', '~> 5.0'

    # Facebook的内存检测工具
#    pod 'FBMemoryProfiler'

    # 空数据 的三方库
    pod 'DZNEmptyDataSet'


    # 截屏
#    pod 'SDScreenshotCapture'


    
    # 类似QQ侧滑框架
#    pod "JVFloatingDrawer"

    # 获取所有设备型号
#    pod 'DeviceUtil'

    # 一个 UICollectionViewLayout，长按可以拖拽排序，同时支持纵向和横线滚动。
# pod 'LewReorderableLayout'
    
    # WebView的进度条
#    pod 'NJKWebViewProgress'
    
    # 一个支持多选、选原图和视频的图片选择器，同时有预览功能，适配了iOS6789系统。
#    pod 'TZImagePickerController'

    # 一款支持七牛云存储的ios/mac sdk。它基于AFNetworking 2.x版本和七牛官方API构建。支持批量上传的七牛上传sdk
#    pod "QiniuUpload"


# UIWebView页面信息的离线缓存
#推荐一个比较好的第三方库RNCachingURLProtocol ，只需要在AppDelegate中加入下面方法即可。
#
#[NSURLProtocolregisterClass:[RNCachingURLProtocolclass]];
#
#地址:https://github.com/rnapier/RNCachingURLProtocol


    target 'BABaseProjectTests' do
        
    end

    target 'BABaseProjectUITests' do
        
    end
end

