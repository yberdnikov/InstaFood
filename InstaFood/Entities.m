//
//  Entities.m
//
//  Created by Daniel Quek on 22/10/12
//  Copyright (c) 2012 Cellcity. All rights reserved.
//

#import "Entities.h"
#import "DescriptionClass.h"
#import "Urls.h"
#import "Url.h"
#import "Hashtags.h"


@implementation Entities

@synthesize entitiesDescription = _entitiesDescription;
@synthesize user_mentions = _user_mentions;
@synthesize urls = _urls;
@synthesize url = _url;
@synthesize hashtags = _hashtags;


+ (Entities *)modelObjectWithDictionary:(NSDictionary *)dict
{
    Entities *instance = [[Entities alloc] initWithDictionary:dict];
    return instance;
}

- (id)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.entitiesDescription = [DescriptionClass modelObjectWithDictionary:[dict objectForKey:@"description"]];
            self.user_mentions = [dict objectForKey:@"user_mentions"];
    NSObject *receivedUrls = [dict objectForKey:@"urls"];
    NSMutableArray *parsedUrls = [NSMutableArray array];
    if ([receivedUrls isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedUrls) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedUrls addObject:[Urls modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedUrls isKindOfClass:[NSDictionary class]]) {
       [parsedUrls addObject:[Urls modelObjectWithDictionary:(NSDictionary *)receivedUrls]];
    }

    self.urls = [NSArray arrayWithArray:parsedUrls];
            self.url = [Url modelObjectWithDictionary:[dict objectForKey:@"url"]];
    NSObject *receivedHashtags = [dict objectForKey:@"hashtags"];
    NSMutableArray *parsedHashtags = [NSMutableArray array];
    if ([receivedHashtags isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedHashtags) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedHashtags addObject:[Hashtags modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedHashtags isKindOfClass:[NSDictionary class]]) {
       [parsedHashtags addObject:[Hashtags modelObjectWithDictionary:(NSDictionary *)receivedHashtags]];
    }

    self.hashtags = [NSArray arrayWithArray:parsedHashtags];

    }
    
    return self;
    
}

#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.entitiesDescription = [aDecoder decodeObjectForKey:@"entitiesDescription"];
    self.user_mentions = [aDecoder decodeObjectForKey:@"user_mentions"];
    self.urls = [aDecoder decodeObjectForKey:@"urls"];
    self.url = [aDecoder decodeObjectForKey:@"url"];
    self.hashtags = [aDecoder decodeObjectForKey:@"hashtags"];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_entitiesDescription forKey:@"entitiesDescription"];
    [aCoder encodeObject:_user_mentions forKey:@"user_mentions"];
    [aCoder encodeObject:_urls forKey:@"urls"];
    [aCoder encodeObject:_url forKey:@"url"];
    [aCoder encodeObject:_hashtags forKey:@"hashtags"];
}


@end
