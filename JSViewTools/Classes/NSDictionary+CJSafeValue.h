//
//  NSDictionary+Safe.h
//  JSProject
//
//  Created by 张金山 on 2019/6/18.
//  Copyright © 2020 张金山. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
字典的安全取值
*/
@interface NSDictionary (CJSafeValue)

/**
字典安全字符串取值并设置占位

@param  key  字典的健
@param defaultValue 占位字符串
*/
- (NSString *)safeStringValueForKey:(id)key defaultValue:(NSString *)defaultValue;

/**
字典安全NSNumber取值并设置占位

@param  key  字典的健
@param defaultValue 占位字符串
*/
- (NSNumber *)safeNumberValueForKey:(id)key defaultValue:(NSNumber *)defaultValue;

/**
字典安字UnsignedInteger取值并设置占位

@param  key  字典的健
@param defaultValue 占位字符串
*/
- (NSUInteger)safeUnsignedIntegerValueForKey:(id)key defaultValue:(NSUInteger)defaultValue;

/**
字典安全Integer取值并设置占位

@param  key  字典的健
@param defaultValue 占位字符串
*/
- (NSInteger)safeIntegerValueForKey:(id)key defaultValue:(NSInteger)defaultValue;

/**
字典安全Bool取值并设置占位

@param  key  字典的健
@param defaultValue 占位字符串
*/
- (BOOL)safeBoolValueForKey:(id)key defaultValue:(BOOL)defaultValue;

/**
字典安全float取值并设置占位

@param  key  字典的健
@param defaultValue 占位字符串
*/
- (CGFloat)safeFloatValueForKey:(id)key defaultValue:(CGFloat)defaultValue;

/**
字典安全Array取值并设置占位

@param  key  字典的健
@param defaultValue 占位字符串
*/
- (NSArray *)safeArrayValueForKey:(id)key defaultValue:(NSArray *)defaultValue;

/**
字典安全Dictionary取值并设置占位

@param  key  字典的健
@param defaultValue 占位字符串
*/
- (NSDictionary *)safeDictionaryValueForKey:(id)key defaultValue:(NSDictionary *)defaultValue;

@end

NS_ASSUME_NONNULL_END
