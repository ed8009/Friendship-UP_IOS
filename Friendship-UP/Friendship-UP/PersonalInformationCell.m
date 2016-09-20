//
//  PersonalInformationTableViewCell.m
//  Friendship-UP
//
//  Created by Distillery Mac on 17.09.16.
//  Copyright © 2016 ed8009. All rights reserved.
//

#import "PersonalInformationCell.h"
#import <SDWebImage/UIImageView+WebCache.h>

static NSString *const kJsonFirstName   = @"first_name";
static NSString *const kJsonLastName   = @"last_name";
static NSString *const kJsonPhotoMaxOrig   = @"photo_max_orig";

@implementation PersonalInformationCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)customizeCell:(NSDictionary *)userObject {
    self.userName.text = [NSString stringWithFormat:@"%@ %@", userObject[kJsonFirstName], userObject[kJsonLastName]];
    self.userCity.text = @"city";
    self.userStatus.text = @"text";
    
    if (userObject[kJsonPhotoMaxOrig]) {
        [self.backgroundImage sd_setImageWithURL:[NSURL URLWithString:userObject[kJsonPhotoMaxOrig]] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            self.userAvatar.image = image;
        }];
    }
}
@end
