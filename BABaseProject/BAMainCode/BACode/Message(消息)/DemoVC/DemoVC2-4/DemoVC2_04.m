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

#import <BaiduMapAPI_Map/BMKMapComponent.h>
#import <BaiduMapAPI_Location/BMKLocationComponent.h>

#import <BaiduMapAPI_Utils/BMKUtilsComponent.h>
#import <BaiduMapAPI_Search/BMKSearchComponent.h>


#define MYBUNDLE_NAME @ "mapapi.bundle"
#define MYBUNDLE_PATH [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent: MYBUNDLE_NAME]
#define MYBUNDLE [NSBundle bundleWithPath: MYBUNDLE_PATH]


@interface DemoVC2_04 ()
<
    BMKMapViewDelegate,
    BMKLocationServiceDelegate,
    BMKGeoCodeSearchDelegate,
    BMKPoiSearchDelegate,
    UIGestureRecognizerDelegate,
    UITextFieldDelegate
>
{
    BMKLocationService  *_locService;
    BMKGeoCodeSearch    * _geocodesearch;
    
    BOOL                 enableCustomMap;
    BOOL                 isGeoSearch;
    
    BMKPointAnnotation  *pointAnnotation;
    BMKPoiSearch        *_poisearch;
    int curPage;
    
}

@property(nonatomic, strong) BMKMapView *mapView;
@property (nonatomic, strong) NSString *searchKeyWord;

@property(nonatomic, strong) UIButton *locationButton;
@property(nonatomic, strong) UIView *searchView;
@property(nonatomic, strong) UILabel *searchLabel;
@property(nonatomic, strong) UITextField *searchTextField;
@property(nonatomic, strong) UIButton *voiceButton;

@property (nonatomic, strong) BMKAddressComponent *myCurrent_addressDetail;
// 当前所处位置的纬度 经度
@property(nonatomic, assign) CLLocationCoordinate2D myCurrent_locationCoordinate2D;

@end

@implementation DemoVC2_04

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self base_viewWillAppear];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self base_viewWillDisappear];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self setupUI];
}

- (void)base_viewWillAppear
{
    [_mapView viewWillAppear];
    _mapView.delegate = self; // 此处记得不用的时候需要置nil，否则影响内存的释放
    _locService.delegate = self;
    _geocodesearch.delegate = self; // 此处记得不用的时候需要置nil，否则影响内存的释放
    _poisearch.delegate = self; // 此处记得不用的时候需要置nil，否则影响内存的释放
    
    [self startLocation];
}

- (void)base_viewWillDisappear
{
    [_mapView viewWillDisappear];
    //    _mapView.delegate = nil; // 不用时，置nil
    //    _locService.delegate = nil;
    //    _geocodesearch.delegate = nil; // 不用时，置nil
    //    _poisearch.delegate = nil; // 不用时，置nil
    
    //    [self stopLocation];
}

- (void)setupUI
{
    
    //    [self startLocation];
    
    self.mapView.hidden = NO;
    self.locationButton.hidden = NO;
    self.searchView.hidden = NO;
    self.searchTextField.hidden = NO;
    self.voiceButton.hidden = NO;
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    CGFloat min_x = 0;
    CGFloat min_y = 0;
    CGFloat min_w = 0;
    CGFloat min_h = 0;
    
    min_x = 0;
    min_y = 0;
    min_w = SCREENWIDTH;
    min_h = SCREENHEIGHT - min_y - 49;
    
    self.mapView.frame = CGRectMake(min_x, min_y, min_w, min_h);
    
    min_x = 20;
    min_y = SCREENHEIGHT - 100;
    min_w = 30;
    min_h = min_w;
    
    self.locationButton.frame = CGRectMake(min_x, min_y, min_w, min_h);
    
    min_x = 10;
    min_y = 20;
    min_w = SCREENWIDTH - 2 * min_x;
    min_h = 50;
    
    self.searchView.frame = CGRectMake(min_x, min_y, min_w, min_h);
    [self.searchView ba_setBordersWithColor:nil andCornerRadius:5 andWidth:0];
    
    min_y = 0;
    CGSize size = BAKit_LabelSizeWithTextAndFont(self.searchLabel.text, BAKit_FontSystem_15);
    min_w = size.width;
    
    self.searchLabel.frame = CGRectMake(min_x, min_y, min_w, min_h);
    
    min_w = 30;
    min_x = self.searchView.width - min_w - 10;
    min_h = min_w;
    self.voiceButton.frame = CGRectMake(min_x, min_y, min_w, min_h);
    self.voiceButton.centerY = self.searchLabel.centerY;
    
    min_x = self.searchLabel.right + 0;
    min_w = self.voiceButton.x - min_x;
    min_h = 50;
    self.searchTextField.frame = CGRectMake(min_x, min_y, min_w, min_h);
    self.searchTextField.centerY = self.searchLabel.centerY;
    
}

