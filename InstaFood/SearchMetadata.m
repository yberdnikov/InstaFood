//
//  SearchMetadata.m
//
//  Created by Daniel Quek on 22/10/12
//  Copyright (c) 2012 Cellcity. All rights reserved.
//

#import "SearchMetadata.h"


@implementation SearchMetadata

@synthesize max_id = _max_id;
@synthesize since_id = _since_id;
@synthesize since_id_str = _since_id_str;
@synthesize refresh_url = _refresh_url;
@synthesize max_id_str = _max_id_str;
@synthesize count = _count;
@synthesize query = _query;
@synthesize next_results = _next_results;
@synthesize completed_in = _completed_in;


+ (SearchMetadata *)modelObjectWithDictionary:(NSDictionary *)dict
{
    SearchMetadata *instance = [[SearchMetadata alloc] initWithDictionary:dict];
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
            self.refresh_url = [dict objectForKey:@"refresh_url"];
            self.max_id_str = [dict objectForKey:@"max_id_str"];
            self.count = [[dict objectForKey:@"count"] intValue];
            self.query = [dict objectForKey:@"query"];
            self.next_results = [dict objectForKey:@"next_results"];
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
    self.refresh_url = [aDecoder decodeObjectForKey:@"refresh_url"];
    self.max_id_str = [aDecoder decodeObjectForKey:@"max_id_str"];
    self.count = [aDecoder decodeIntegerForKey:@"count"];
    self.query = [aDecoder decodeObjectForKey:@"query"];
    self.next_results = [aDecoder decodeObjectForKey:@"next_results"];
    self.completed_in = [aDecoder decodeIntegerForKey:@"completed_in"];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeInteger:_max_id forKey:@"max_id"];
    [aCoder encodeInteger:_since_id forKey:@"since_id"];
    [aCoder encodeObject:_since_id_str forKey:@"since_id_str"];
    [aCoder encodeObject:_refresh_url forKey:@"refresh_url"];
    [aCoder encodeObject:_max_id_str forKey:@"max_id_str"];
    [aCoder encodeInteger:_count forKey:@"count"];
    [aCoder encodeObject:_query forKey:@"query"];
    [aCoder encodeObject:_next_results forKey:@"next_results"];
    [aCoder encodeInteger:_completed_in forKey:@"completed_in"];
}


@end
