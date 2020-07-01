//
//  UIImageView+Create.m
//  JSViewTool
//
//  Created by 张金山 on 2019/12/8.
//  Copyright © 2019 张金山. All rights reserved.
//

#import "UIImageView+CJCreate.h"

@implementation UIImageView (CJCreate)

/**
类方法创建UIImageView

@param  frame  frame
@param  imageName  图片名称
@param  cornerRadius  半径
@param  borderColor  边框颜色
@param  borderWidth  边框宽度
*/
+ (UIImageView *)createImageViewWithFrame:(CGRect)frame imageName:(NSString *)imageName cornerRadius:(CGFloat)cornerRadius borderColor:(id)borderColor borderWidth:(CGFloat)borderWidth {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    if(imageName) {
        imageView.image = [UIImage imageNamed:imageName];
    }
    if(cornerRadius) {
        imageView.layer.cornerRadius = cornerRadius;
        imageView.layer.masksToBounds = YES;
    }
    if(borderColor) {
        imageView.layer.borderColor = ((UIColor *)borderColor).CGColor;
    }
    if(borderWidth) {
        imageView.layer.borderWidth = borderWidth;
    }
    return imageView;
}

/**
类方法创建UIImageView

@param  imageName  图片名称
@param  cornerRadius  半径
@param  borderColor  边框颜色
@param  borderWidth  边框宽度
*/
+ (UIImageView *)createImageViewWithImageName:(NSString *)imageName cornerRadius:(CGFloat)cornerRadius borderColor:(id)borderColor borderWidth:(CGFloat)borderWidth {
    return [self createImageViewWithFrame:CGRectZero imageName:imageName cornerRadius:cornerRadius borderColor:borderColor borderWidth:borderWidth];
}

/**
类方法创建UIImageView

@param  frame  frame
@param  imageName  图片名称
*/
+ (UIImageView *)creatImageViewWithFrame:(CGRect)frame imageName:(NSString *)imageName {
    UIImageView *imageView = [UIImageView createImageViewWithFrame:frame imageName:imageName cornerRadius:0 borderColor:[UIColor clearColor] borderWidth:0];
    return imageView;
}

/**
类方法创建UIImageView

@param  imageName  图片名称
*/
+ (UIImageView *)createImageViewWithImageName:(NSString *)imageName {
    return [self creatImageViewWithFrame:CGRectZero imageName:imageName];
}

@end
