//
//  LCBezierView.m
//  LCGraffitiImageView
//
//  Created by lazy on 15/11/4.
//  Copyright © 2015年 lazy. All rights reserved.
//

#import "LCBezierView.h"

@implementation LCBezierView

- (instancetype)init {
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    UIColor *fillColor = self.strokeColor;
    [fillColor setFill];
    UIColor *strokeColor = self.strokeColor;
    [strokeColor setStroke];
    for (UIBezierPath *path in self.paths) {
        [path stroke];
    }
}


@end
