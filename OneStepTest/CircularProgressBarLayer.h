@import QuartzCore;

typedef NS_ENUM(NSInteger, CircularProgressBarAppearanceType) {
    CircularProgressBarAppearanceTypeOverlaysEmptyLine = 0,
    CircularProgressBarAppearanceTypeAboveEmptyLine = 1,
    CircularProgressBarAppearanceTypeUnderEmptyLine = 2
};

/**
 * The CircularProgressBarLayer class is a CALayer subclass that represents the underlying layer
 * of CircularProgressBarView.
 */
@interface CircularProgressBarLayer : CALayer

/**
 * Set a partial angle for the progress bar [0,100]
 */
@property (nonatomic,assign) CGFloat  progressAngle;

/**
 * Progress bar rotation (Clockewise)    [0,100]
 */
@property (nonatomic,assign) CGFloat  progressRotationAngle;

/**
 * Progress bar appearance type
 */
@property (nonatomic,assign) CircularProgressBarAppearanceType progressAppearanceType;

/**
 * The value of the progress bar
 */
@property (nonatomic,assign) CGFloat  value;

/**
 * The maximum possible value, used to calculate the progress (value/maxValue)    [0,∞)
 */
@property (nonatomic,assign) CGFloat  maxValue;

/**
 * Padding from borders
 */
@property (nonatomic,assign) CGFloat borderPadding;

/**
 * Animation duration in seconds
 */
@property (nonatomic,assign) NSTimeInterval animationDuration;

/**
 * The width of the progress bar (user space units)    [0,∞)
 */
@property (nonatomic,assign) CGFloat progressLineWidth;

/**
 * The color of the progress bar
 */
@property (nonatomic,strong) UIColor *progressColor;

/**
 * The color of the progress bar frame
 */
@property (nonatomic,strong) UIColor *progressStrokeColor;

/**
 * The shape of the progress bar cap    {kCGLineCapButt=0, kCGLineCapRound=1, kCGLineCapSquare=2}
 */
@property (nonatomic,assign) CGLineCap  progressCapType;

/**
 * The width of the background bar (user space units)    [0,∞)
 */
@property (nonatomic,assign) CGFloat  emptyLineWidth;

/**
 * The shape of the background bar cap    {kCGLineCapButt=0, kCGLineCapRound=1, kCGLineCapSquare=2}
 */
@property (nonatomic,assign) CGLineCap  emptyCapType;

/**
 * The color of the background bar
 */
@property (nonatomic,strong) UIColor *emptyLineColor;
/**
 * The color of the background bar stroke line
 */
@property (nonatomic,strong) UIColor *emptyLineStrokeColor;


@end

