//
//  DemoVC2_04.h
//  BABaseProject
//
//  Created by boai on 2016/9/21.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "BABaseViewController.h"
#import <BaiduMapAPI_Map/BMKMapComponent.h>
#import <BaiduMapAPI_Location/BMKLocationComponent.h>

@interface DemoVC2_04 : BABaseViewController <BMKMapViewDelegate, BMKLocationServiceDelegate>
{
    __weak IBOutlet BMKMapView *_mapView;
    __weak IBOutlet UIButton *startBtn;
    __weak IBOutlet UIButton *stopBtn;
    __weak IBOutlet UIButton *followingBtn;
    __weak IBOutlet UIButton *followHeadBtn;
    
    BMKLocationService       *_locService;

}

-(IBAction)startLocation:(id)sender;
-(IBAction)stopLocation:(id)sender;
-(IBAction)startFollowing:(id)sender;
-(IBAction)startFollowHeading:(id)sender;

@end
