//
//  UIView+Corner.m
//  CJ Dropshipping
//
//  Created by cujia_1 on 2020/6/23.
//  Copyright © 2020 CuJia. All rights reserved.
//

#import "UIView+CJCorner.h"

@implementation UIView (CJCorner)

/**
继承自UIView的控件切圆角

@param  cornerRadius  半径
@param  borderColor  边框颜色
@param  borderWidth  边框宽度
*/
- (void)clipWithCornerRadius:(CGFloat)cornerRadius borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth{
    self.clipsToBounds = YES;
    if(cornerRadius) {
        self.layer.cornerRadius = cornerRadius;
    }
    if(borderColor) {
        self.layer.borderColor = ((UIColor *)borderColor).CGColor;
    }
    if(borderWidth) {
        self.layer.borderWidth = borderWidth;
    }
}

#pragma mark - 设置部分圆角
/**
 设置部分圆角(绝对布局)
 
 @param corners 需要设置为圆角的角 UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight | UIRectCornerAllCorners
 @param radius   需要设置的圆角大小 例如 CGSizeMake(20.0f, 20.0f)
*/
- (void)addRoundedCorners:(UIRectCorner)corners radius:(CGSize)radius {
    UIBezierPath* rounded = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corners cornerRadii:radius];
    CAShapeLayer* shape = [[CAShapeLayer alloc] init];
    [shape setPath:rounded.CGPath];
    self.layer.mask = shape;
}

/**
 设置部分圆角(相对布局)

 @param corners  需要设置为圆角的角 UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight | UIRectCornerAllCorners
 @param radius      需要设置的圆角大小 例如 CGSizeMake(20.0f, 20.0f)
 @param rect        需要设置的圆角view的rect
*/
- (void)addRoundedCorners:(UIRectCorner)corners radius:(CGSize)radius rect:(CGRect)rect {
    UIBezierPath* rounded = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corners cornerRadii:radius];
    CAShapeLayer* shape = [[CAShapeLayer alloc] init];
    [shape setPath:rounded.CGPath];
    self.layer.mask = shape;
}

/**
 添加shadow
 
 @param  view  添加shadow的视图
 @param  color shadow的颜色
 */
+ (void)addShadowToView:(UIView *)view color:(UIColor *)color {
    //添加阴影
    view.layer.shadowColor = color.CGColor;
    view.layer.shadowOffset = CGSizeMake(0,-1);
    view.layer.shadowOpacity = 1;
    view.layer.shadowRadius = 5;
    float shadowPathWidth = view.layer.shadowRadius;
    CGRect shadowRect = CGRectMake(0, 0 - shadowPathWidth / 2.0, view.bounds.size.width, shadowPathWidth);
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:shadowRect];
    view.layer.shadowPath = path.CGPath;
}

/**
 为视图添加分割线
 
 @param view   需要绘制成虚线的view
 @param lineLength    虚线的宽度
 @param lineSpacing   虚线的间距
 @param lineColor   虚线的颜色
 */
- (void)drawDashLine:(UIView *)view lineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor {
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    [shapeLayer setBounds:view.bounds];
    [shapeLayer setPosition:CGPointMake(CGRectGetWidth(view.frame) / 2, CGRectGetHeight(view.frame))];
    [shapeLayer setFillColor:[UIColor clearColor].CGColor];
    
    //  设置虚线颜色为
    [shapeLayer setStrokeColor:lineColor.CGColor];
    
    //  设置虚线宽度
    [shapeLayer setLineWidth:CGRectGetHeight(view.frame)];
    [shapeLayer setLineJoin:kCALineJoinRound];
    
    //  设置线宽，线间距
    [shapeLayer setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithInt:lineLength], [NSNumber numberWithInt:lineSpacing], nil]];
    
    //  设置路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, 0);
    CGPathAddLineToPoint(path, NULL, CGRectGetWidth(view.frame), 0);
    
    [shapeLayer setPath:path];
    CGPathRelease(path);
    
    //  把绘制好的虚线添加上来
    [view.layer addSublayer:shapeLayer];
}

@end
