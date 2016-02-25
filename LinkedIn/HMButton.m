//
//  HMButton.m
//  LinkedIn
//
//  Created by trier on 8/1/2016.
//  Copyright © 2016 Tony. All rights reserved.
//

#import "HMButton.h"

@implementation HMButton

- (void)setHasBorder:(BOOL)hasBorder{
    if (hasBorder) {
        self.layer.borderColor = [UIColor whiteColor].CGColor;
        self.layer.borderWidth = 1;
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 3;
    }else{
        self.layer.borderWidth = 0;
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 0;
    }
}

@end
