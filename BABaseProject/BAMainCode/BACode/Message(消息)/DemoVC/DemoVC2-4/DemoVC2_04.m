//
//  DemoVC2_04.m
//  BABaseProject
//
//  Created by boai on 2016/9/21.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "DemoVC2_04.h"
#import <BaiduMapAPI_Base/BMKBaseComponent.h>//引入base相关所有的头文件

#import <BaiduMapAPI_Map/BMKMapComponent.h>//引入地图功能所有的头文件

#import <BaiduMapAPI_Search/BMKSearchComponent.h>//引入检索功能所有的头文件

#import <BaiduMapAPI_Cloud/BMKCloudSearchComponent.h>//引入云检索功能所有的头文件

#import <BaiduMapAPI_Location/BMKLocationComponent.h>//引入定位功能所有的头文件

#import <BaiduMapAPI_Utils/BMKUtilsComponent.h>//引入计算工具所有的头文件

#import <BaiduMapAPI_Radar/BMKRadarComponent.h>//引入周边雷达功能所有的头文件

#import <BaiduMapAPI_Map/BMKMapView.h>//只引入所需的单个头文件

#import "RDVTabBarController.h"

/*! 大头针动画 */
#import "MyAnimatedAnnotationView.h"

#import "BAUserModel.h"


#define MYBUNDLE_NAME @ "mapapi.bundle"
#define MYBUNDLE_PATH [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent: MYBUNDLE_NAME]
#define MYBUNDLE [NSBundle bundleWithPath: MYBUNDLE_PATH]

@interface DemoVC2_04 ()
<
    UIGestureRecognizerDelegate
>
{
    BOOL                 enableCustomMap;
    
    BMKCircle           *circle;
    BMKPolygon          *polygon;
    BMKPolygon          *polygon2;
    BMKPolyline         *polyline;
    BMKPolyline         *colorfulPolyline;
    BMKArcline          *arcline;
    BMKGroundOverlay    *ground2;
    BMKPointAnnotation  *pointAnnotation;
    BMKPointAnnotation  *animatedAnnotation;
}
@property (nonatomic, strong) BAUserModel *userModel;

//@property (nonatomic, assign) float latitude;    //当前所处位置的纬度
//@property (nonatomic, assign) float longitude;    //当前所处位置的经度
//
//@property (nonatomic, assign) float lat;
//@property (nonatomic, assign) float lng;

@end

@implementation DemoVC2_04

- (void)viewWillAppear:(BOOL)animated
{
    [_mapView viewWillAppear];
    _mapView.delegate = self; // 此处记得不用的时候需要置nil，否则影响内存的释放
    _locService.delegate = self;
    
    [BMKMapView enableCustomMapStyle:enableCustomMap];
    
    [self startLocation:nil];

    [[self rdv_tabBarController] setTabBarHidden:YES animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [BMKMapView enableCustomMapStyle:NO];//关闭个性化地图
    [_mapView viewWillDisappear];
    _mapView.delegate = nil; // 不用时，置nil
    _locService.delegate = nil;
    
    [[self rdv_tabBarController] setTabBarHidden:NO animated:YES];
}

- (void)ba_configerBaiDuMap
{
    NSLog(@"base     component version: %@", BMKGetMapApiBaseComponentVersion());
    NSLog(@"map      component version: %@", BMKGetMapApiMapComponentVersion());
    NSLog(@"location component version: %@", BMKGetMapApiLocationComponentVersion());
    NSLog(@"search   component version: %@", BMKGetMapApiSearchComponentVersion());
    NSLog(@"cloud    component version: %@", BMKGetMapApiCloudComponentVersion());
    NSLog(@"radar    component version: %@", BMKGetMapApiRadarComponentVersion());
    NSLog(@"utils    component version: %@", BMKGetMapApiUtilsComponentVersion());
    
    
    
}

+ (void)initialize
{
    //设置自定义地图样式，会影响所有地图实例
    //注：必须在BMKMapView对象初始化之前调用
    NSString* path = [[NSBundle mainBundle] pathForResource:@"custom_config_清新蓝" ofType:@""];
    [BMKMapView customMapStyle:path];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self ba_configerBaiDuMap];

    /*! 适配ios7 */
    if( ([[[UIDevice currentDevice] systemVersion] doubleValue] >= 7.0))
    {
        self.navigationController.navigationBar.translucent = NO;
    }
    /*! 添加普通地图/个性化地图切换开关 */
    UISegmentedControl *segment = [[UISegmentedControl alloc] initWithItems:@[@"normal", @"custom"]];
    [segment setSelectedSegmentIndex:0];
    [segment addTarget:self action:@selector(changeMapAction:) forControlEvents:UIControlEventValueChanged];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:segment];
    enableCustomMap = NO;
    
    _mapView.showsUserLocation = YES;//显示定位图层
    _mapView.userTrackingMode = BMKUserTrackingModeFollow;
    /*! 设置地图缩放级别 */
    _mapView.zoomLevel = 18;
    
    [self addCustomGestures];//添加自定义的手势
    
    [self ba_startLocation];
    
    
}

