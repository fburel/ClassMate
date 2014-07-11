//
//  ConnectionManager.m
//  ClassMate
//
//  Created by Florian BUREL on 11/07/2014.
//  Copyright (c) 2014 florian burel. All rights reserved.
//

#import "ConnectionManager.h"

#import <Parse/Parse.h>

@implementation ConnectionManager

+ (instancetype)sharedInstance {
    static id __SharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __SharedInstance = [[self alloc] init];
    });
    return __SharedInstance;
}


- (instancetype)init
{
    self = [super init];
    if (self) {
        [Parse setApplicationId:@"udvpsmwE9uvn07NGKTF3kq8J31mRUeLOyhFIVwht"
                      clientKey:@"WtoG6NxjLmDKxRiTJ6lOlePbLuRXWy56ON36MMep"];
    }
    return self;
}


#pragma mark - User

- (void)performLoginWithUserName:(NSString *)username andPassword:(NSString *)password completion:(LoginResponseBlock)completion
{
    
    [PFUser logInWithUsernameInBackground:username
                                 password:password
                                    block:^(PFUser *user, NSError *error)
    {
        if(error)
        {
            completion(NO, nil);
        }
        else
        {
            completion(YES, user.objectId);
        }
    }];
    
}

#pragma mark - Requests

- (void)fetchFormationsForUser:(User *)user completion:(FetchResponseBlock)completion
{
    PFQuery * currentUser = [PFQuery queryWithClassName:@"_User"];
    [currentUser whereKey:@"objectId" equalTo:user.identifer];
    
    PFQuery * inscriptions = [PFQuery queryWithClassName:@"Inscription"];
    [inscriptions whereKey:@"user" matchesQuery:currentUser];
    [inscriptions includeKey:@"formation"];
    
    
    
    [inscriptions findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error)
    {
        if(error)
        {
            completion(error, nil);
        }
        else
        {
            NSMutableArray * list = [NSMutableArray new];
            
            for(PFObject * inscription in objects)
            {
                PFObject * formation =  inscription[@"formation"];
                
                Formation * f = [Formation new];
                f.title = formation[@"Title"];
                f.identifier = formation.objectId;
                f.entitledToUser = YES;
                
                [list addObject:f];
            }
            
            completion(nil, [list copy]);
        }
    }];
}

@end










