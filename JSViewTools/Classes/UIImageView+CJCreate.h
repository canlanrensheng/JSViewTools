//
//  UIImageView+Create.h
//  JSViewTool
//
//  Created by 张金山 on 2019/12/8.
//  Copyright © 2019 张金山. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
UIImageView创建
*/
@interface UIImageView (CJCreate)

/**
类方法创建UIImageView

@param  frame  frame
@param  imageName  图片名称
@param  cornerRadius  半径
@param  borderColor  边框颜色
@param  borderWidth  边框宽度
*/
+ (UIImageView *)createImageViewWithFrame:(CGRect)frame imageName:(NSString *)imageName cornerRadius:(CGFloat)cornerRadius borderColor:(id)borderColor borderWidth:(CGFloat)borderWidth;

/**
类方法创建UIImageView

@param  imageName  图片名称
@param  cornerRadius  半径
@param  borderColor  边框颜色
@param  borderWidth  边框宽度
*/
+ (UIImageView *)createImageViewWithImageName:(NSString *)imageName cornerRadius:(CGFloat)cornerRadius borderColor:(id)borderColor borderWidth:(CGFloat)borderWidth;

/**
类方法创建UIImageView

@param  frame  frame
@param  imageName  图片名称
*/
+ (UIImageView *)creatImageViewWithFrame:(CGRect)frame imageName:(NSString *)imageName;

/**
类方法创建UIImageView

@param  imageName  图片名称
*/
+ (UIImageView *)createImageViewWithImageName:(NSString *)imageName;

@end

NS_ASSUME_NONNULL_END