- (void)ba_startLocation
{
    _locService = [[BMKLocationService alloc]init];
    [followHeadBtn setEnabled:NO];
    [followingBtn setAlpha:0.6];
    [followingBtn setEnabled:NO];
    [followHeadBtn setAlpha:0.6];
    [stopBtn setEnabled:NO];
    [stopBtn setAlpha:0.6];
    
//    BMKLocationViewDisplayParam *displayParam = [[BMKLocationViewDisplayParam alloc]init];
//    displayParam.isRotateAngleValid = false;//跟随态旋转角度是否生效
//    displayParam.isAccuracyCircleShow = false;//精度圈是否显示
//    displayParam.locationViewImgName= @"icon";//定位图标名称
//    displayParam.locationViewOffsetX = 0;//定位偏移量(经度)
//    displayParam.locationViewOffsetY = 0;//定位偏移量（纬度）
//    [_mapView updateLocationViewWithParam:displayParam];
    
}

//添加标注
- (void)addPointAnnotation
{
    if (pointAnnotation == nil)
    {
        pointAnnotation = [[BMKPointAnnotation alloc]init];
        CLLocationCoordinate2D coor;
//        if (_userModel.m_local2D.latitude)
//        {
            coor.latitude  = 23.221759;
            coor.longitude = 113.41588;
//        }
        
        pointAnnotation.coordinate = coor;
        pointAnnotation.title = @"博爱test大头针";
        pointAnnotation.subtitle = @"欢迎来到博爱之家!";
        
        /*! 注意：如果要批量添加大头针的话，要单独写一个继承自 BMKPointAnnotation 类的model 类，然后用 for 循环添加 model 给 pointAnnotation */
//        pointAnnotation.poiModel = model;
        pointAnnotation.coordinate = coor;
        
       
    }
    [_mapView addAnnotation:pointAnnotation];
}

- (void)moveToCoordinate:(CLLocationCoordinate2D)coordinate
{
    // 添加一个标记位
    BMKCoordinateRegion viewRegion = BMKCoordinateRegionMake(coordinate, BMKCoordinateSpanMake(0.001, 0.001));
    BMKCoordinateRegion adjustedRegion = [_mapView regionThatFits:viewRegion];
    [_mapView setRegion:adjustedRegion animated:YES];
    //    //[m_mapView setRegion:viewRegion animated:YES];
    
    [_mapView setCenterCoordinate:coordinate animated:YES];
}

// 添加动画Annotation
- (void)addAnimatedAnnotation
{
    if (animatedAnnotation == nil)
    {
        animatedAnnotation = [[BMKPointAnnotation alloc]init];
        CLLocationCoordinate2D coor;
//        if (_userModel.m_local2D.latitude)
//        {
//            coor.latitude  = _userModel.m_local2D.latitude;
//            coor.longitude = _userModel.m_local2D.longitude;
//        }
        coor.latitude  = 23.102659;
        coor.longitude = 113.242788;
        /*!
         lat 23.001859,long 113.341688
         */
        animatedAnnotation.coordinate = coor;
        animatedAnnotation.title = @"我是动画Annotation";
    }
    [_mapView addAnnotation:animatedAnnotation];
}

