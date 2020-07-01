//
//  NSDictionary+Safe.m
//  JSProject
//
//  Created by 张金山 on 2019/6/18.
//  Copyright © 2020 张金山. All rights reserved.
//

#import "NSDictionary+CJSafeValue.h"


@implementation NSDictionary (CJSafeValue)

/**
字典安全字符串取值并设置占位

@param  key  字典的健
@param defaultValue 占位字符串
*/
- (NSString *)safeStringValueForKey:(id)key defaultValue:(NSString *)defaultValue {
    id value = self[key];
    if (value == nil) {
        return defaultValue;
    } else if ([value isKindOfClass:[NSString class]]) {
        return value;
    } else {
        return [NSString stringWithFormat:@"%@", value];
    }
}

/**
字典安全NSNumber取值并设置占位

@param  key  字典的健
@param defaultValue 占位字符串
*/
- (NSNumber *)safeNumberValueForKey:(id)key defaultValue:(NSNumber *)defaultValue {
    id value = self[key];
    if (value == nil) {
        return defaultValue;
    } else if ([value isKindOfClass:[NSNumber class]]) {
        return value;
    } else if ([value isKindOfClass:[NSString class]]) {
        return @([value doubleValue]);
    } else {
        return defaultValue;
    }
}

/**
字典安全UnsignedInteger取值并设置占位

@param  key  字典的健
@param defaultValue 占位字符串
*/
- (NSUInteger)safeUnsignedIntegerValueForKey:(id)key defaultValue:(NSUInteger)defaultValue {
    id value = self[key];
    if (value == nil) {
        return defaultValue;
    } else if ([value isKindOfClass:[NSNumber class]]) {
        return [value unsignedIntegerValue];
    } else if ([value isKindOfClass:[NSString class]]) {
        return (NSUInteger)[value integerValue];
    } else {
        return defaultValue;
    }
}

/**
字典安全字Integer取值并设置占位

@param  key  字典的健
@param defaultValue 占位字符串
*/
- (NSInteger)safeIntegerValueForKey:(id)key defaultValue:(NSInteger)defaultValue {
    id value = self[key];
    if (value == nil) {
        return defaultValue;
    } else if ([value isKindOfClass:[NSNumber class]]) {
        return [value integerValue];
    } else if ([value isKindOfClass:[NSString class]]) {
        return [value integerValue];
    } else {
        return defaultValue;
    }
}

/**
字典安全Bool取值并设置占位

@param  key  字典的健
@param defaultValue 占位字符串
*/
- (BOOL)safeBoolValueForKey:(id)key defaultValue:(BOOL)defaultValue {
    id value = self[key];
    if (value == nil) {
        return defaultValue;
    } else if ([value isKindOfClass:[NSNumber class]]) {
        return [value boolValue];
    } else if ([value isKindOfClass:[NSString class]]) {
        return [value boolValue];
    } else {
        return defaultValue;
    }
}

/**
字典安全float取值并设置占位

@param  key  字典的健
@param defaultValue 占位字符串
*/
- (CGFloat)safeFloatValueForKey:(id)key defaultValue:(CGFloat)defaultValue {
    id value = self[key];
    if (value == nil) {
        return defaultValue;
    } else if ([value isKindOfClass:[NSNumber class]]) {
        return [value floatValue];
    } else if ([value isKindOfClass:[NSString class]]) {
        return [value floatValue];
    } else {
        return defaultValue;
    }
}

/**
字典安全Array取值并设置占位

@param  key  字典的健
@param defaultValue 占位字符串
*/
- (NSArray *)safeArrayValueForKey:(id)key defaultValue:(NSArray *)defaultValue {
    id value = self[key];
    if (value == nil) {
        return defaultValue;
    } else if ([value isKindOfClass:[NSArray class]]) {
        return value;
    } else {
        return defaultValue;
    }
}

/**
字典安全Dictionary取值并设置占位

@param  key  字典的健
@param defaultValue 占位字符串
*/
- (NSDictionary *)safeDictionaryValueForKey:(id)key defaultValue:(NSDictionary *)defaultValue {
    id value = self[key];
    if (value == nil) {
        return defaultValue;
    } else if ([value isKindOfClass:[NSDictionary class]]) {
        return value;
    } else {
        return defaultValue;
    }
}


@end
