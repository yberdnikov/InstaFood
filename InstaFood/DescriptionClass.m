//
//  DescriptionClass.m
//
//  Created by Daniel Quek on 22/10/12
//  Copyright (c) 2012 Cellcity. All rights reserved.
//

#import "DescriptionClass.h"


@implementation DescriptionClass

@synthesize urls = _urls;


+ (DescriptionClass *)modelObjectWithDictionary:(NSDictionary *)dict
{
    DescriptionClass *instance = [[DescriptionClass alloc] initWithDictionary:dict];
    return instance;
}

- (id)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.urls = [dict objectForKey:@"urls"];

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
