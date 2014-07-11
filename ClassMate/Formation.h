//
//  Formation.h
//  ClassMate
//
//  Created by Florian BUREL on 11/07/2014.
//  Copyright (c) 2014 florian burel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Formation : NSObject

@property (strong, nonatomic) NSString * identifier;
@property (strong, nonatomic) NSString * title;
@property (assign, nonatomic) BOOL entitledToUser;
@property (strong, nonatomic) NSString * teacherName;
@property (assign, nonatomic) int numberOfSessions;

@end