#pragma mark - 搜索附近信息
- (void)ba_mapBasePointSearchKeyWord:(NSString *)searchKeyWord
{
    _mapView.isSelectedAnnotationViewFront = YES;
    
    curPage = 0;
    BMKBasePoiSearchOption *basePoiSearchOption = [[BMKBasePoiSearchOption alloc]init];
    basePoiSearchOption.pageIndex = curPage;
    basePoiSearchOption.pageCapacity = 10;
    basePoiSearchOption.keyword = searchKeyWord;
    //    basePoiSearchOption.location = locationCoordinate2D;
    
    //    BOOL flag = [_poisearch poiSearchNearBy:basePoiSearchOption];
    //    if(flag)
    //    {
    ////        _nextPageButton.enabled = true;
    //        NSLog(@"城市内检索发送成功");
    //    }
    //    else
    //    {
    ////        _nextPageButton.enabled = false;
    //        NSLog(@"城市内检索发送失败");
    //    }
    
}

- (void)ba_mapPointNearbySearchLocationCoordinate2D:(CLLocationCoordinate2D)locationCoordinate2D
                                      searchKeyWord:(NSString *)searchKeyWord
{
    _mapView.isSelectedAnnotationViewFront = YES;
    
    curPage = 0;
    BMKNearbySearchOption *nearbyPoiSearchOption = [[BMKNearbySearchOption alloc]init];
    nearbyPoiSearchOption.pageIndex = curPage;
    nearbyPoiSearchOption.pageCapacity = 50;
    //    nearbyPoiSearchOption.radius = 1000;
    nearbyPoiSearchOption.keyword = searchKeyWord;
    nearbyPoiSearchOption.location = locationCoordinate2D;
    nearbyPoiSearchOption.sortType = BMK_POI_SORT_BY_DISTANCE;
    
    BOOL flag = [_poisearch poiSearchNearBy:nearbyPoiSearchOption];
    if(flag)
    {
        //        _nextPageButton.enabled = true;
        NSLog(@"周边检索发送成功");
    }
    else
    {
        //        _nextPageButton.enabled = false;
        NSLog(@"周边检索发送失败");
        BAKit_ShowAlertWithMsg_ios8(@"没有搜到相关信息！");
    }
    
}


- (void)ba_configerBaiDuMap
{
    NSLog(@"base     component version: %@", BMKGetMapApiBaseComponentVersion());
    NSLog(@"map      component version: %@", BMKGetMapApiMapComponentVersion());
    NSLog(@"location component version: %@", BMKGetMapApiLocationComponentVersion());
    NSLog(@"search   component version: %@", BMKGetMapApiSearchComponentVersion());
    NSLog(@"utils    component version: %@", BMKGetMapApiUtilsComponentVersion());
}

#pragma mark - ***** 正向地理编码
//- (void)ba_GeoCode
//{
//    _geocodesearch = [[BMKGeoCodeSearch alloc]init];
//    //    _coordinateXText = @"116.403981";
//    //    _coordinateYText = @"39.915101";
//    _cityText = @"北京";
//    _addrText = @"海淀区上地十街10号";
//    [_mapView setZoomLevel:14];
//
//    /*! 正向地理编码 */
//    [self onClickGeocodeWithCity:_cityText address:_addrText];
//}

- (void)onClickGeocodeWithCity:(NSString *)city address:(NSString *)adress
{
    isGeoSearch = YES;
    BMKGeoCodeSearchOption *geocodeSearchOption = [[BMKGeoCodeSearchOption alloc]init];
    geocodeSearchOption.city= city;
    geocodeSearchOption.address = adress;
    BOOL flag = [_geocodesearch geoCode:geocodeSearchOption];
    if(flag)
    {
        NSLog(@"geo检索发送成功");
    }
    else
    {
        NSLog(@"geo检索发送失败");
    }
    
}

