//
//  headcell.h
//  HeartRate
//
//  Created by liu zixuan on 2019/5/29.
//  Copyright © 2019 王灵博. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface headcell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *headview;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;

@end

NS_ASSUME_NONNULL_END
