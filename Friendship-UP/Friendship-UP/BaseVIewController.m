//
//  BaseVIewController.m
//  Friendship-UP
//
//  Created by Distillery Mac on 02.09.16.
//  Copyright © 2016 ed8009. All rights reserved.
//

#import "BaseVIewController.h"
#import "UIImage+ImageWithColor.h"

@interface BaseVIewController ()

@end

@implementation BaseVIewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
       UIColor *navBarColor = [UIColor colorWithRed:232.0/255.0 green:121.0/255.0 blue:117.0/255.0 alpha:1.0];
        [self.navigationController.navigationBar setBackgroundImage:[UIImage resizeableImageWithColor:navBarColor] forBarMetrics:UIBarMetricsDefault];
        self.navigationController.navigationBar.hidden = NO;
        self.navigationController.navigationBar.shadowImage = [UIImage new];
}

@end
