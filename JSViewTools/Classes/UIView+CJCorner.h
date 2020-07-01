//
//  UIView+Corner.h
//  CJ Dropshipping
//
//  Created by cujia_1 on 2020/6/23.
//  Copyright © 2020 CuJia. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
UIView设置圆角 阴影 分割线
*/
@interface UIView (CJCorner)

/**
 继承自UIView的控件切圆角
 
 @param  cornerRadius  半径
 @param  borderColor  边框颜色
 @param  borderWidth  边框宽度
 */
- (void)clipWithCornerRadius:(CGFloat)cornerRadius borderColor:(UIColor *_Nonnull)borderColor borderWidth:(CGFloat)borderWidth;

#pragma mark - 设置部分圆角
/**
 设置部分圆角(绝对布局)
 
 @param corners 需要设置为圆角的角 UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight | UIRectCornerAllCorners
 @param radius   需要设置的圆角大小 例如 CGSizeMake(20.0f, 20.0f)
*/
- (void)addRoundedCorners:(UIRectCorner)corners radius:(CGSize)radius;

/**
 设置部分圆角(相对布局)

 @param corners  需要设置为圆角的角 UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight | UIRectCornerAllCorners
 @param radius      需要设置的圆角大小 例如 CGSizeMake(20.0f, 20.0f)
 @param rect        需要设置的圆角view的rect
*/
- (void)addRoundedCorners:(UIRectCorner)corners radius:(CGSize)radius rect:(CGRect)rect;

/**
 添加shadow
 
 @param  view  添加shadow的视图
 @param  color shadow的颜色
 */
+ (void)addShadowToView:(UIView *_Nonnull)view color:(UIColor *_Nonnull)color;

/**
 为视图添加分割线
 
 @param view   需要绘制成虚线的view
 @param lineLength    虚线的宽度
 @param lineSpacing   虚线的间距
 @param lineColor   虚线的颜色
 */
- (void)drawDashLine:(UIView *_Nonnull)view lineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *_Nonnull)lineColor;

@end

NS_ASSUME_NONNULL_END
