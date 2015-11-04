//
//  LCGraffitiImageView.h
//  LCGraffitiImageView
//
//  Created by lazy on 15/11/4.
//  Copyright © 2015年 lazy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LCBezierView.h"

typedef NS_ENUM(NSInteger, LCGraffitiStrokeLevel){
    LCGraffitiStrokeLevelVeryThin = 1,
    LCGraffitiStrokeLevelThin = 3,
    LCGraffitiStrokeLevelMedium = 5,
    LCGraffitiStrokeLevelFat = 8,
    LCGraffitiStrokeLevelVeryFat = 15
};

@interface LCGraffitiView : UIView

- (instancetype)initWithImage:(UIImage *)image;
- (void)reset;

@property (nonatomic, assign, getter=isGraffitiEnabled) BOOL graffitiEnabled;

@property (nonatomic, strong) UIColor *strokeColor;

@property (nonatomic, assign) LCGraffitiStrokeLevel strokeLevel;

@end
