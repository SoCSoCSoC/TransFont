//
//  UIFont+CustomFont.m
//  CCTVPoint
//
//  Created by Joe on 2017/6/2.
//  Copyright © 2017年 刘茜童. All rights reserved.
//

#import "UIFont+CustomFont.h"
#import <objc/runtime.h>

@implementation UIFont (CustomFont)

+(void)load{
    
    [super load];
    //只执行一次这个方法
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        // When swizzling a class method, use the following:
        // Class class = object_getClass((id)self);
        
//        
//        + (UIFont *)systemFontOfSize:(CGFloat)fontSize;
//        + (UIFont *)boldSystemFontOfSize:(CGFloat)fontSize;
//        + (UIFont *)italicSystemFontOfSize:(CGFloat)fontSize;
        
        //替换三个方法
        SEL originalSelector = @selector(systemFontOfSize:);
        SEL originalSelector2 = @selector(boldSystemFontOfSize:);
        SEL originalSelector3 = @selector(italicSystemFontOfSize:);
        SEL swizzledSelector = @selector(QQsystemFontOfSize:);
        SEL swizzledSelector2 = @selector(QQboldSystemFontOfSize:);
        SEL swizzledSelector3 = @selector(QQitalicSystemFontOfSize:);
        
        
        Method originalMethod = class_getClassMethod(class, originalSelector);
        Method originalMethod2 = class_getClassMethod(class, originalSelector2);
        Method originalMethod3 = class_getClassMethod(class, originalSelector3);
        Method swizzledMethod = class_getClassMethod(class, swizzledSelector);
        Method swizzledMethod2 = class_getClassMethod(class, swizzledSelector2);
        Method swizzledMethod3 = class_getClassMethod(class, swizzledSelector3);
        
        method_exchangeImplementations(originalMethod, swizzledMethod);
        method_exchangeImplementations(originalMethod2, swizzledMethod2);
        method_exchangeImplementations(originalMethod3, swizzledMethod3);
    });
    
}
/**
 *在这些方法中将你的字体名字换进去    FZZJ-ZSCWBJW
 */
+(UIFont *)QQsystemFontOfSize:(CGFloat)fontSize {
    UIFont * font = [UIFont fontWithName:@"FZZJ-ZSCWBJW" size:fontSize];
    if (!font) {
        return [self QQsystemFontOfSize:fontSize];
    }
    return font;
}

+(UIFont *)QQboldSystemFontOfSize:(CGFloat)fontSize{
    UIFont * font = [UIFont fontWithName:@"FZZJ-ZSCWBJW" size:fontSize];
    if (!font) {
        return [self QQboldSystemFontOfSize:fontSize];
    }
    return font;
}
+(UIFont *)QQitalicSystemFontOfSize:(CGFloat)fontSize{
    UIFont * font = [UIFont fontWithName:@"FZZJ-ZSCWBJW" size:fontSize];
    if (!font) {
        return [self QQitalicSystemFontOfSize:fontSize];
    }
    return font;
}



@end
