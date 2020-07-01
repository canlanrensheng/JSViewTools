//
//  UIButton+EnlargeTouchArea.m
//  ysscw_ios
//
//  Created by 张金山 on 2020/5/19.
//  Copyright © 2020 ysscw. All rights reserved.
//

#import "UIButton+CJEnlargeTouchArea.h"
#import <objc/runtime.h>

static const NSString * KEnlargeTouchAreaTopKey = @"KEnlargeTouchAreaTopKey";
static const NSString * KEnlargeTouchAreaRightKey = @"KEnlargeTouchAreaRightKey";
static const NSString * KEnlargeTouchAreeBottomKey = @"KEnlargeTouchAreeBottomKey";
static const NSString * KEnlargeTouchAreeLeftKey = @"KEnlargeTouchAreeLeftKey";

@implementation UIButton (CJEnlargeTouchArea)


/**
扩大按钮的点击区域

@param  top  距离content top的距离
@param  right  距离content right的距离
@param  bottom  距离content bottom的距离
@param  left  距离content left的距离
*/
- (void)setEnlargeEdgeWithTop:(CGFloat)top right:(CGFloat)right bottom:(CGFloat)bottom left:(CGFloat)left {
    objc_setAssociatedObject(self, &KEnlargeTouchAreaTopKey, [NSNumber numberWithFloat:top], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &KEnlargeTouchAreaRightKey, [NSNumber numberWithFloat:right], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &KEnlargeTouchAreeBottomKey, [NSNumber numberWithFloat:bottom], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &KEnlargeTouchAreeBottomKey, [NSNumber numberWithFloat:left], OBJC_ASSOCIATION_COPY_NONATOMIC);
}

/**
按钮点击区域
*/
- (UIView*)hitTest:(CGPoint)point withEvent:(UIEvent*)event {
    CGRect rect = [self enlargedRect];
    //如果按钮设置为不可点击、隐藏、透明度小于等于0.01或者点击在按钮内部，则直接执行父类方法
    if (CGRectEqualToRect(rect, self.bounds) || self.userInteractionEnabled == NO || self.hidden == YES || self.alpha <= 0.01) {
        return [super hitTest:point withEvent:event];
    }
    //判断点击是否在放大的范围内
    return CGRectContainsPoint(rect, point) ? self : nil;
}

/**
重新规划布局
*/
- (CGRect)enlargedRect {
    NSNumber* topEdge = objc_getAssociatedObject(self, &KEnlargeTouchAreaTopKey);
    NSNumber* rightEdge = objc_getAssociatedObject(self, &KEnlargeTouchAreaRightKey);
    NSNumber* bottomEdge = objc_getAssociatedObject(self, &KEnlargeTouchAreeBottomKey);
    NSNumber* leftEdge = objc_getAssociatedObject(self, &KEnlargeTouchAreeBottomKey);
    if (topEdge && rightEdge && bottomEdge && leftEdge) {
        return CGRectMake(self.bounds.origin.x - leftEdge.floatValue,
                          self.bounds.origin.y - topEdge.floatValue,
                          self.bounds.size.width + leftEdge.floatValue + rightEdge.floatValue,
                          self.bounds.size.height + topEdge.floatValue + bottomEdge.floatValue);
    } else {
        return self.bounds;
    }
}

@end
