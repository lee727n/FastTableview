//
//  headcell.m
//  HeartRate
//
//  Created by liu zixuan on 2019/5/29.
//  Copyright © 2019 王灵博. All rights reserved.
//

#import "headcell.h"
#import "UIColor+JKColor.h"
#import "UIView+Extension.h"

@implementation headcell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self.headview addCornerRadius:56/2];
    
    [self.headview setBorderWidth:1 borderColor:[UIColor greenColor]];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