- (void)changeMapAction:(UISegmentedControl *)segment
{
    /*
     *注：必须在BMKMapView对象初始化之前设置自定义地图样式，设置后会影响所有地图实例
     *设置方法：+ (void)customMapStyle:(NSString*) customMapStyleJsonFilePath;
     */
    enableCustomMap = segment.selectedSegmentIndex == 1;
    //打开/关闭个性化地图
    [BMKMapView enableCustomMapStyle:enableCustomMap];
}

#pragma mark - BMKMapViewDelegate
- (void)mapViewDidFinishLoading:(BMKMapView *)mapView
{
    //    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"BMKMapView控件初始化完成" delegate:nil cancelButtonTitle:@"知道了" otherButtonTitles: nil];
    //    [alert show];
    //    alert = nil;
}

- (void)mapView:(BMKMapView *)mapView onClickedMapBlank:(CLLocationCoordinate2D)coordinate
{
    NSLog(@"map view: click blank");
}

- (void)mapview:(BMKMapView *)mapView onDoubleClick:(CLLocationCoordinate2D)coordinate
{
    NSLog(@"map view: double click");
}

// 根据anntation生成对应的View
- (BMKAnnotationView *)mapView:(BMKMapView *)mapView viewForAnnotation:(id <BMKAnnotation>)annotation
{
    // 普通annotation
    if (annotation == pointAnnotation)
    {
        NSString *AnnotationViewID = @"renameMark";
        BMKPinAnnotationView *annotationView = (BMKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:AnnotationViewID];
        if (annotationView == nil) {
            annotationView = [[BMKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:AnnotationViewID];
            // 设置颜色
            annotationView.pinColor = BMKPinAnnotationColorRed;
            // 从天上掉下效果
            annotationView.animatesDrop = YES;
            // 设置可拖拽
            annotationView.draggable = YES;
        }
        return annotationView;
    }
    
    //动画annotation
    NSString *AnnotationViewID = @"AnimatedAnnotation";
    MyAnimatedAnnotationView *annotationView = nil;
    if (annotationView == nil) {
        annotationView = [[MyAnimatedAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:AnnotationViewID];
    }
    NSMutableArray *images = [NSMutableArray array];
    for (int i = 1; i < 4; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"poi_%d.png", i]];
        [images addObject:image];
    }
    annotationView.annotationImages = images;
    return annotationView;
    
}

// 当点击annotation view弹出的泡泡时，调用此接口
- (void)mapView:(BMKMapView *)mapView annotationViewForBubble:(BMKAnnotationView *)view;
{
    NSLog(@"paopaoclick");
}

#pragma mark - 添加自定义的手势（若不自定义手势，不需要下面的代码）

- (void)addCustomGestures
{
    /*
     *注意：
     *添加自定义手势时，必须设置UIGestureRecognizer的属性cancelsTouchesInView 和 delaysTouchesEnded 为NO,
     *否则影响地图内部的手势处理
     */
    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleDoubleTap:)];
    doubleTap.delegate = self;
    doubleTap.numberOfTapsRequired = 2;
    doubleTap.cancelsTouchesInView = NO;
    doubleTap.delaysTouchesEnded = NO;
    
    [self.view addGestureRecognizer:doubleTap];
    
    /*
     *注意：
     *添加自定义手势时，必须设置UIGestureRecognizer的属性cancelsTouchesInView 和 delaysTouchesEnded 为NO,
     *否则影响地图内部的手势处理
     */
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
    singleTap.delegate = self;
    singleTap.cancelsTouchesInView = NO;
    singleTap.delaysTouchesEnded = NO;
    [singleTap requireGestureRecognizerToFail:doubleTap];
    [self.view addGestureRecognizer:singleTap];
}

