//
//  UIButton+Create.h
//  JSViewTool
//
//  Created by 张金山 on 2019/12/7.
//  Copyright © 2019 张金山. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/*！
 文字和图片的排版
 
 - ButtonLayoutStyleImagePositionLeft: 左边图片右边文字
 - ButtonLayoutStyleImagePositionRight: 右边图片，左边文字
 - ButtonLayoutStyleImagePositionTop: 上边图片下边文字
 - ButtonLayoutStyleImagePositionBottom: 上面文字下边图片
*/
typedef NS_ENUM(NSInteger, ButtonLayoutStyle) {
    ButtonLayoutStyleImagePositionLeft = 0,
    ButtonLayoutStyleImagePositionRight,
    ButtonLayoutStyleImagePositionTop,
    ButtonLayoutStyleImagePositionBottom
};


/**
UIButton创建
*/
@interface UIButton (CJCreate)

/**
 类方法创建UIButton
 
 @param  frame  frame
 @param  title  标题
 @param  textColor  标题颜色
 @param  font  字体
 @param  backGroundColor  背景颜色
 @param  target  target
 @param  action  action
 */
+ (UIButton *)creatButtonWithFrame:(CGRect)frame title:(NSString *)title textColor:(UIColor *)textColor font:(UIFont *)font backGroundColor:(UIColor *)backGroundColor target:(id)target action:(SEL)action;

/**
类方法创建UIButton

@param  frame  frame
@param  title  标题
@param  textColor  标题颜色
@param  font  字体
@param  backGroundColor  背景颜色
@param  completionHandle  回掉block
*/
+ (UIButton *)creatButtonWithFrame:(CGRect)frame title:(NSString *)title textColor:(UIColor *)textColor font:(UIFont *)font backGroundColor:(UIColor *)backGroundColor action:(void (^)(id completionHandle))completionHandle;

/**
类方法创建UIButton

@param  title  标题
@param  textColor  标题颜色
@param  font  字体
@param  target  target
@param  action  action
*/
+ (UIButton *)creatButtonWithTitle:(NSString *)title textColor:(UIColor *)textColor font:(UIFont *)font target:(id)target action:(SEL)action;

/**
类方法创建UIButton

@param  title  标题
@param  textColor  标题颜色
@param  font  字体
@param  backGroundColor  背景颜色
@param  target  target
@param  action  action
*/
+ (UIButton *)creatButtonWithTitle:(NSString *)title textColor:(UIColor *)textColor font:(UIFont *)font backGroundColor:(UIColor *)backGroundColor target:(id)target action:(SEL)action;

/**
 类方法创建UIButton
 
 @param  style  文字图片排版类型
 @param  space  文字和图片的间距
 */
- (void)layoutWithStyle:(ButtonLayoutStyle)style space:(CGFloat)space;

@end

NS_ASSUME_NONNULL_END
