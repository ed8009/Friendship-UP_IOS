//
//  UserProfileViewController.m
//  Friendship-UP
//
//  Created by Distillery Mac on 17.09.16.
//  Copyright © 2016 ed8009. All rights reserved.
//

#import "UserProfileViewController.h"
#import "PersonalInformationCell.h"
#import "UserPhotoCell.h"
#import "UserFriendsCell.h"

static NSString *personalInfoCellIdentifier = @"profileCell";
static NSString *userPhotoCellIdentifier = @"photoCell";
static NSString *userFriendsCellIdentifier = @"friendsCell";

static const CGFloat DefaultCellHeight = 44.0;

typedef NS_ENUM(NSInteger, SectionType) {
    SectionTypePersonalInfo = 0,
    SectionTypePhoto,
    SectionTypeFriends
};

static const NSInteger PersonalSectionTypes[3] = {SectionTypePersonalInfo, SectionTypePhoto, SectionTypeFriends};

@interface UserProfileViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) IBOutlet UITableView *dataTableView;

@end

@implementation UserProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.dataTableView.estimatedRowHeight = 250.0;
    self.dataTableView.rowHeight = UITableViewAutomaticDimension;
    
    self.title = @"personal info";
}

#pragma mark - UITableViewDataSource's methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    SectionType sectionType = PersonalSectionTypes[section];
    NSInteger result = 0;
    switch (sectionType) {
        case SectionTypePersonalInfo:
            result = 1;
            break;
            
        case SectionTypePhoto:
            result = 1;
            break;
            
        case SectionTypeFriends:
            result = 1;
            break;
            
        default:
            break;
    }
    return result;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell;
    if (indexPath.row == 0) {
        PersonalInformationCell *personalInfoCell = [tableView dequeueReusableCellWithIdentifier:personalInfoCellIdentifier forIndexPath:indexPath];
        [personalInfoCell customizeCell:self.userObject];
        cell = personalInfoCell;
        
    }
    else if (indexPath.row == 1) {
        UserPhotoCell *userPhotoCell = [tableView dequeueReusableCellWithIdentifier:userPhotoCellIdentifier forIndexPath:indexPath];
        cell = userPhotoCell;
    }
    else {
        UserFriendsCell *userFriendsCell = [tableView dequeueReusableCellWithIdentifier:userFriendsCellIdentifier forIndexPath:indexPath];
        cell = userFriendsCell;
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat result = DefaultCellHeight;
    SectionType sectionType = PersonalSectionTypes[indexPath.section];
    if (sectionType == SectionTypePersonalInfo) {
        result = 250;
    }
    else if (sectionType == SectionTypePhoto) {
        result = 100;
    }
    else if (sectionType == SectionTypeFriends) {
        result = 100;
    }
    return result;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
   
}


@end
