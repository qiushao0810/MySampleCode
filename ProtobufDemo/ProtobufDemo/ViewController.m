//
//  ViewController.m
//  ProtobufDemo
//
//  Created by yingqiu huang on 2016/12/6.
//  Copyright © 2016年 yingqiu huang. All rights reserved.
//

#import "ViewController.h"
#import "Person.pbobjc.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    Person *person = [[Person alloc] init];
    person.age = 22;
    person.name = @"huangyingqiu";
    person.phone = @"110";
    
    NSData *data = [person data];
    Person *p = [Person parseFromData:data error:nil];
    NSLog(@"person---%@",p);
}


@end
