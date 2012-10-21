//
//  TwitterManager.h
//  XiaXue
//
//  Created by Daniel Quek on 23/4/12.
//  Copyright 2012 Daniel Quek. All rights reserved.
//	File created using Singleton XCode Template by Mugunth Kumar (http://blog.mugunthkumar.com)
//  More information about this template on the post http://mk.sg/89
//  Permission granted to do anything, commercial/non-commercial with this file apart from removing the line/URL above

#import <Foundation/Foundation.h>
#import <Accounts/Accounts.h>
#import <Social/Social.h>

typedef void(^SetupTwitter)(BOOL granted, BOOL hasTwitterAccount);
typedef void(^TwitterSearchFeed)(id feedData, NSError *error);


@interface TwitterManager : NSObject

@property (nonatomic, strong) ACAccountStore *accountStore;
@property (strong, nonatomic) ACAccount *userAccount;

+ (TwitterManager*) sharedInstance;

-(void)setUpTwitterAccountWithBlock:(SetupTwitter)block;
-(void)getTwitterFeedWithBlock:(TwitterSearchFeed)block;

@end
