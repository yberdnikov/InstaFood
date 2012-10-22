//
//  Statuses.h
//
//  Created by Daniel Quek on 22/10/12
//  Copyright (c) 2012 Cellcity. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Metadata, Entities, User;

@interface Statuses : NSObject <NSCoding>

@property (nonatomic, retain) NSString *place;
@property (nonatomic, retain) NSString *in_reply_to_user_id_str;
@property (nonatomic, retain) NSString *source;
@property (nonatomic, assign) BOOL truncated;
@property (nonatomic, retain) Metadata *metadata;
@property (nonatomic, assign) BOOL possibly_sensitive;
@property (nonatomic, retain) Entities *entities;
@property (nonatomic, retain) NSString *in_reply_to_screen_name;
@property (nonatomic, assign) NSInteger retweet_count;
@property (nonatomic, assign) BOOL favorited;
@property (nonatomic, retain) NSString *geo;
@property (nonatomic, assign) NSInteger statusesIdentifier;
@property (nonatomic, retain) User *user;
@property (nonatomic, retain) NSString *in_reply_to_user_id;
@property (nonatomic, assign) BOOL retweeted;
@property (nonatomic, retain) NSString *text;
@property (nonatomic, retain) NSString *created_at;
@property (nonatomic, retain) NSString *in_reply_to_status_id_str;
@property (nonatomic, retain) NSString *in_reply_to_status_id;
@property (nonatomic, retain) NSString *coordinates;
@property (nonatomic, retain) NSString *id_str;
@property (nonatomic, retain) NSString *contributors;

+ (Statuses *)modelObjectWithDictionary:(NSDictionary *)dict;
- (id)initWithDictionary:(NSDictionary *)dict;

@end
