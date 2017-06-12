//
//  ViewController.m
//  KVO
//
//  Created by wdwk on 2017/5/26.
//  Copyright © 2017年 wksc. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "NSObject+KVO.h"
@interface ViewController ()
@property(nonatomic, strong)Person *p;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.p=[Person new];
    [self.p ZL_addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:nil];
   
}
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    NSLog(@"%@=%@=%@",keyPath,object,change);
}
//isa指针，指向它的真实指针；
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    self.p.name=[NSString stringWithFormat:@"%d",arc4random_uniform(20)];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
