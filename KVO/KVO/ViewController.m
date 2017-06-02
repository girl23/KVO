//
//  ViewController.m
//  KVO
//
//  Created by wdwk on 2017/5/26.
//  Copyright © 2017年 wksc. All rights reserved.
//

#import "ViewController.h"
#import "Dog.h"
#import "NSKVONotifying_Dog.h"
@interface ViewController ()

@property(nonatomic, strong)Dog *d;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.d=[NSKVONotifying_Dog new];
    [self.d addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionNew context:nil];
}
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    NSLog(@"%@=%@=%@",keyPath,object,change);
}
//isa指针，指向它的真实指针；
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.d.age=99;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
