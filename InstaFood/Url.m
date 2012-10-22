//
//  Url.m
//
//  Created by Daniel Quek on 22/10/12
//  Copyright (c) 2012 Cellcity. All rights reserved.
//

#import "Url.h"
#import "Urls.h"


@implementation Url

@synthesize urls = _urls;


+ (Url *)modelObjectWithDictionary:(NSDictionary *)dict
{
    Url *instance = [[Url alloc] initWithDictionary:dict];
    return instance;
}

- (id)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
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

    }
    
    return self;
    
}

#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.urls = [aDecoder decodeObjectForKey:@"urls"];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_urls forKey:@"urls"];
}


@end
