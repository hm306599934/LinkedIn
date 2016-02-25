//
//  RegisterVC.m
//  LinkedIn
//
//  Created by trier on 8/1/2016.
//  Copyright © 2016 Tony. All rights reserved.
//

#import "RegisterVC.h"
#import "HMTextField.h"

@implementation RegisterVC

@synthesize mNameText,mMailText,mPasswordText;

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


- (void)viewDidAppear:(BOOL)animated {
    [mNameText becomeFirstResponder];
}

- (IBAction)dismiss:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
