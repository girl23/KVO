//
//  NSObject+KVO.h
//  KVO
//
//  Created by wdwk on 2017/6/12.
//  Copyright © 2017年 wksc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (KVO)
- (void)ZL_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(nullable void *)context;
@end
