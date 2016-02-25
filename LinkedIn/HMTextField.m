



//
//  HMTextField.m
//  LinkedIn
//
//  Created by trier on 8/1/2016.
//  Copyright © 2016 Tony. All rights reserved.
//

#import "HMTextField.h"

@implementation HMTextField
{
    UITextField *assistTextField;
}
@synthesize mTextField;

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setUp];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setUp];
    }
    return self;
}

- (void)setPlaceHolder:(NSString *)placeHolder {
    
    assistTextField.placeholder = placeHolder;
}

- (void)setUp {
    mTextField = [UITextField new];
    mTextField.frame = CGRectMake(0, 8, self.frame.size.width, self.frame.size.height);
    mTextField.delegate = self;
    mTextField.hidden = YES;
    [self addSubview:mTextField];
    
    assistTextField = [UITextField new];
    assistTextField.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    assistTextField.font = mTextField.font;
    assistTextField.placeholder = mTextField.placeholder;
    assistTextField.hidden = NO;
    assistTextField.delegate = self;
    [self addSubview:assistTextField];
}

- (void)becomeFirstResponder {
    [assistTextField becomeFirstResponder];
}

- (void)resignFirstResponder {
    [assistTextField resignFirstResponder];
    [mTextField resignFirstResponder];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    if (textField.text.length == 0) {
        mTextField.hidden = NO;
        [mTextField becomeFirstResponder];
        [UIView animateWithDuration:0.6 animations:^{
            assistTextField.transform = CGAffineTransformScale(assistTextField.transform, 0.5, 0.5);
            assistTextField.center = CGPointMake(assistTextField.center.x / 2, assistTextField.center.y / 2);
        } ];
        
    }else if (range.location == 0 && [string isEqualToString:@""]){
        [assistTextField becomeFirstResponder];
        mTextField.hidden = YES;
        mTextField.text = @"";
        [UIView animateWithDuration:0.6 animations:^{
            assistTextField.transform = CGAffineTransformScale(assistTextField.transform, 2, 2);
            assistTextField.center = CGPointMake(assistTextField.center.x * 2, assistTextField.center.y * 2);
        } ];
        
    }
    return YES;
}

@end
