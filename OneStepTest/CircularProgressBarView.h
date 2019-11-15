@import UIKit;

IB_DESIGNABLE

@interface CircularProgressBarView : UIView

/**
 * The value of the progress bar (Animatable property using [UIView animateWithDuration:]) 
 */
@property (nonatomic,assign) IBInspectable CGFloat value;

/** 
 * The maximum possible value, used to calculate the progress (value/maxValue)	[0,∞) 
 */
@property (nonatomic,assign) IBInspectable CGFloat   maxValue;

/**
 * Padding from borders
 */
@property (nonatomic,assign) IBInspectable CGFloat borderPadding;

/**
 * Progress bar appearance type
 */
@property (nonatomic,assign) IBInspectable NSInteger progressAppearanceType;

/**
 * Progress bar rotation (Clockewise)	[0,100] 
 */
@property (nonatomic,assign) IBInspectable CGFloat   progressRotationAngle;

/** 
 * Set a partial angle for the progress bar	[0,100] 
 */
@property (nonatomic,assign) IBInspectable CGFloat   progressAngle;

/** 
 * The width of the progress bar (user space units)	[0,∞)
 */
@property (nonatomic,assign) IBInspectable CGFloat   progressLineWidth;

/** 
 * The color of the progress bar 
 */
@property (nonatomic,strong) IBInspectable UIColor   *progressColor;

/**
 * The color of the progress bar frame 
 */
@property (nonatomic,strong) IBInspectable UIColor   *progressStrokeColor;

/**
 * The shape of the progress bar cap	{kCGLineCapButt=0, kCGLineCapRound=1, kCGLineCapSquare=2} 
 */
@property (nonatomic,assign) IBInspectable NSInteger progressCapType;

/**
 * The width of the background bar (user space units)	[0,∞) 
 */
@property (nonatomic,assign) IBInspectable CGFloat   emptyLineWidth;

/**
 * The color of the background bar 
 */
@property (nonatomic,strong) IBInspectable UIColor   *emptyLineColor;

/**
 * The color of the background bar stroke color
 */
@property (nonatomic,strong) IBInspectable UIColor   *emptyLineStrokeColor;

/**
 * The shape of the background bar cap	{kCGLineCapButt=0, kCGLineCapRound=1, kCGLineCapSquare=2} 
 */
@property (nonatomic,assign) IBInspectable NSInteger emptyCapType;

@end
