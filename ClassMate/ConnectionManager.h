//
//  ConnectionManager.h
//  ClassMate
//
//  Created by Florian BUREL on 11/07/2014.
//  Copyright (c) 2014 florian burel. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ConnectionManager : NSObject

+ (instancetype) sharedInstance;

typedef void(^LoginResponseBlock)(BOOL success, NSString * userID);

- (void) performLoginWithUserName:(NSString *)username andPassword:(NSString *)password completion:(LoginResponseBlock)completion;


@end
