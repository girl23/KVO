//
//  NSObject+KVO.m
//  KVO
//
//  Created by wdwk on 2017/6/12.
//  Copyright © 2017年 wksc. All rights reserved.
//

#import "NSObject+KVO.h"
#import <objc/runtime.h>
#import "Person.h"
@implementation NSObject (KVO)
- (void)ZL_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(nullable void *)context{
    
//    1、获取类名：
    NSString *oldClassName=NSStringFromClass([self class]);
    
//    2、新类的名字,苹果动态生成类的名字NSKVO_Person，这里我们自己拼接
    NSString * newClassName=[@"ZLKVO_" stringByAppendingString:oldClassName];
    const char *name=[newClassName UTF8String];
//    动态创建一个类,继承自调用者
    Class  MyClass= objc_allocateClassPair([self class],name, 0);
    //添加方法,方法是通过isa来查找，当isa无法查找到的时候，他就会往你的父类查找，
    class_addMethod(MyClass, @selector(setName:),(IMP)setName, "V@:@");
    
//  注册这个类
    objc_registerClassPair(MyClass);
    
    //改变isa指针，让指针指向新的MyClass类；
    object_setClass(self, MyClass);
    
    
    
}
void setName(id self,SEL _cmd,NSString * newName){
    NSLog(@"我监听到了");
}

@end
