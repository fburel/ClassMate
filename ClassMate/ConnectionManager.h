//
//  ConnectionManager.h
//  ClassMate
//
//  Created by Florian BUREL on 11/07/2014.
//  Copyright (c) 2014 florian burel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
#import "Formation.h"


@interface ConnectionManager : NSObject

+ (instancetype) sharedInstance;

// Authentification

typedef void(^LoginResponseBlock)(BOOL success, NSString * userID);

- (void) performLoginWithUserName:(NSString *)username andPassword:(NSString *)password completion:(LoginResponseBlock)completion;

// Recuperation des données
typedef void(^FetchResponseBlock)(NSError * error, NSArray * results);

- (void) fetchFormationsForUser:(User *)user completion:(FetchResponseBlock)completion;


@end
