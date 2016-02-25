//
//  HMTextField.h
//  LinkedIn
//
//  Created by trier on 8/1/2016.
//  Copyright © 2016 Tony. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE

@interface HMTextField : UIView<UITextFieldDelegate>

@property (nonatomic) IBInspectable NSString *placeHolder;

@property(nonatomic, strong) UITextField *mTextField;

- (void)becomeFirstResponder;
- (void)resignFirstResponder;

@end
