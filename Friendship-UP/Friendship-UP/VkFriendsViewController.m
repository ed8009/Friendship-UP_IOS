//
//  VkFriendsViewController.m
//  Friendship-UP
//
//  Created by ed8009 on 01.09.16.
//  Copyright © 2016 ed8009. All rights reserved.
//

#import "VkFriendsViewController.h"
#import "UIImage+ImageWithColor.h"

@interface VkFriendsViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation VkFriendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    UIColor *navBarColor = [UIColor redColor];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage resizeableImageWithColor:navBarColor] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.hidden = NO;
    self.navigationController.navigationBar.shadowImage = [UIImage new];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)logout:(id)sender {
    [VKSdk forceLogout];    
}


@end
