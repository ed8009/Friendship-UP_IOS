//
//  PersonalInformationTableViewCell.h
//  Friendship-UP
//
//  Created by Distillery Mac on 17.09.16.
//  Copyright © 2016 ed8009. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PersonalInformationCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;
@property (weak, nonatomic) IBOutlet UIImageView *userAvatar;
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *userStatus;
@property (weak, nonatomic) IBOutlet UILabel *userCity;

- (void)customizeCell:(NSDictionary *)userObject;

@end
