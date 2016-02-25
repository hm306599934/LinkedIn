//
//  RegisterVC.h
//  LinkedIn
//
//  Created by trier on 8/1/2016.
//  Copyright © 2016 Tony. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HMTextField;

@interface RegisterVC : UIViewController<UITextFieldDelegate>

- (IBAction)dismiss:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet HMTextField *mNameText;
@property (weak, nonatomic) IBOutlet HMTextField *mMailText;
@property (weak, nonatomic) IBOutlet HMTextField *mPasswordText;

@end
