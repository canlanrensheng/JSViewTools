//
//  UIButton+EnlargeTouchArea.h
//  ysscw_ios
//
//  Created by 张金山 on 2020/5/19.
//  Copyright © 2020 ysscw. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
UIButton扩大点击区域
*/
NS_ASSUME_NONNULL_BEGIN

@interface UIButton (CJEnlargeTouchArea)

/**
 扩大按钮的点击区域
 
 @param  top  距离content top的距离
 @param  right  距离content right的距离
 @param  bottom  距离content bottom的距离
 @param  left  距离content left的距离
 */
- (void)setEnlargeEdgeWithTop:(CGFloat)top right:(CGFloat)right bottom:(CGFloat)bottom left:(CGFloat)left;

@end

NS_ASSUME_NONNULL_END
