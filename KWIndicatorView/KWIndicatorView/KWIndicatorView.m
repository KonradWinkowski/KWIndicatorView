//
//  KWIndicatorView.m
//  KWIndicatorView
//
//  Created by Konrad Winkowski on 8/2/16.
//  Copyright © 2016 KonradWinkowski. All rights reserved.
//

#import "KWIndicatorView.h"
@implementation KWIndicatorView
{
    CALayer *pulseLayer;
    CALayer *mainLayer;
}

- (void)setViewColor:(UIColor *)viewColor
{
    _viewColor = viewColor;
    if (mainLayer)
    {
        mainLayer.backgroundColor = _viewColor.CGColor;
    }
    else
    {
        [self createCircleView];
    }
    
    [self pulse];
}

- (void)setViewRadius:(float)viewRadius
{
    if (viewRadius == -1)
        viewRadius = MIN(self.frame.size.width, self.frame.size.height) / 2.0;
    
    _viewRadius = viewRadius;
    
    self.layer.cornerRadius = _viewRadius;
}

-(void)pulse
{
    [self circleAnimation:pulseLayer];
}

- (void)circleAnimation:(CALayer *)layer
{
    [layer removeAllAnimations];
    
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    [animationGroup setDuration:self.pulseDuration];
    CAMediaTimingFunction *timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    animationGroup.timingFunction = timingFunction;
    
    CABasicAnimation *fadeAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    fadeAnimation.fromValue = [NSNumber numberWithFloat:0.5];
    fadeAnimation.toValue = [NSNumber numberWithFloat:0];
    
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.fromValue = [NSNumber numberWithFloat:1];
    scaleAnimation.toValue = [NSNumber numberWithFloat:self.pulseScale];
    animationGroup.animations = [NSArray arrayWithObjects:fadeAnimation, scaleAnimation, nil];
    [layer addAnimation:animationGroup forKey:@"fadeAnimation"];
}

-(void)createCircleView
{
    // main Layer
    CGSize circleSize = CGSizeMake(self.frame.size.width, self.frame.size.width);
    mainLayer =[CALayer new];
    mainLayer.backgroundColor = self.viewColor.CGColor;
    mainLayer.bounds = CGRectMake(0, 0, circleSize.width, circleSize.height);
    mainLayer.cornerRadius = self.viewRadius;
    mainLayer.position = CGPointMake(self.frame.size.width / 2.0, self.frame.size.height / 2.0);
    [self.layer addSublayer:mainLayer];
    
    // pulse Layer
    pulseLayer =[CALayer new];
    pulseLayer.backgroundColor = self.pulseColor.CGColor;
    pulseLayer.bounds = CGRectMake(0, 0, circleSize.width, circleSize.height);
    pulseLayer.cornerRadius = self.viewRadius;
    pulseLayer.position = CGPointMake(self.frame.size.width / 2.0, self.frame.size.height / 2.0);
    [self.layer insertSublayer:pulseLayer below:mainLayer];
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 Drawing code
 }
 */

@end