- (void)onGetGeoCodeResult:(BMKGeoCodeSearch *)searcher result:(BMKGeoCodeResult *)result errorCode:(BMKSearchErrorCode)error
{
    NSArray* array = [NSArray arrayWithArray:_mapView.annotations];
    [_mapView removeAnnotations:array];
    
    if (error == 0) {
        BMKPointAnnotation* item = [[BMKPointAnnotation alloc]init];
        item.coordinate = result.location;
        item.title = result.address;
        [_mapView addAnnotation:item];
        _mapView.centerCoordinate = result.location;
        NSString* titleStr;
        NSString* showmeg;
        
        titleStr = @"正向地理编码成功！";
        //        showmeg = [NSString stringWithFormat:@"纬度:%f,经度:%f",item.coordinate.latitude,item.coordinate.longitude];
        //
        //        BAKit_ShowAlertWithMsg_ios8(showmeg);
    }
}

#pragma mark - ***** 反向地理编码
- (void)ba_ReverseGeocodeWithCLLocationCoordinate2D:(CLLocationCoordinate2D )locationCoordinate2D
{
    isGeoSearch = false;
    CLLocationCoordinate2D pt = (CLLocationCoordinate2D){0, 0};
    
    CGFloat latStr = locationCoordinate2D.latitude;
    CGFloat longStr = locationCoordinate2D.longitude;
    
    if (latStr != 0 && longStr != 0)
    {
        pt = (CLLocationCoordinate2D){latStr, longStr};
    }
    
    BMKReverseGeoCodeOption *reverseGeocodeSearchOption = [[BMKReverseGeoCodeOption alloc]init];
    reverseGeocodeSearchOption.reverseGeoPoint = pt;
    BOOL flag = [_geocodesearch reverseGeoCode:reverseGeocodeSearchOption];
    if(flag)
    {
        NSLog(@"反geo检索发送成功");
        [self stopLocation];
    }
    else
    {
        NSLog(@"反geo检索发送失败");
    }
}

- (void)onGetReverseGeoCodeResult:(BMKGeoCodeSearch *)searcher result:(BMKReverseGeoCodeResult *)result errorCode:(BMKSearchErrorCode)error
{
    NSArray* array = [NSArray arrayWithArray:_mapView.annotations];
    [_mapView removeAnnotations:array];
    
    if (error == 0) {
        //        BMKPointAnnotation* item = [[BMKPointAnnotation alloc]init];
        //        item.coordinate = result.location;
        //        item.title = result.address;
        //        [_mapView addAnnotation:item];
        
        _mapView.centerCoordinate = result.location;
        
        NSString *titleStr;
        NSString *showmeg;
        titleStr = @"反向地理编码！";
        
        for (NSInteger i = 0; i < result.poiList.count; i ++)
        {
            BMKPoiInfo *pointInfo = result.poiList[i];
            showmeg = [NSString stringWithFormat:@"您目前所在位置附近建筑物：name：%@\n address：%@", pointInfo.name, pointInfo.address];
            
            BAKit_WeakSelf
            [GCDQueue executeInMainQueue:^{
                BAKit_StrongSelf
                self.searchTextField.text = ((BMKPoiInfo *)result.poiList[0]).name;
            } afterDelaySecs:0.2f];
            
            NSLog(showmeg);
        }
        
        self.myCurrent_addressDetail = result.addressDetail;
    }
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
    [self.view endEditing:YES];
    NSLog(@"map view: click blank");
}

- (void)mapview:(BMKMapView *)mapView onDoubleClick:(CLLocationCoordinate2D)coordinate
{
    NSLog(@"map view: double click");
}

