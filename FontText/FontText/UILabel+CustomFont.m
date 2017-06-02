//
//  UILabel+CustomFont.m
//  CCTVPoint
//
//  Created by Joe on 2017/6/1.
//  Copyright © 2017年 刘茜童. All rights reserved.
//

#import "UILabel+CustomFont.h"
#import <objc/runtime.h>

@implementation UILabel (CustomFont)

+(void)load{
    
    [super load];
    //只执行一次这个方法
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        // When swizzling a class method, use the following:
        // Class class = object_getClass((id)self);
        //替换三个方法
        SEL originalSelector = @selector(init);
        SEL originalSelector2 = @selector(initWithFrame:);
        SEL originalSelector3 = @selector(awakeFromNib);
        SEL swizzledSelector = @selector(CFInit);
        SEL swizzledSelector2 = @selector(CFInitWithFrame:);
        SEL swizzledSelector3 = @selector(CFAwakeFromNib);
        
        
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method originalMethod2 = class_getInstanceMethod(class, originalSelector2);
        Method originalMethod3 = class_getInstanceMethod(class, originalSelector3);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        Method swizzledMethod2 = class_getInstanceMethod(class, swizzledSelector2);
        Method swizzledMethod3 = class_getInstanceMethod(class, swizzledSelector3);
        BOOL didAddMethod =
        class_addMethod(class,
                        originalSelector,
                        method_getImplementation(swizzledMethod),
                        method_getTypeEncoding(swizzledMethod));
        BOOL didAddMethod2 =
        class_addMethod(class,
                        originalSelector2,
                        method_getImplementation(swizzledMethod2),
                        method_getTypeEncoding(swizzledMethod2));
        BOOL didAddMethod3 =
        class_addMethod(class,
                        originalSelector3,
                        method_getImplementation(swizzledMethod3),
                        method_getTypeEncoding(swizzledMethod3));
        
        if (didAddMethod) {
            class_replaceMethod(class,
                                swizzledSelector,
                                method_getImplementation(originalMethod),
                                method_getTypeEncoding(originalMethod));
            
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
        if (didAddMethod2) {
            class_replaceMethod(class,
                                swizzledSelector2,
                                method_getImplementation(originalMethod2),
                                method_getTypeEncoding(originalMethod2));
        }else {
            method_exchangeImplementations(originalMethod2, swizzledMethod2);
        }
        if (didAddMethod3) {
            class_replaceMethod(class,
                                swizzledSelector3,
                                method_getImplementation(originalMethod3),
                                method_getTypeEncoding(originalMethod3));
        }else {
            method_exchangeImplementations(originalMethod3, swizzledMethod3);
        }
    });
    
}
/**
 *在这些方法中将你的字体名字换进去    FZZJ-ZSCWBJW
 */
- (instancetype)CFInit
{
    id __self = [self CFInit];
    UIFont * font = [UIFont fontWithName:@"FZZJ-ZSCWBJW" size:self.font.pointSize];
    if (font) {
        self.font=font;
    }
    return __self;
}

-(instancetype)CFInitWithFrame:(CGRect)rect{
    id __self = [self CFInitWithFrame:rect];
    UIFont * font = [UIFont fontWithName:@"FZZJ-ZSCWBJW" size:self.font.pointSize];
    if (font) {
        self.font=font;
    }
    return __self;
}
-(void)CFAwakeFromNib{
    [self CFAwakeFromNib];
    UIFont * font = [UIFont fontWithName:@"FZZJ-ZSCWBJW" size:self.font.pointSize];
    if (font) {
        self.font=font;
    }
    
}


@end


