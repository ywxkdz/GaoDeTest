//
//  FBShowMapViewController.m
//  GaoDeMapTest
//
//  Created by waw on 2019/5/17.
//  Copyright © 2019 FB. All rights reserved.
//

#import "FBShowMapViewController.h"

#import <MAMapKit/MAMapKit.h>
#import <AMapFoundationKit/AMapFoundationKit.h>

@interface FBShowMapViewController ()<MAMapViewDelegate>
    
    @end

@implementation FBShowMapViewController
    
- (void)viewDidLoad {
    [super viewDidLoad];
    
    ///初始化地图
    [[AMapServices sharedServices] setEnableHTTPS:YES];
    MAMapView *_mapView = [[MAMapView alloc] initWithFrame:self.view.bounds];
    ///把地图添加至view
    [self.view addSubview:_mapView];
    
    _mapView.delegate = self;
    
    
    ///如果您需要进入地图就显示定位小蓝点，则需要下面两行代码
    _mapView.showsUserLocation = YES;
    _mapView.userTrackingMode = MAUserTrackingModeFollow;
}
    
    
    -(void)mapViewRequireLocationAuth:(CLLocationManager *)locationManager{
        
        [locationManager requestAlwaysAuthorization];
        
    }
    
    @end
