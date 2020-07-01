//
//  UIView+Create.m
//  JSViewTool
//
//  Created by 张金山 on 2019/12/8.
//  Copyright © 2019 张金山. All rights reserved.
//

#import "UIView+CJCreate.h"

@implementation UIView (CJCreate)

/**
 类方法创建UIView
 
 @param  frame  frame
 @param  cornerRadius  半径
 @param  borderColor  边框颜色
 @param  borderWidth  边框宽度
 @param  backGroundColor  背景颜色
 */
+ (UIView *)createViewWithFrame:(CGRect)frame cornerRadius:(CGFloat)cornerRadius borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth backGroundColor:(UIColor *)backGroundColor {
    UIView *view = [[UIView alloc] initWithFrame:frame];
    if(cornerRadius) {
        view.layer.cornerRadius = cornerRadius;
        view.layer.borderColor = borderColor.CGColor;
        view.layer.borderWidth = borderWidth;
        view.layer.masksToBounds = YES;;
    }
    if(backGroundColor) {
        view.backgroundColor = backGroundColor;
    }
    return view;
}

/**
类方法创建UIView

@param  frame  frame
@param  backGroundColor  背景颜色
*/
+ (UIView *)createViewWithFrame:(CGRect)frame backGroundColor:(UIColor *)backGroundColor {
    UIView *view = [UIView createViewWithFrame:frame cornerRadius:0 borderColor:[UIColor clearColor] borderWidth:0 backGroundColor:backGroundColor];
    return view;
}



@end
