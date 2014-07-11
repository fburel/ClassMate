//
//  User.m
//  ClassMate
//
//  Created by Florian BUREL on 11/07/2014.
//  Copyright (c) 2014 florian burel. All rights reserved.
//

#import "User.h"

@implementation User


+ (instancetype)sharedInstance
{
    static id __SharedInstance;
    
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __SharedInstance = [[User alloc]init];
    });
    
    
    
    return __SharedInstance;
}

@end
