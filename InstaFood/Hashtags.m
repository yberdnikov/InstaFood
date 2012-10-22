//
//  Hashtags.m
//
//  Created by Daniel Quek on 22/10/12
//  Copyright (c) 2012 Cellcity. All rights reserved.
//

#import "Hashtags.h"


@implementation Hashtags

@synthesize indices = _indices;
@synthesize text = _text;


+ (Hashtags *)modelObjectWithDictionary:(NSDictionary *)dict
{
    Hashtags *instance = [[Hashtags alloc] initWithDictionary:dict];
    return instance;
}

- (id)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.indices = [dict objectForKey:@"indices"];
            self.text = [dict objectForKey:@"text"];

    }
    
    return self;
    
}

#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.indices = [aDecoder decodeObjectForKey:@"indices"];
    self.text = [aDecoder decodeObjectForKey:@"text"];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_indices forKey:@"indices"];
    [aCoder encodeObject:_text forKey:@"text"];
}


@end
