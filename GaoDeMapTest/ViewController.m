//
//  ViewController.m
//  GaoDeMapTest
//
//  Created by waw on 2019/5/17.
//  Copyright © 2019 FB. All rights reserved.
//

#import "ViewController.h"
#import "FBShowMapViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
    
- (IBAction)showMap:(UIButton *)sender {
    
    [self.navigationController pushViewController:[FBShowMapViewController new] animated:YES];
    
}
    


@end
