//
//  TweetObject.m
//
//  Created by Daniel Quek on 22/10/12
//  Copyright (c) 2012 Cellcity. All rights reserved.
//

#import "TweetObject.h"
#import "SearchMetadata.h"
#import "Statuses.h"


@implementation TweetObject

@synthesize search_metadata = _search_metadata;
@synthesize statuses = _statuses;


+ (TweetObject *)modelObjectWithDictionary:(NSDictionary *)dict
{
    TweetObject *instance = [[TweetObject alloc] initWithDictionary:dict];
    return instance;
}

- (id)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.search_metadata = [SearchMetadata modelObjectWithDictionary:[dict objectForKey:@"search_metadata"]];
    NSObject *receivedStatuses = [dict objectForKey:@"statuses"];
    NSMutableArray *parsedStatuses = [NSMutableArray array];
    if ([receivedStatuses isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedStatuses) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedStatuses addObject:[Statuses modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedStatuses isKindOfClass:[NSDictionary class]]) {
       [parsedStatuses addObject:[Statuses modelObjectWithDictionary:(NSDictionary *)receivedStatuses]];
    }

    self.statuses = [NSArray arrayWithArray:parsedStatuses];

    }
    
    return self;
    
}

#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.search_metadata = [aDecoder decodeObjectForKey:@"search_metadata"];
    self.statuses = [aDecoder decodeObjectForKey:@"statuses"];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_search_metadata forKey:@"search_metadata"];
    [aCoder encodeObject:_statuses forKey:@"statuses"];
}


@end
