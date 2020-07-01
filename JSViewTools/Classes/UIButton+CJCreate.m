//
//  UIButton+Create.m
//  JSViewTool
//
//  Created by 张金山 on 2019/12/7.
//  Copyright © 2019 张金山. All rights reserved.
//

#import "UIButton+CJCreate.h"
#import <objc/runtime.h>

static const void *KButtonBlockKey = &KButtonBlockKey;

@implementation UIButton (CJCreate)

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
+ (UIButton *)creatButtonWithFrame:(CGRect)frame title:(NSString *)title textColor:(UIColor *)textColor font:(UIFont *)font backGroundColor:(UIColor *)backGroundColor target:(id)target action:(SEL)action {
    UIButton *button = [[UIButton alloc] initWithFrame:frame title:title textColor:textColor font:font backGroundColor:backGroundColor target:target action:action];
    return button;
}

/**
类方法创建UIButton

@param  frame  frame
@param  title  标题
@param  textColor  标题颜色
@param  font  字体
@param  backGroundColor  背景颜色
@param  completionHandle  回掉block
*/
+ (UIButton *)creatButtonWithFrame:(CGRect)frame title:(NSString *)title textColor:(UIColor *)textColor font:(UIFont *)font backGroundColor:(UIColor *)backGroundColor action:(void (^)(id completionHandle))completionHandle {
    UIButton *button = [[UIButton alloc] initWithFrame:frame];
    if(title) {
        [button setTitle:title forState:(UIControlStateNormal)];
    }
    if(textColor) {
        [button setTitleColor:textColor forState:UIControlStateNormal];
    }
    if(font) {
        button.titleLabel.font = font;
    }
    if(backGroundColor) {
        button.backgroundColor = backGroundColor;
    }
    if(completionHandle) {
        [button addTarget:self action:@selector(handleAction:) forControlEvents:UIControlEventTouchUpInside];
        objc_setAssociatedObject(button, KButtonBlockKey, completionHandle, OBJC_ASSOCIATION_COPY_NONATOMIC);
    }
    return button;
}

/**
类方法创建UIButton

@param  title  标题
@param  textColor  标题颜色
@param  font  字体
@param  target  target
@param  action  action
*/
+ (UIButton *)creatButtonWithTitle:(NSString *)title textColor:(UIColor *)textColor font:(UIFont *)font target:(id)target action:(SEL)action {
    return [self creatButtonWithFrame:CGRectZero title:title textColor:textColor font:font backGroundColor:[UIColor clearColor] target:target action:action];
}

/**
类方法创建UIButton

@param  title  标题
@param  textColor  标题颜色
@param  font  字体
@param  backGroundColor  背景颜色
@param  target  target
@param  action  action
*/
+ (UIButton *)creatButtonWithTitle:(NSString *)title textColor:(UIColor *)textColor font:(UIFont *)font backGroundColor:(UIColor *)backGroundColor target:(id)target action:(SEL)action {
    return [self creatButtonWithFrame:CGRectZero title:title textColor:textColor font:font backGroundColor:backGroundColor target:target action:action];
}

/**
实例方法创建UIButton

@param  frame  frame
@param  title  标题
@param  textColor  标题颜色
@param  font  字体
@param  backGroundColor  背景颜色
@param  target  target
@param  action  action
*/
- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title textColor:(UIColor *)textColor font:(UIFont *)font backGroundColor:(UIColor *)backGroundColor target:(id)target action:(SEL)action {
    UIButton *button = [[UIButton alloc] initWithFrame:frame];
    if(title) {
        [button setTitle:title forState:(UIControlStateNormal)];
    }
    if(textColor) {
        [button setTitleColor:textColor forState:UIControlStateNormal];
    }
    if(font) {
        button.titleLabel.font = font;
    }
    if(backGroundColor) {
        button.backgroundColor = backGroundColor;
    }
    if(action) {
       [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }
    return button;
}

+ (void)handleAction:(UIButton *)sender {
    void (^block)(id) = objc_getAssociatedObject(sender, KButtonBlockKey);
    if (block) block(sender);
}

/**
类方法创建UIButton

@param  style  文字图片排版类型
@param  space  文字和图片的间距
*/
- (void)layoutWithStyle:(ButtonLayoutStyle)style space:(CGFloat)space {
    CGFloat imageWith = self.imageView.image.size.width;
    CGFloat imageHeight = self.imageView.image.size.height;
    CGFloat labelWidth = 0.0;
    CGFloat labelHeight = 0.0;
    
    if (@available(iOS 8.0, *)) {
        labelWidth = self.titleLabel.intrinsicContentSize.width;
        labelHeight = self.titleLabel.intrinsicContentSize.height;
    } else {
        labelWidth = self.titleLabel.frame.size.width;
        labelHeight = self.titleLabel.frame.size.height;
    }
    
    UIEdgeInsets imageEdgeInsets = UIEdgeInsetsZero;
    UIEdgeInsets labelEdgeInsets = UIEdgeInsetsZero;
    switch (style) {
        case ButtonLayoutStyleImagePositionTop: {
            imageEdgeInsets = UIEdgeInsetsMake(-labelHeight - space / 2.0, 0, 0, -labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith, -imageHeight-space / 2.0, 0);
        }
            break;
        case ButtonLayoutStyleImagePositionLeft: {
            imageEdgeInsets = UIEdgeInsetsMake(0, -space / 2.0, 0, space / 2.0);
            labelEdgeInsets = UIEdgeInsetsMake(0, space / 2.0, 0, -space / 2.0);
        }
            break;
        case ButtonLayoutStyleImagePositionBottom: {
            imageEdgeInsets = UIEdgeInsetsMake(0, 0, -labelHeight - space / 2.0, -labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(-imageHeight - space / 2.0, -imageWith, 0, 0);
        }
            break;
        case ButtonLayoutStyleImagePositionRight: {
            imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth + space / 2.0, 0, -labelWidth - space / 2.0);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith - space / 2.0, 0, imageWith + space / 2.0);
        }
            break;
        default:
            break;
    }
    self.titleEdgeInsets = labelEdgeInsets;
    self.imageEdgeInsets = imageEdgeInsets;
}


@end
