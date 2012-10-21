//
//  TwitterManager.m
//  XiaXue
//
//  Created by Daniel Quek on 23/4/12.
//  Copyright 2012 Daniel Quek. All rights reserved.
//	File created using Singleton XCode Template by Mugunth Kumar (http://blog.mugunthkumar.com)
//  More information about this template on the post http://mk.sg/89	
//  Permission granted to do anything, commercial/non-commercial with this file apart from removing the line/URL above

#import "TwitterManager.h"

#define kTwitterSearch @"http://search.twitter.com/search.json"

@implementation TwitterManager

#pragma mark -
#pragma mark Singleton Methods

@synthesize accountStore = _accountStore;
@synthesize userAccount = _userAccount;

+ (TwitterManager*)sharedInstance {

	static TwitterManager *_sharedInstance;
	if(!_sharedInstance) {
		static dispatch_once_t oncePredicate;
		dispatch_once(&oncePredicate, ^{
			_sharedInstance = [[super allocWithZone:nil] init];
			});
		}

		return _sharedInstance;
}

+ (id)allocWithZone:(NSZone *)zone {	

	return [self sharedInstance];
}


- (id)copyWithZone:(NSZone *)zone {
	return self;	
}


#pragma mark -
#pragma mark Custom Methods

-(void)setUpTwitterAccountWithBlock:(SetupTwitter)block
{
    self.accountStore = [[ACAccountStore alloc]init];
    ACAccountType *twitterType = [self.accountStore accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTwitter];
    
    [self.accountStore requestAccessToAccountsWithType:twitterType options:nil completion:^(BOOL granted, NSError *error) {
        if (granted) {
            NSArray *twitterAccounts = [self.accountStore accountsWithAccountType:twitterType];
            if ([twitterAccounts count]) {
                self.userAccount = [twitterAccounts objectAtIndex:0];
                if (block) {
                    block(YES, YES);
                }
            }
            else
                if (block) {
                    block(YES, NO);
                }
        } else
            if (block) {
                block (NO, NO);
            }
    }];
}

-(void)getTwitterFeedWithBlock:(TwitterSearchFeed)block
{
    NSURL *feedURL = [NSURL URLWithString:kTwitterSearch];
    NSDictionary *parameters = @{@"q" : @"#InstaFood"};
    
    SLRequest *request = [SLRequest requestForServiceType:SLServiceTypeTwitter
                                            requestMethod:SLRequestMethodGET
                                                      URL:feedURL
                                               parameters:parameters];
    request.account = self.userAccount;
    
    [request performRequestWithHandler:^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error) {
        NSString *response = [NSJSONSerialization JSONObjectWithData:responseData options:kNilOptions error:&error];
        
        if (block) {
            block(response, error);
        }
    }];

}


@end
