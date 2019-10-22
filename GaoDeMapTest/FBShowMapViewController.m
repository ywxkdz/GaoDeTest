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
#import <Masonry/Masonry.h>
#import <AMapSearchKit/AMapSearchKit.h>


@interface FBShowMapViewController ()<MAMapViewDelegate,AMapSearchDelegate>
    
    @property(nonatomic,strong) AMapSearchAPI * search;
    
    @end

@implementation FBShowMapViewController
    
- (void)viewDidLoad {
    [super viewDidLoad];
    
    ///初始化地图
    [[AMapServices sharedServices] setEnableHTTPS:YES];
    MAMapView *_mapView = [[MAMapView alloc] initWithFrame:self.view.frame];
    
    
    
    
    
    ///把地图添加至view
    [self.view addSubview:_mapView];
    
    
    [_mapView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.offset(0);
        make.leading.trailing.offset(0);
        make.bottom.offset(0);
    }];
    
    _mapView.delegate = self;
    
    ///如果您需要进入地图就显示定位小蓝点，则需要下面两行代码
    _mapView.showsUserLocation = YES;
    _mapView.userTrackingMode = MAUserTrackingModeFollow;
    
    _mapView.showsCompass  = YES; // 设置成NO表示关闭指南针；YES表示显示指南针
    _mapView.compassOrigin = CGPointMake(_mapView.compassOrigin.x, 100); //设置指南针位置
    
    _mapView.showsScale    = YES;  //设置成NO表示不显示比例尺；YES表示显示比例尺
    _mapView.scaleOrigin   = CGPointMake(0, 240);  //设置比例尺位置
    
    
    
    
    self.search = [[AMapSearchAPI alloc] init];
    self.search.delegate = self;
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [self searchIpo ];
    });
}
    
    
    -(void) searchIpo{
        
        
        AMapPOIKeywordsSearchRequest *request = [[AMapPOIKeywordsSearchRequest alloc] init];
        
        request.keywords            = @"北京大学";
        request.city                = @"北京";
        request.types               = @"加油站";
        request.requireExtension    = YES;
        /*  搜索SDK 3.2.0 中新增加的功能，只搜索本城市的POI。*/
        request.cityLimit           = YES;
        request.requireSubPOIs      = YES;
        
        
        
        /*  搜索SDK 3.2.0 中新增加的功能，只搜索本城市的POI。*/
        
        [self.search AMapPOIKeywordsSearch:request];
        
    }
    
    -(void)mapViewRequireLocationAuth:(CLLocationManager *)locationManager{
        
        [locationManager requestAlwaysAuthorization];
        
    }
    
    - (void)onPOISearchDone:(AMapPOISearchBaseRequest *)request response:(AMapPOISearchResponse *)response{
        
        
        if (response.pois.count == 0)
        {
            return;
        }
        
        //解析response获取POI信息，具体解析见 Demo
    }
    
    
    @end
