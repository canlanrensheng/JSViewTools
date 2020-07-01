//
//  UIView+Create.h
//  JSViewTool
//
//  Created by 张金山 on 2019/12/8.
//  Copyright © 2019 张金山. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 UIView创建方法
 */
@interface UIView (CJCreate)

/**
 类方法创建UIView
 
 @param  frame  frame
 @param  cornerRadius  半径
 @param  borderColor  边框颜色
 @param  borderWidth  边框宽度
 @param  backGroundColor  背景颜色
 */
+ (UIView *)createViewWithFrame:(CGRect)frame cornerRadius:(CGFloat)cornerRadius borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth backGroundColor:(UIColor *)backGroundColor;

/**
类方法创建UIView

@param  frame  frame
@param  backGroundColor  背景颜色
*/
+ (UIView *)createViewWithFrame:(CGRect)frame backGroundColor:(UIColor *)backGroundColor;

@end

NS_ASSUME_NONNULL_END
