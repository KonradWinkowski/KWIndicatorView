//
//  KWIndicatorView.h
//  KWIndicatorView
//
//  Created by Konrad Winkowski on 8/2/16.
//  Copyright © 2016 KonradWinkowski. All rights reserved.
//


#import <UIKit/UIKit.h>

IB_DESIGNABLE

@interface KWIndicatorView : UIView

/**
 *  The radius of the Indicator View. Set this to -1 to have the raduis be 1/2 the width or height (depending on which is smaller of the view)
 */
@property (nonatomic, assign) IBInspectable float viewRadius;

/**
 *  The number of times the view should pulse. Set this to -1 to have it pulse forever
 */
@property (nonatomic, assign) IBInspectable int numberOfPulses;

/**
 *  The duration of the pulse animation
 */
@property (nonatomic, assign) IBInspectable float pulseDuration;

/**
 *  The scale of the pulse animation. The greater the value the more the pulse animation will expand out.
 */
@property (nonatomic, assign) IBInspectable float pulseScale;

/**
 *  The color of the pulse animation. This will take on the color of the background view if not set.
 */
@property (nonatomic, strong) IBInspectable UIColor *pulseColor;

/**
 *  The color of the main indicator
 */
@property (nonatomic, strong) IBInspectable UIColor *viewColor;

/**
 *  Call this to make the view pulse. This will take into effect the numberOfPulses property.
 */
-(void)pulse;

@end
