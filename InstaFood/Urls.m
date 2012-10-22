//
//  Urls.m
//
//  Created by Daniel Quek on 22/10/12
//  Copyright (c) 2012 Cellcity. All rights reserved.
//

#import "Urls.h"


@implementation Urls

@synthesize display_url = _display_url;
@synthesize url = _url;
@synthesize indices = _indices;
@synthesize expanded_url = _expanded_url;


+ (Urls *)modelObjectWithDictionary:(NSDictionary *)dict
{
    Urls *instance = [[Urls alloc] initWithDictionary:dict];
    return instance;
}

- (id)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.display_url = [dict objectForKey:@"display_url"];
            self.url = [dict objectForKey:@"url"];
            self.indices = [dict objectForKey:@"indices"];
            self.expanded_url = [dict objectForKey:@"expanded_url"];
    }
    
    return self;
    
}

#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.display_url = [aDecoder decodeObjectForKey:@"display_url"];
    self.url = [aDecoder decodeObjectForKey:@"url"];
    self.indices = [aDecoder decodeObjectForKey:@"indices"];
    self.expanded_url = [aDecoder decodeObjectForKey:@"expanded_url"];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_display_url forKey:@"display_url"];
    [aCoder encodeObject:_url forKey:@"url"];
    [aCoder encodeObject:_indices forKey:@"indices"];
    [aCoder encodeObject:_expanded_url forKey:@"expanded_url"];
}


@end
