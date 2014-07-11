//
//  User.h
//  ClassMate
//
//  Created by Florian BUREL on 11/07/2014.
//  Copyright (c) 2014 florian burel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

+ (instancetype) sharedInstance;

@property (strong, nonatomic) NSString * identifer;
@property (strong, nonatomic) NSString * userName;

@end
