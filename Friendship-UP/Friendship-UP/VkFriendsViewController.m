//
//  VkFriendsViewController.m
//  Friendship-UP
//
//  Created by ed8009 on 01.09.16.
//  Copyright © 2016 ed8009. All rights reserved.
//

#import "VkFriendsViewController.h"
#import "UIImage+ImageWithColor.h"
#import "FriendsGalleryCell.h"
#import "FriendDataManager.h"
#import <MBProgressHUD/MBProgressHUD.h>
#import "UserProfileViewController.h"

static NSString *cellIdentifier = @"FriendsGallery";
static NSString *const kItem = @"items";

@interface VkFriendsViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) IBOutlet UITableView *friendTableView;

@property (strong, nonatomic) NSDictionary *friends;

@property (nonatomic) CGFloat featureHeight;
@property (nonatomic) CGFloat collapsedHeight;
@property (assign, nonatomic) CGFloat RPSlidingCellFeatureHeight;
@property (assign, nonatomic) CGFloat RPSlidingCellCollapsedHeight;

@end

@implementation VkFriendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self getUserFriends];
    
    self.friendTableView.estimatedRowHeight = 400.0;
    self.friendTableView.rowHeight = UITableViewAutomaticDimension;
    
    // Do any additional setup after loading the view.
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(applicationBecomeActive)
                                                 name:UIApplicationWillEnterForegroundNotification
                                               object:nil];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    UIColor *navBarColor = [UIColor purpleColor];
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage resizeableImageWithColor:navBarColor] forBarMetrics:UIBarMetricsDefault];
//    self.navigationController.navigationBar.hidden = NO;
//    self.navigationController.navigationBar.shadowImage = [UIImage new];
}

- (void)applicationBecomeActive {
    NSLog(@"applicationBecomeActive");
    [self.friendTableView reloadData];
}

- (void)getUserFriends {
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [[FriendDataManager sharedInstance] getUserFriends:^(NSDictionary *result, BOOL successed, NSError *error) {
        if (successed) {
            self.friends = result;
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            [self.friendTableView reloadData];
        }
        else {
            NSLog(@"VK error: %@", error);
        }
    }];
}

#pragma mark - UITableViewDataSource's methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.friends[@"count"] integerValue];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell;
    FriendsGalleryCell *friendCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    [friendCell customizeCell:self.friends[kItem][indexPath.row]];
    cell = friendCell;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    FriendsGalleryCell *friendCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];

    UIStoryboard *UserProfileStoryboard = [UIStoryboard storyboardWithName:@"UserProfile" bundle:[NSBundle mainBundle]];
    UserProfileViewController *userProfileViewController = [UserProfileStoryboard instantiateViewControllerWithIdentifier:@"UserProfileViewController"];
    
    userProfileViewController.userObject = self.friends[kItem][indexPath.row];
    [self.navigationController pushViewController:userProfileViewController animated:YES];
}

#pragma mark Action

- (IBAction)logout:(id)sender {
    [VKSdk forceLogout];
}

@end
