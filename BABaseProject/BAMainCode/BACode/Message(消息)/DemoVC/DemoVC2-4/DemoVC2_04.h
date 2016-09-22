//
//  DemoVC2_04.h
//  BABaseProject
//
//  Created by boai on 2016/9/21.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "BABaseViewController.h"
#import <BaiduMapAPI_Map/BMKMapComponent.h>

@interface DemoVC2_04 : BABaseViewController <BMKMapViewDelegate>
{
    __weak IBOutlet BMKMapView *_mapView;

}

@end
