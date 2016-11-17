//
//  DemoVC14.m
//  BABaseProject
//
//  Created by 博爱 on 2016/11/17.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "DemoVC14.h"
#import "Dog.h"

@interface DemoVC14 ()

@end

@implementation DemoVC14

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self test];
}

- (void)test
{
    Dog *dog = [Dog new];
    dog.age = 10;
    
    /*!
     使用 @property 声明了成员变量 age ，没有自己去写它的set方法和get方法，系统会自动给你生成。同时生成一个下划线成员变量 _age
     */
    /*! 直接调用点语法，没有set方法：你调用的时候，赋值的值是多少就是多少 */
    NSLog(@"dog 的 age : %ld", (long)dog.age);
    
    /*!
     如果你自己写了 _age2 的 set 方法，却没有在里面做任何操作，会默认调用 _age2。所有的成员变量初始值都是0, 所以即便你在调用 set 方法的时候赋值，打印出来也是0
     */
    NSLog(@"dog 的 age2 : %ld", (long)dog.age2);
    
    /*!
     如果你自己写了 age3 的 get 方法，在里面 return 3。你在调用 get 方法的时候赋值，打印出来也是就是你get方法里面返回的值 3
     */
    NSLog(@"dog 的 age3 : %ld", (long)dog.age3);
    
    /*!
     如果你自己同时生成了set和get方法，那系统就不会生成下划线成员变量
     注意看断点处 生成的 _age, _age2, _age3 并没有 _age4
     */
    NSLog(@"dog 的 age4 : %ld", (long)dog.age4);
    
    /*! 看完这些，你的 set / get 语法有没有一点理解了？ */
}

@end
