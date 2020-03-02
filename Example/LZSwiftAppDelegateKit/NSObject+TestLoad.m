//
//  NSObject+TestLoad.m
//  LZSwiftAppDelegateKit_Example
//
//  Created by Sun Moon on 2020/3/2.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

#import "NSObject+TestLoad.h"

@implementation NSObject (TestLoad)

+ (void)load {
    [self lz_swiftLoad];
}

//+ (void)initialize {
//    [self lz_swiftInitialize];
//}

@end
