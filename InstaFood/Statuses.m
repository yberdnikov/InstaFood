//
//  Statuses.m
//
//  Created by Daniel Quek on 22/10/12
//  Copyright (c) 2012 Cellcity. All rights reserved.
//

#import "Statuses.h"
#import "Metadata.h"
#import "Entities.h"
#import "User.h"


@implementation Statuses

@synthesize place = _place;
@synthesize in_reply_to_user_id_str = _in_reply_to_user_id_str;
@synthesize source = _source;
@synthesize truncated = _truncated;
@synthesize metadata = _metadata;
@synthesize possibly_sensitive = _possibly_sensitive;
@synthesize entities = _entities;
@synthesize in_reply_to_screen_name = _in_reply_to_screen_name;
@synthesize retweet_count = _retweet_count;
@synthesize favorited = _favorited;
@synthesize geo = _geo;
@synthesize statusesIdentifier = _statusesIdentifier;
@synthesize user = _user;
@synthesize in_reply_to_user_id = _in_reply_to_user_id;
@synthesize retweeted = _retweeted;
@synthesize text = _text;
@synthesize created_at = _created_at;
@synthesize in_reply_to_status_id_str = _in_reply_to_status_id_str;
@synthesize in_reply_to_status_id = _in_reply_to_status_id;
@synthesize coordinates = _coordinates;
@synthesize id_str = _id_str;
@synthesize contributors = _contributors;


+ (Statuses *)modelObjectWithDictionary:(NSDictionary *)dict
{
    Statuses *instance = [[Statuses alloc] initWithDictionary:dict];
    return instance;
}

- (id)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.place = [dict objectForKey:@"place"];
            self.in_reply_to_user_id_str = [dict objectForKey:@"in_reply_to_user_id_str"];
            self.source = [dict objectForKey:@"source"];
            self.truncated = [[dict objectForKey:@"truncated"] boolValue];
            self.metadata = [Metadata modelObjectWithDictionary:[dict objectForKey:@"metadata"]];
            self.possibly_sensitive = [[dict objectForKey:@"possibly_sensitive"] boolValue];
            self.entities = [Entities modelObjectWithDictionary:[dict objectForKey:@"entities"]];
            self.in_reply_to_screen_name = [dict objectForKey:@"in_reply_to_screen_name"];
            self.retweet_count = [[dict objectForKey:@"retweet_count"] intValue];
            self.favorited = [[dict objectForKey:@"favorited"] boolValue];
            self.geo = [dict objectForKey:@"geo"];
            self.statusesIdentifier = [[dict objectForKey:@"id"] intValue];
            self.user = [User modelObjectWithDictionary:[dict objectForKey:@"user"]];
            self.in_reply_to_user_id = [dict objectForKey:@"in_reply_to_user_id"];
            self.retweeted = [[dict objectForKey:@"retweeted"] boolValue];
            self.text = [dict objectForKey:@"text"];
            self.created_at = [dict objectForKey:@"created_at"];
            self.in_reply_to_status_id_str = [dict objectForKey:@"in_reply_to_status_id_str"];
            self.in_reply_to_status_id = [dict objectForKey:@"in_reply_to_status_id"];
            self.coordinates = [dict objectForKey:@"coordinates"];
            self.id_str = [dict objectForKey:@"id_str"];
            self.contributors = [dict objectForKey:@"contributors"];

    }
    
    return self;
    
}

#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.place = [aDecoder decodeObjectForKey:@"place"];
    self.in_reply_to_user_id_str = [aDecoder decodeObjectForKey:@"in_reply_to_user_id_str"];
    self.source = [aDecoder decodeObjectForKey:@"source"];
    self.truncated = [aDecoder decodeBoolForKey:@"truncated"];
    self.metadata = [aDecoder decodeObjectForKey:@"metadata"];
    self.possibly_sensitive = [aDecoder decodeBoolForKey:@"possibly_sensitive"];
    self.entities = [aDecoder decodeObjectForKey:@"entities"];
    self.in_reply_to_screen_name = [aDecoder decodeObjectForKey:@"in_reply_to_screen_name"];
    self.retweet_count = [aDecoder decodeIntegerForKey:@"retweet_count"];
    self.favorited = [aDecoder decodeBoolForKey:@"favorited"];
    self.geo = [aDecoder decodeObjectForKey:@"geo"];
    self.statusesIdentifier = [aDecoder decodeIntegerForKey:@"statusesIdentifier"];
    self.user = [aDecoder decodeObjectForKey:@"user"];
    self.in_reply_to_user_id = [aDecoder decodeObjectForKey:@"in_reply_to_user_id"];
    self.retweeted = [aDecoder decodeBoolForKey:@"retweeted"];
    self.text = [aDecoder decodeObjectForKey:@"text"];
    self.created_at = [aDecoder decodeObjectForKey:@"created_at"];
    self.in_reply_to_status_id_str = [aDecoder decodeObjectForKey:@"in_reply_to_status_id_str"];
    self.in_reply_to_status_id = [aDecoder decodeObjectForKey:@"in_reply_to_status_id"];
    self.coordinates = [aDecoder decodeObjectForKey:@"coordinates"];
    self.id_str = [aDecoder decodeObjectForKey:@"id_str"];
    self.contributors = [aDecoder decodeObjectForKey:@"contributors"];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_place forKey:@"place"];
    [aCoder encodeObject:_in_reply_to_user_id_str forKey:@"in_reply_to_user_id_str"];
    [aCoder encodeObject:_source forKey:@"source"];
    [aCoder encodeBool:_truncated forKey:@"truncated"];
    [aCoder encodeObject:_metadata forKey:@"metadata"];
    [aCoder encodeBool:_possibly_sensitive forKey:@"possibly_sensitive"];
    [aCoder encodeObject:_entities forKey:@"entities"];
    [aCoder encodeObject:_in_reply_to_screen_name forKey:@"in_reply_to_screen_name"];
    [aCoder encodeInteger:_retweet_count forKey:@"retweet_count"];
    [aCoder encodeBool:_favorited forKey:@"favorited"];
    [aCoder encodeObject:_geo forKey:@"geo"];
    [aCoder encodeInteger:_statusesIdentifier forKey:@"statusesIdentifier"];
    [aCoder encodeObject:_user forKey:@"user"];
    [aCoder encodeObject:_in_reply_to_user_id forKey:@"in_reply_to_user_id"];
    [aCoder encodeBool:_retweeted forKey:@"retweeted"];
    [aCoder encodeObject:_text forKey:@"text"];
    [aCoder encodeObject:_created_at forKey:@"created_at"];
    [aCoder encodeObject:_in_reply_to_status_id_str forKey:@"in_reply_to_status_id_str"];
    [aCoder encodeObject:_in_reply_to_status_id forKey:@"in_reply_to_status_id"];
    [aCoder encodeObject:_coordinates forKey:@"coordinates"];
    [aCoder encodeObject:_id_str forKey:@"id_str"];
    [aCoder encodeObject:_contributors forKey:@"contributors"];
}


@end
