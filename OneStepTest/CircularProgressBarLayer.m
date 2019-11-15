@import UIKit;
@import CoreGraphics;

#import "CircularProgressBarLayer.h"

@implementation CircularProgressBarLayer
@dynamic value;
@dynamic maxValue;
@dynamic borderPadding;
@dynamic progressLineWidth;
@dynamic progressColor;
@dynamic progressStrokeColor;
@dynamic emptyLineWidth;
@dynamic progressAngle;
@dynamic emptyLineColor;
@dynamic emptyLineStrokeColor;
@dynamic emptyCapType;
@dynamic progressCapType;
@dynamic progressRotationAngle;
@dynamic progressAppearanceType;

#pragma mark - Drawing

- (void) drawInContext:(CGContextRef) context{
    [super drawInContext:context];

    UIGraphicsPushContext(context);
    
    CGRect rect = CGContextGetClipBoundingBox(context);
    rect = CGRectIntegral(CGRectInset(rect, self.borderPadding, self.borderPadding));
    
    [self drawEmptyBar:rect context:context];
    [self drawProgressBar:rect context:context];
  
    UIGraphicsPopContext();
}

- (void)drawEmptyBar:(CGRect)rect context:(CGContextRef)c{
    
    if(self.emptyLineWidth <= 0){
        return;
    }
    
    CGPoint center = {CGRectGetMidX(rect), CGRectGetMidY(rect)};
    CGFloat radius = MIN(CGRectGetWidth(rect), CGRectGetHeight(rect))/2;
    if (self.progressAppearanceType == CircularProgressBarAppearanceTypeOverlaysEmptyLine) {
        radius = radius - MAX(self.emptyLineWidth, self.progressLineWidth)/2.f;
    } else if (self.progressAppearanceType == CircularProgressBarAppearanceTypeAboveEmptyLine) {
        radius = radius - self.progressLineWidth - self.emptyLineWidth/2.f;
    } else {
        radius = radius - self.emptyLineWidth/2.f;
    }
    
    CGMutablePathRef arc = CGPathCreateMutable();
    CGPathAddArc(arc, NULL, center.x, center.y, radius,
                 (self.progressAngle/100.f)*M_PI-((-self.progressRotationAngle/100.f)*2.f+0.5)*M_PI,
                 -(self.progressAngle/100.f)*M_PI-((-self.progressRotationAngle/100.f)*2.f+0.5)*M_PI,
                 YES);
    

    CGPathRef strokedArc = CGPathCreateCopyByStrokingPath(arc, NULL, self.emptyLineWidth, (CGLineCap)self.emptyCapType, kCGLineJoinMiter, 10);
    
    CGContextAddPath(c, strokedArc);
    CGContextSetStrokeColorWithColor(c, self.emptyLineStrokeColor.CGColor);
    CGContextSetFillColorWithColor(c, self.emptyLineColor.CGColor);
    CGContextDrawPath(c, kCGPathFillStroke);
    
    CGPathRelease(arc);
    CGPathRelease(strokedArc);
}

- (void)drawProgressBar:(CGRect)rect context:(CGContextRef)c{
    if(self.progressLineWidth <= 0){
        return;
    }
    
    CGPoint center = {CGRectGetMidX(rect), CGRectGetMidY(rect)};
    CGFloat radius = MIN(CGRectGetWidth(rect), CGRectGetHeight(rect))/2;
    if (self.progressAppearanceType == CircularProgressBarAppearanceTypeOverlaysEmptyLine) {
        radius = radius - MAX(self.emptyLineWidth, self.progressLineWidth)/2.f;
    } else if (self.progressAppearanceType == CircularProgressBarAppearanceTypeAboveEmptyLine) {
        radius = radius - self.progressLineWidth/2.f;
    } else {
        radius = radius - self.emptyLineWidth - self.progressLineWidth/2.f;
    }
    
    CGMutablePathRef arc = CGPathCreateMutable();
    CGPathAddArc(arc, NULL,
                 center.x, center.y, radius,
                 (self.progressAngle/100.f)*M_PI-((-self.progressRotationAngle/100.f)*2.f+0.5)*M_PI-(2.f*M_PI)*(self.progressAngle/100.f)*(100.f-100.f*self.value/self.maxValue)/100.f,
                 -(self.progressAngle/100.f)*M_PI-((-self.progressRotationAngle/100.f)*2.f+0.5)*M_PI,
                 YES);
    
    CGPathRef strokedArc = CGPathCreateCopyByStrokingPath(arc, NULL, self.progressLineWidth, (CGLineCap)self.progressCapType, kCGLineJoinMiter, 10);
    CGContextAddPath(c, strokedArc);
    
    CGContextSetFillColorWithColor(c, self.progressColor.CGColor);
    CGContextSetStrokeColorWithColor(c, self.progressStrokeColor.CGColor);
    CGContextDrawPath(c, kCGPathFillStroke);
    
    CGPathRelease(arc);
    CGPathRelease(strokedArc);
}

#pragma mark - Override methods to support animations

+ (BOOL)needsDisplayForKey:(NSString *)key {
    if ([key isEqualToString:@"value"]) {
        return YES;
    }
    return [super needsDisplayForKey:key];
}

- (id<CAAction>)actionForKey:(NSString *)event{
    if ([self presentationLayer] != nil) {
        if ([event isEqualToString:@"value"]) {  
            id animation = [super actionForKey:@"backgroundColor"];
            
            if (animation == nil || [animation isEqual:[NSNull null]])
            {
                [self setNeedsDisplay];
                return [NSNull null];
            }
            [animation setKeyPath:event];
            [animation setFromValue:[self.presentationLayer valueForKey:@"value"]];
            [animation setToValue:nil];
            return animation;
        }
    }
    
    return [super actionForKey:event];
}

@end
