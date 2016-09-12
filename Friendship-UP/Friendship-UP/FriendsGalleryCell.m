//
//  FriendsGalleryCollectionViewCell.m
//  Friendship-UP
//
//  Created by Distillery Mac on 06.09.16.
//  Copyright © 2016 ed8009. All rights reserved.
//

#import "FriendsGalleryCell.h"
#import "UserDataManager.h"
#import "PhotosDataManager.h"
#import <SDWebImage/UIImageView+WebCache.h>

static NSString *const kJsonFirstName   = @"first_name";
static NSString *const kJsonLastName   = @"last_name";
static NSString *const kJsonCommonCount   = @"common_count";
static NSString *const kJsonPhotoMaxOrig   = @"photo_max_orig";

@interface FriendsGalleryCell ()

@end

@implementation FriendsGalleryCell

- (void)customizeCell:(NSDictionary *)friendObject {
    self.nameFriend.text = [NSString stringWithFormat:@"%@ %@", friendObject[kJsonFirstName], friendObject[kJsonLastName]];
    if (friendObject[kJsonCommonCount]) {
        self.countCommonFriends.text = [friendObject[kJsonCommonCount] stringValue];
    }
    if (friendObject[kJsonPhotoMaxOrig]) {
        [self.backgroundImageView sd_setImageWithURL:[NSURL URLWithString:friendObject[kJsonPhotoMaxOrig]]];
    }
    self.countLike.text = @"0";
    self.countComments.text = @"0";
}


- (void)prepareForReuse {
    [super prepareForReuse];
    self.backgroundImageView.image = nil;
    self.nameFriend.text = nil;
    self.countComments.text = nil;
    self.countLike.text = nil;
    self.countCommonFriends.text = nil;
}

@end
