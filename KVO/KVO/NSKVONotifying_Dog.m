//
//  NSKVONotifying_Dog.m
//  KVO
//
//  Created by wdwk on 2017/5/26.
//  Copyright © 2017年 wksc. All rights reserved.
//

#import "NSKVONotifying_Dog.h"

@implementation NSKVONotifying_Dog
-(void)setAge:(int)age{
    [super setAge:age];
    
    //在子类中调用两个方面；这两个方法会触发监听者的observeValueForKeyPath
    [self willChangeValueForKey:@"age"];//旧值
    [self didChangeValueForKey:@"age"];//新值；
}
@end
