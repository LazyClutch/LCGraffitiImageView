//
//  LCGraffitiImageView.m
//  LCGraffitiImageView
//
//  Created by lazy on 15/11/4.
//  Copyright © 2015年 lazy. All rights reserved.
//

#import "LCGraffitiView.h"

@interface LCGraffitiView ()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) LCBezierView *bezierView;

@property (nonatomic, copy) NSMutableArray *paths;

@property (nonatomic, strong) UIPanGestureRecognizer *pan;

@end

@implementation LCGraffitiView

- (instancetype)initWithImage:(UIImage *)image {
    self = [super init];
    if (self) {
        [self setupViewsAndConstraints];
        self.strokeColor = [UIColor blackColor];
        self.strokeLevel = LCGraffitiStrokeLevelMedium;
        self.imageView.image = image;
    }
    return self;
}

#pragma mark - api -

- (void)reset {
    [self.bezierView.layer.sublayers makeObjectsPerformSelector:@selector(removeFromSuperlayer)];
}

#pragma mark - event handler -

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint startPoint = [touch locationInView:self];
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path setLineWidth:(CGFloat)self.strokeLevel];
    [path setLineJoinStyle:kCGLineJoinRound];
    [path setLineCapStyle:kCGLineCapRound];
    [path moveToPoint:startPoint];
    
    [self.paths addObject:path];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    UIBezierPath *path = [self.paths lastObject];
    [path addLineToPoint:point];
    self.bezierView.paths = self.paths;
    [self.bezierView setNeedsDisplay];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [self touchesMoved:touches withEvent:event];

}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    [self touchesEnded:touches withEvent:event];
}

#pragma mark - private -

- (void)setupViewsAndConstraints {
    
    [self addSubview:self.imageView];
    [self addSubview:self.bezierView];
    self.bezierView.strokeColor = self.strokeColor;

    NSDictionary *views = @{
                            @"imageView":self.imageView,
                            @"bezierView":self.bezierView
                            };
    
    
    NSArray *imageHorizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[imageView]-0-|" options:0 metrics:nil views:views];
    NSArray *imageVerticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[imageView]-0-|" options:0 metrics:nil views:views];
    NSArray *bezierHorizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[bezierView]-0-|" options:0 metrics:nil views:views];
    NSArray *bezierVerticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[bezierView]-0-|" options:0 metrics:nil views:views];
    
    [self addConstraints:imageVerticalConstraints];
    [self addConstraints:imageHorizontalConstraints];
    [self addConstraints:bezierVerticalConstraints];
    [self addConstraints:bezierHorizontalConstraints];
}

#pragma mark - Setter & Getter -

- (void)setStrokeColor:(UIColor *)strokeColor {
    _strokeColor = strokeColor;
    self.bezierView.strokeColor = strokeColor;
}

- (void)setGraffitiEnabled:(BOOL)graffitiEnabled {
    _graffitiEnabled = graffitiEnabled;
    
    if (graffitiEnabled) {
        self.userInteractionEnabled = YES;
        [self addGestureRecognizer:self.pan];
    } else {
        self.userInteractionEnabled = NO;
        [self removeGestureRecognizer:self.pan];
    }
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        _imageView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _imageView;
}

- (NSMutableArray *)paths {
    if (!_paths) {
        _paths = [[NSMutableArray alloc] init];
    }
    return _paths;
}

- (LCBezierView *)bezierView {
    if (!_bezierView) {
        _bezierView = [[LCBezierView alloc] init];
        _bezierView.strokeColor = [UIColor blackColor];
        _bezierView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _bezierView;
}

@end
