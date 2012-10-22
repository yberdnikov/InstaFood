//
//  Metadata.m
//
//  Created by Daniel Quek on 22/10/12
//  Copyright (c) 2012 Cellcity. All rights reserved.
//

#import "Metadata.h"


@implementation Metadata

@synthesize iso_language_code = _iso_language_code;
@synthesize result_type = _result_type;


+ (Metadata *)modelObjectWithDictionary:(NSDictionary *)dict
{
    Metadata *instance = [[Metadata alloc] initWithDictionary:dict];
    return instance;
}

- (id)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.iso_language_code = [dict objectForKey:@"iso_language_code"];
            self.result_type = [dict objectForKey:@"result_type"];

    }
    
    return self;
    
}

#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.iso_language_code = [aDecoder decodeObjectForKey:@"iso_language_code"];
    self.result_type = [aDecoder decodeObjectForKey:@"result_type"];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_iso_language_code forKey:@"iso_language_code"];
    [aCoder encodeObject:_result_type forKey:@"result_type"];
}


@end
