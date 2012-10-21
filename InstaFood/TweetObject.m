//
//  TweetObject.m
//
//  Created by Daniel Quek on 21/10/12
//  Copyright (c) 2012 Cellcity. All rights reserved.
//

#import "TweetObject.h"
#import "Results.h"


@implementation TweetObject

@synthesize max_id = _max_id;
@synthesize since_id = _since_id;
@synthesize since_id_str = _since_id_str;
@synthesize results_per_page = _results_per_page;
@synthesize refresh_url = _refresh_url;
@synthesize max_id_str = _max_id_str;
@synthesize query = _query;
@synthesize results = _results;
@synthesize next_page = _next_page;
@synthesize page = _page;
@synthesize completed_in = _completed_in;


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
            self.max_id = [[dict objectForKey:@"max_id"] intValue];
            self.since_id = [[dict objectForKey:@"since_id"] intValue];
            self.since_id_str = [dict objectForKey:@"since_id_str"];
            self.results_per_page = [[dict objectForKey:@"results_per_page"] intValue];
            self.refresh_url = [dict objectForKey:@"refresh_url"];
            self.max_id_str = [dict objectForKey:@"max_id_str"];
            self.query = [dict objectForKey:@"query"];
    NSObject *receivedResults = [dict objectForKey:@"results"];
    NSMutableArray *parsedResults = [NSMutableArray array];
    if ([receivedResults isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedResults) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedResults addObject:[Results modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedResults isKindOfClass:[NSDictionary class]]) {
       [parsedResults addObject:[Results modelObjectWithDictionary:(NSDictionary *)receivedResults]];
    }

    self.results = [NSArray arrayWithArray:parsedResults];
            self.next_page = [dict objectForKey:@"next_page"];
            self.page = [[dict objectForKey:@"page"] intValue];
            self.completed_in = [[dict objectForKey:@"completed_in"] intValue];

    }
    
    return self;
    
}

#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.max_id = [aDecoder decodeIntegerForKey:@"max_id"];
    self.since_id = [aDecoder decodeIntegerForKey:@"since_id"];
    self.since_id_str = [aDecoder decodeObjectForKey:@"since_id_str"];
    self.results_per_page = [aDecoder decodeIntegerForKey:@"results_per_page"];
    self.refresh_url = [aDecoder decodeObjectForKey:@"refresh_url"];
    self.max_id_str = [aDecoder decodeObjectForKey:@"max_id_str"];
    self.query = [aDecoder decodeObjectForKey:@"query"];
    self.results = [aDecoder decodeObjectForKey:@"results"];
    self.next_page = [aDecoder decodeObjectForKey:@"next_page"];
    self.page = [aDecoder decodeIntegerForKey:@"page"];
    self.completed_in = [aDecoder decodeIntegerForKey:@"completed_in"];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeInteger:_max_id forKey:@"max_id"];
    [aCoder encodeInteger:_since_id forKey:@"since_id"];
    [aCoder encodeObject:_since_id_str forKey:@"since_id_str"];
    [aCoder encodeInteger:_results_per_page forKey:@"results_per_page"];
    [aCoder encodeObject:_refresh_url forKey:@"refresh_url"];
    [aCoder encodeObject:_max_id_str forKey:@"max_id_str"];
    [aCoder encodeObject:_query forKey:@"query"];
    [aCoder encodeObject:_results forKey:@"results"];
    [aCoder encodeObject:_next_page forKey:@"next_page"];
    [aCoder encodeInteger:_page forKey:@"page"];
    [aCoder encodeInteger:_completed_in forKey:@"completed_in"];
}


@end