- (void)handleSingleTap:(UITapGestureRecognizer *)theSingleTap
{
    /*
     *do something
     */
    NSLog(@"my handleSingleTap");
}

- (void)handleDoubleTap:(UITapGestureRecognizer *)theDoubleTap
{
    /*
     *do something
     */
    NSLog(@"my handleDoubleTap");
}

//普通态
- (IBAction)startLocation:(id)sender
{
    NSLog(@"进入普通定位态");
    [_locService startUserLocationService];
    _mapView.showsUserLocation = NO;//先关闭显示的定位图层
    _mapView.userTrackingMode = BMKUserTrackingModeNone;//设置定位的状态
    _mapView.showsUserLocation = YES;//显示定位图层
    [startBtn setEnabled:NO];
    [startBtn setAlpha:0.6];
    [stopBtn setEnabled:YES];
    [stopBtn setAlpha:1.0];
    [followHeadBtn setEnabled:YES];
    [followHeadBtn setAlpha:1.0];
    [followingBtn setEnabled:YES];
    [followingBtn setAlpha:1.0];
}
//罗盘态
- (IBAction)startFollowHeading:(id)sender
{
    NSLog(@"进入罗盘态");
    
    _mapView.showsUserLocation = NO;
    _mapView.userTrackingMode = BMKUserTrackingModeFollowWithHeading;
    _mapView.showsUserLocation = YES;
    
}
//跟随态
- (IBAction)startFollowing:(id)sender
{
    NSLog(@"进入跟随态");
    
    _mapView.showsUserLocation = NO;
    _mapView.userTrackingMode = BMKUserTrackingModeFollow;
    _mapView.showsUserLocation = YES;
    
}
//停止定位
- (IBAction)stopLocation:(id)sender
{
    [_locService stopUserLocationService];
    _mapView.showsUserLocation = NO;
    [stopBtn setEnabled:NO];
    [stopBtn setAlpha:0.6];
    [followHeadBtn setEnabled:NO];
    [followHeadBtn setAlpha:0.6];
    [followingBtn setEnabled:NO];
    [followingBtn setAlpha:0.6];
    [startBtn setEnabled:YES];
    [startBtn setAlpha:1.0];
}

/**
 *在地图View将要启动定位时，会调用此函数
 *@param mapView 地图View
 */
- (void)willStartLocatingUser
{
    NSLog(@"start locate");
    
//    [self startLocation:nil];
}

/**
 *用户方向更新后，会调用此函数
 *@param userLocation 新的用户位置
 */
- (void)didUpdateUserHeading:(BMKUserLocation *)userLocation
{
    [_mapView updateLocationData:userLocation];
    NSLog(@"heading is %@",userLocation.heading);
}

/**
 *用户位置更新后，会调用此函数
 *@param userLocation 新的用户位置
 */
- (void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation
{
    NSLog(@"didUpdateUserLocation lat %f,long %f",userLocation.location.coordinate.latitude,userLocation.location.coordinate.longitude);
    
    [_mapView updateLocationData:userLocation];
    [self startFollowing:nil];
    _userModel.m_local2D = userLocation.location.coordinate;
    
    
    /*! 添加标注 */
    [_mapView removeOverlays:_mapView.overlays];
    [self addPointAnnotation];
    [self addAnimatedAnnotation];
    
    /*! 在地图View停止定位后，会调用此函数 */
    [self didStopLocatingUser];
    
    
}

/**
 *在地图View停止定位后，会调用此函数
 *@param mapView 地图View
 */
- (void)didStopLocatingUser
{
    NSLog(@"stop locate");
    
    
}

/**
 *定位失败后，会调用此函数
 *@param mapView 地图View
 *@param error 错误号，参考CLError.h中定义的错误号
 */
- (void)didFailToLocateUserWithError:(NSError *)error
{
    NSLog(@"location error");
}

- (void)dealloc
{
    if (_mapView)
    {
        _mapView = nil;
    }
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

@end