#pragma mark 根据anntation生成对应的View
- (BMKAnnotationView *)mapView:(BMKMapView *)mapView viewForAnnotation:(id <BMKAnnotation>)annotation
{
    // 生成重用标示identifier
    NSString *AnnotationViewID = @"yunlianWifi";
    
    // 检查是否有重用的缓存
    BMKAnnotationView* annotationView = [mapView dequeueReusableAnnotationViewWithIdentifier:AnnotationViewID];
    
    // 缓存没有命中，自己构造一个，一般首次添加annotation代码会运行到此处
    if (annotationView == nil) {
        annotationView = [[BMKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:AnnotationViewID];
        ((BMKPinAnnotationView*)annotationView).pinColor = BMKPinAnnotationColorRed;
        // 设置重天上掉下的效果(annotation)
        ((BMKPinAnnotationView*)annotationView).animatesDrop = YES;
    }
    
    // 设置位置
    annotationView.centerOffset = CGPointMake(0, -(annotationView.frame.size.height * 0.5));
    annotationView.annotation = annotation;
    // 单击弹出泡泡，弹出泡泡前提annotation必须实现title属性
    annotationView.canShowCallout = YES;
    // 设置是否可以拖拽
    annotationView.draggable = NO;
    annotationView.image = BAKit_ImageName(@"client");
    
    return annotationView;
}

// 当点击annotation view弹出的泡泡时，调用此接口
- (void)mapView:(BMKMapView *)mapView annotationViewForBubble:(BMKAnnotationView *)view;
{
    NSLog(@"paopaoclick");
    
    //    NSString *msg = [NSString stringWithFormat:@"你点击了：%@", view];
    //
    //    BAKit_ShowAlertWithMsg_ios8(msg);
}

- (void)mapView:(BMKMapView *)mapView didSelectAnnotationView:(BMKAnnotationView *)view
{
    [mapView bringSubviewToFront:view];
    [mapView setNeedsDisplay];
    
    NSString *msg = [NSString stringWithFormat:@"点击了: %@", view.annotation.title];
    BAKit_ShowAlertWithMsg_ios8(msg);
}

- (void)mapView:(BMKMapView *)mapView didAddAnnotationViews:(NSArray *)views
{
    NSLog(@"didAddAnnotationViews");
}

#pragma mark implement BMKSearchDelegate
- (void)onGetPoiResult:(BMKPoiSearch *)searcher result:(BMKPoiResult*)result errorCode:(BMKSearchErrorCode)error
{
    // 清楚屏幕中所有的annotation
    NSArray* array = [NSArray arrayWithArray:_mapView.annotations];
    [_mapView removeAnnotations:array];
    
    if (error == BMK_SEARCH_NO_ERROR) {
        NSMutableArray *annotations = [NSMutableArray array];
        for (int i = 0; i < result.poiInfoList.count; i++) {
            BMKPoiInfo* poi = [result.poiInfoList objectAtIndex:i];
            BMKPointAnnotation* item = [[BMKPointAnnotation alloc]init];
            item.coordinate = poi.pt;
            item.title = poi.name;
            [annotations addObject:item];
        }
        [_mapView addAnnotations:annotations];
        [_mapView showAnnotations:annotations animated:YES];
    } else if (error == BMK_SEARCH_AMBIGUOUS_ROURE_ADDR){
        NSLog(@"起始点有歧义");
    } else {
        // 各种情况的判断。。。
    }
}

/**
 *在地图View将要启动定位时，会调用此函数
 */
- (void)willStartLocatingUser
{
//    [BAKit_HudManager ba_hudShowWithText:@"定位中..."];
    NSLog(@"start locate");
}

/**
 *用户方向更新后，会调用此函数
 *@param userLocation 新的用户位置
 */
- (void)didUpdateUserHeading:(BMKUserLocation *)userLocation
{
    [_mapView updateLocationData:userLocation];
    //    NSLog(@"heading is %@",userLocation.heading);
}

/**
 *用户位置更新后，会调用此函数
 *@param userLocation 新的用户位置
 */
- (void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation
{
    NSLog(@"定位成功！！！");
//    [BAKit_HudManager ba_hudHidden];
    //    YLTips_Text(@"定位成功!");
    NSLog(@"新的用户位置 didUpdateUserLocation lat %f,long %f", userLocation.location.coordinate.latitude,userLocation.location.coordinate.longitude);
    
    [_mapView updateLocationData:userLocation];
    
    [self moveToCoordinate:userLocation.location.coordinate];
    
    self.myCurrent_locationCoordinate2D = userLocation.location.coordinate;
    
    [self ba_ReverseGeocodeWithCLLocationCoordinate2D:self.myCurrent_locationCoordinate2D];
    
    /*! 添加标注 */
    //    [_mapView removeOverlays:_mapView.overlays];
    //    [self addPointAnnotation];
    
    /*! 在地图View停止定位后，会调用此函数 */
    //    [self stopLocation];
}

/**
 *在地图View停止定位后，会调用此函数
 */
- (void)didStopLocatingUser
{
    NSLog(@"stop locate");
}

/**
 *定位失败后，会调用此函数
 *@param error 错误号，参考CLError.h中定义的错误号
 */
- (void)didFailToLocateUserWithError:(NSError *)error
{
    NSLog(@"location error");
    BAKit_ShowAlertWithMsg_ios8(@"定位失败！");
}

/**
 *地图区域即将改变时会调用此接口
 *@param mapView 地图View
 *@param animated 是否动画
 */
- (void)mapView:(BMKMapView *)mapView regionWillChangeAnimated:(BOOL)animated
{
    [self.view endEditing:YES];
}

#pragma mark - 添加自定义的手势（若不自定义手势，不需要下面的代码）

//- (void)addCustomGestures
//{
//    /*
//     *注意：
//     *添加自定义手势时，必须设置UIGestureRecognizer的属性cancelsTouchesInView 和 delaysTouchesEnded 为NO,
//     *否则影响地图内部的手势处理
//     */
//    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleDoubleTap:)];
//    doubleTap.delegate = self;
//    doubleTap.numberOfTapsRequired = 2;
//    doubleTap.cancelsTouchesInView = NO;
//    doubleTap.delaysTouchesEnded = NO;
//
//    [self.view addGestureRecognizer:doubleTap];
//
//    /*
//     *注意：
//     *添加自定义手势时，必须设置UIGestureRecognizer的属性cancelsTouchesInView 和 delaysTouchesEnded 为NO,
//     *否则影响地图内部的手势处理
//     */
//    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
//    singleTap.delegate = self;
//    singleTap.cancelsTouchesInView = NO;
//    singleTap.delaysTouchesEnded = NO;
//    [singleTap requireGestureRecognizerToFail:doubleTap];
//    [self.view addGestureRecognizer:singleTap];
//}
//
//- (void)handleSingleTap:(UITapGestureRecognizer *)theSingleTap
//{
//    /*
//     *do something
//     */
//    NSLog(@"my handleSingleTap");
//}
//
//- (void)handleDoubleTap:(UITapGestureRecognizer *)theDoubleTap
//{
//    /*
//     *do something
//     */
//    NSLog(@"my handleDoubleTap");
//}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField == self.searchTextField)
    {
        self.searchKeyWord = textField.text;
        
        [self.view endEditing:YES];
        [self ba_mapPointNearbySearchLocationCoordinate2D:self.myCurrent_locationCoordinate2D searchKeyWord:self.searchKeyWord];
        return YES;
    }
    return NO;
}

#pragma mark - custom method
#pragma mark 开始定位
- (void)startLocation
{
    NSLog(@"进入普通定位态");
    
    [_locService startUserLocationService];
    //    _mapView.showsUserLocation = NO;//先关闭显示的定位图层
    //    _mapView.userTrackingMode = BMKUserTrackingModeFollow;
    //    _mapView.showsUserLocation = YES;
}

#pragma mark 停止定位
- (void)stopLocation
{
    //    [BAKit_HudManager ba_hudHidden];
    
    [_locService stopUserLocationService];
    //    _mapView.showsUserLocation = YES;
}

- (void)handleButtonAction:(UIButton *)sender
{
    if (sender.tag == 1)
    {
        if (self.myCurrent_locationCoordinate2D.latitude && self.myCurrent_locationCoordinate2D.longitude)
        {
            [self moveToCoordinate:self.myCurrent_locationCoordinate2D];
        }
        else
        {
            [self startLocation];
        }
    }
    else if (sender.tag == 2)
    {
        sender.selected = !sender.selected;
        NSString *isOpen = sender.selected ? @"打开" : @"关闭";
        NSString *msg = [NSString stringWithFormat:@"你 %@ 了语音识别", isOpen];
        BAKit_ShowAlertWithMsg_ios8(msg);
    }
}

#pragma mark 添加标注
//- (void)addPointAnnotation
//{
//    if (pointAnnotation == nil)
//    {
//        pointAnnotation = [[BMKPointAnnotation alloc]init];
//        CLLocationCoordinate2D coor;
//        //        if (_userModel.m_local2D.latitude)
//        //        {
//        coor.latitude  = 23.109845;
//        coor.longitude = 113.388490;
//        //        }
//
//        pointAnnotation.coordinate = coor;
//        pointAnnotation.title = @"test大头针";
//        pointAnnotation.subtitle = @"欢迎来到云联惠!";
//
//        /*! 注意：如果要批量添加大头针的话，要单独写一个继承自 BMKPointAnnotation 类的model 类，然后用 for 循环添加 model 给 pointAnnotation */
//        //        pointAnnotation.poiModel = model;
//        pointAnnotation.coordinate = coor;
//    }
//
//    [_mapView addAnnotation:pointAnnotation];
//}

- (void)moveToCoordinate:(CLLocationCoordinate2D)coordinate
{
    // 添加一个标记位
    BMKCoordinateRegion viewRegion = BMKCoordinateRegionMake(coordinate, BMKCoordinateSpanMake(0.001, 0.001));
    BMKCoordinateRegion adjustedRegion = [_mapView regionThatFits:viewRegion];
    [_mapView setRegion:adjustedRegion animated:YES];
    [_mapView setCenterCoordinate:coordinate animated:YES];
}

#pragma mark - setter / getter

- (BMKMapView *)mapView
{
    if (!_mapView)
    {
        _mapView = [[BMKMapView alloc] init];
        /*! 适配ios7 */
        if( ([[[UIDevice currentDevice] systemVersion] doubleValue] >= 7.0))
        {
            self.navigationController.navigationBar.translucent = NO;
        }
        
        _locService = [[BMKLocationService alloc]init];
        _geocodesearch = [[BMKGeoCodeSearch alloc]init];
        _poisearch = [[BMKPoiSearch alloc]init];
        
        //设置定位精确度，默认：kCLLocationAccuracyBest
        _locService.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
        //指定最小距离更新(米)，默认：kCLDistanceFilterNone
        //        _locService.distanceFilter = 10.0f;
        
        
        _mapView.showsUserLocation = YES;//显示定位图层
        _mapView.userTrackingMode = BMKUserTrackingModeFollow;
        /*! 设置地图缩放级别 */
        _mapView.zoomLevel = 18;
        _mapView.isSelectedAnnotationViewFront = YES;
        
        [self.view addSubview:self.mapView];
    }
    return _mapView;
}

- (UIButton *)locationButton
{
    if (!_locationButton)
    {
        _locationButton = [[UIButton alloc] ba_creatButtonWithFrame:CGRectZero title:@"ceshi" selTitle:nil titleColor:nil titleFont:nil image:BAKit_ImageBAMessageName(@"定位") selImage:nil padding:0 buttonPositionStyle:BAButtonLayoutTypeNormal viewRectCornerType:BAViewRectCornerTypeAllCorners viewCornerRadius:0 target:self selector:@selector(handleButtonAction:)];
        self.locationButton.tag = 1;
        
        [self.view addSubview:self.locationButton];
    }
    return _locationButton;
}

- (UIView *)searchView
{
    if (!_searchView)
    {
        _searchView = [[UIView alloc] init];
        self.searchView.backgroundColor = BAKit_Color_White;
        
        [self.view addSubview:self.searchView];
    }
    return _searchView;
}

- (UILabel *)searchLabel
{
    if (!_searchLabel)
    {
        _searchLabel = [UILabel new];
        self.searchLabel.text = @"当前位置:";
        self.searchLabel.font = BAKit_FontSystem_15;
        //        self.searchLabel.backgroundColor = BAKit_Color_Yellow;
        
        [self.searchView addSubview:self.searchLabel];
    }
    return _searchLabel;
}

- (UITextField *)searchTextField
{
    if (!_searchTextField)
    {
        _searchTextField = [UITextField new];
        self.searchTextField.font = BAKit_FontSystem_15;
        self.searchTextField.delegate = self;
        self.searchTextField.returnKeyType = UIReturnKeySearch;
        self.searchTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        
        //        self.searchTextField.backgroundColor = BAKit_Color_Green;
        
        [self.searchView addSubview:self.searchTextField];
    }
    return _searchTextField;
}

- (UIButton *)voiceButton
{
    if (!_voiceButton)
    {
        _voiceButton = [[UIButton alloc] ba_creatButtonWithFrame:CGRectZero title:@"ceshi" selTitle:nil titleColor:nil titleFont:nil image:BAKit_ImageBAMessageName(@"map_voice") selImage:BAKit_ImageBAMessageName(@"map_voice") padding:1 buttonPositionStyle:BAButtonLayoutTypeNormal viewRectCornerType:BAViewRectCornerTypeAllCorners viewCornerRadius:1 target:self selector:@selector(handleButtonAction:)];

        self.voiceButton.tag = 2;
        self.voiceButton.backgroundColor = BAKit_Color_Red;
        
        [self.searchView addSubview:self.voiceButton];
    }
    return _voiceButton;
}


- (void)base_viewDidDisappear
{
    //    if (_mapView)
    //    {
    //        _mapView = nil;
    //    }
    //    if (_geocodesearch != nil)
    //    {
    //        _geocodesearch = nil;
    //    }
    //    if (_poisearch != nil)
    //    {
    //        _poisearch = nil;
    //    }
}

- (void)dealloc
{
    [self base_viewDidDisappear];
}

@end
