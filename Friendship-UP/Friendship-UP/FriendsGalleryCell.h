//
//  FriendsGalleryCollectionViewCell.h
//  Friendship-UP
//
//  Created by Distillery Mac on 06.09.16.
//  Copyright © 2016 ed8009. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FriendsGalleryCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *nameFriend;
@property (weak, nonatomic) IBOutlet UILabel *countCommonFriends;
@property (weak, nonatomic) IBOutlet UILabel *countComments;
@property (weak, nonatomic) IBOutlet UILabel *countLike;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;

- (void)customizeCell:(NSDictionary *)friendObject;

@end
