//
//  ViewController.m
//  LinkedIn
//
//  Created by trier on 8/1/2016.
//  Copyright © 2016 Tony. All rights reserved.
//

#import "ViewController.h"

#define SCREEN_SIZE_WIDTH  [[UIScreen mainScreen]bounds].size.width
#define SCREEN_SIZE_HEIGHT [[UIScreen mainScreen]bounds].size.height
#define IMAGENAMED(imageName)  [UIImage imageNamed:imageName]

@implementation ViewController
{
    UIImageView *imageHead;
}
@synthesize mScrollView;

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *mImages = @[@"guid_1", @"guid_2", @"guid_3", @"guid_4"];
    mScrollView.pagingEnabled = YES;
    mScrollView.contentSize = CGSizeMake(SCREEN_SIZE_WIDTH * [mImages count], SCREEN_SIZE_HEIGHT);
    
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat width = SCREEN_SIZE_WIDTH;
    CGFloat height = SCREEN_SIZE_HEIGHT;
    
    for (NSString *imageName in mImages) {
        
        UIView *view = [UIView new];
        view.frame = CGRectMake(x, y, width, height);
        
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.frame = CGRectMake(0, 0, view.frame.size.width, view.frame.size.height);
        imageView.image = IMAGENAMED(imageName);
        [view addSubview:imageView];
        
        CGFloat btnLeftX = 2;
        CGFloat btnRightX = SCREEN_SIZE_WIDTH / 2 + 2;
        CGFloat btnY = SCREEN_SIZE_HEIGHT - 40 - 60;
        CGFloat btnWidth = SCREEN_SIZE_WIDTH / 2 - 4;
        CGFloat btnHeight = 52;
        
        UIButton *leftButton = [[UIButton alloc] initWithFrame:CGRectMake(btnLeftX, btnY, btnWidth, btnHeight)];
        [leftButton setTitle:@"立即体验" forState:UIControlStateNormal];
        [leftButton.titleLabel setFont: [UIFont systemFontOfSize:22.0f]];
        [leftButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        leftButton.layer.borderColor = [UIColor whiteColor].CGColor;
        leftButton.layer.borderWidth = 1;
        leftButton.layer.masksToBounds = YES;
        leftButton.layer.cornerRadius = 3;
        leftButton.backgroundColor = [UIColor purpleColor];
        [leftButton addTarget:self action:@selector(registerAction) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:leftButton];
        
        UIButton *rightButton = [[UIButton alloc] initWithFrame:CGRectMake(btnRightX, btnY, btnWidth, btnHeight)];
        [rightButton setTitle:@"登录" forState:UIControlStateNormal];
        [rightButton.titleLabel setFont: [UIFont systemFontOfSize:22.0f]];
        [rightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        rightButton.layer.borderColor = [UIColor whiteColor].CGColor;
        rightButton.layer.borderWidth = 1;
        rightButton.layer.masksToBounds = YES;
        rightButton.layer.cornerRadius = 3;
        rightButton.backgroundColor = [UIColor purpleColor];
        [rightButton addTarget:self action:@selector(loginAction) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:rightButton];
        
        [mScrollView addSubview:view];
        x += SCREEN_SIZE_WIDTH;
    }
    
    width = 132;
    height = 132;
    x = SCREEN_SIZE_WIDTH + SCREEN_SIZE_WIDTH / 2 - width / 2;
    y = 150;
    imageHead = [[UIImageView alloc] init];
    imageHead.frame = CGRectMake(x, y, width, height);
    imageHead.image = IMAGENAMED(@"image_head");
    imageHead.layer.borderColor = [UIColor whiteColor].CGColor;
    imageHead.layer.borderWidth = 2.5;
    imageHead.layer.masksToBounds = YES;
    imageHead.layer.cornerRadius = imageHead.frame.size.height / 2;
    [mScrollView addSubview:imageHead];

}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    
    if (scrollView.contentOffset.x >= SCREEN_SIZE_WIDTH && scrollView.contentOffset.x < SCREEN_SIZE_WIDTH * 2) {
        CGRect frame = imageHead.frame;
        frame.origin.x = scrollView.contentOffset.x + SCREEN_SIZE_WIDTH / 2 - 132 / 2 + (-scrollView.contentOffset.x + SCREEN_SIZE_WIDTH) / 4.4;
        frame.origin.y = 150 + (-scrollView.contentOffset.x + SCREEN_SIZE_WIDTH) / 80;
        NSLog(@"%f__%f", frame.origin.x, frame.origin.y);
        imageHead.frame = frame;
        [UIView animateWithDuration:0.01 animations:^{
            CGRect frame = imageHead.frame;
            frame.size.width = (-scrollView.contentOffset.x + SCREEN_SIZE_WIDTH) / 4 + 132;
            frame.size.height = frame.size.width;
            imageHead.frame = frame;
            imageHead.layer.cornerRadius = imageHead.frame.size.height / 2;
        }];
    } if (scrollView.contentOffset.x >= SCREEN_SIZE_WIDTH * 2) {
        CGRect frame = imageHead.frame;
        frame.origin.x = SCREEN_SIZE_WIDTH * 2 + SCREEN_SIZE_WIDTH / 2 - 132 / 2 - SCREEN_SIZE_WIDTH / 4.4 + (scrollView.contentOffset.x - SCREEN_SIZE_WIDTH * 2) / 0.98;
        frame.origin.y = 150 - SCREEN_SIZE_WIDTH / 80 + (scrollView.contentOffset.x - SCREEN_SIZE_WIDTH * 2) / 15;
        imageHead.frame = frame;
        [UIView animateWithDuration:0.01 animations:^{
            CGRect frame = imageHead.frame;
            frame.size.width =  -SCREEN_SIZE_WIDTH / 4 + 132 + (scrollView.contentOffset.x - SCREEN_SIZE_WIDTH * 2) / 25;
            frame.size.height = frame.size.width;
            imageHead.frame = frame;
            imageHead.layer.cornerRadius = imageHead.frame.size.height / 2;
        }];
    }

}

- (void)registerAction {
    [self performSegueWithIdentifier:@"Register" sender:nil];
}

- (void)loginAction {
 [self performSegueWithIdentifier:@"Login" sender:nil];
}



@end
