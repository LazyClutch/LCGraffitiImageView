//
//  ViewController.m
//  LCGraffitiImageView
//
//  Created by lazy on 15/11/4.
//  Copyright © 2015年 lazy. All rights reserved.
//

#import "ViewController.h"
#import "LCGraffitiView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    LCGraffitiView *imageView = [[LCGraffitiView alloc] initWithImage:[UIImage imageNamed:@"zhejiang.jpg"]];
    imageView.strokeColor = [UIColor yellowColor];
    imageView.strokeLevel = LCGraffitiStrokeLevelVeryThin;
    imageView.userInteractionEnabled = YES;
    [imageView setFrame:CGRectMake(0, 0, 300, 300)];
    [self.view addSubview:imageView];
    imageView.center = self.view.center;
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
