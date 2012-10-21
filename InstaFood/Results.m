//
//  Results.m
//
//  Created by Daniel Quek on 21/10/12
//  Copyright (c) 2012 Cellcity. All rights reserved.
//

#import "Results.h"
#import "Metadata.h"


@implementation Results

@synthesize resultsIdentifier = _resultsIdentifier;
@synthesize id_str = _id_str;
@synthesize to_user_id = _to_user_id;
@synthesize from_user_name = _from_user_name;
@synthesize created_at = _created_at;
@synthesize from_user_id_str = _from_user_id_str;
@synthesize metadata = _metadata;
@synthesize profile_image_url_https = _profile_image_url_https;
@synthesize source = _source;
@synthesize from_user_id = _from_user_id;
@synthesize profile_image_url = _profile_image_url;
@synthesize geo = _geo;
@synthesize to_user = _to_user;
@synthesize text = _text;
@synthesize from_user = _from_user;
@synthesize iso_language_code = _iso_language_code;
@synthesize to_user_id_str = _to_user_id_str;
@synthesize to_user_name = _to_user_name;


+ (Results *)modelObjectWithDictionary:(NSDictionary *)dict
{
    Results *instance = [[Results alloc] initWithDictionary:dict];
    return instance;
}

- (id)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.resultsIdentifier = [[dict objectForKey:@"id"] intValue];
            self.id_str = [dict objectForKey:@"id_str"];
            self.to_user_id = [[dict objectForKey:@"to_user_id"] intValue];
            self.from_user_name = [dict objectForKey:@"from_user_name"];
            self.created_at = [dict objectForKey:@"created_at"];
            self.from_user_id_str = [dict objectForKey:@"from_user_id_str"];
            self.metadata = [Metadata modelObjectWithDictionary:[dict objectForKey:@"metadata"]];
            self.profile_image_url_https = [dict objectForKey:@"profile_image_url_https"];
            self.source = [dict objectForKey:@"source"];
            self.from_user_id = [[dict objectForKey:@"from_user_id"] intValue];
            self.profile_image_url = [dict objectForKey:@"profile_image_url"];
            self.geo = [dict objectForKey:@"geo"];
            self.to_user = [dict objectForKey:@"to_user"];
            self.text = [dict objectForKey:@"text"];
            self.from_user = [dict objectForKey:@"from_user"];
            self.iso_language_code = [dict objectForKey:@"iso_language_code"];
            self.to_user_id_str = [dict objectForKey:@"to_user_id_str"];
            self.to_user_name = [dict objectForKey:@"to_user_name"];

    }
    
    return self;
    
}

#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.resultsIdentifier = [aDecoder decodeIntegerForKey:@"resultsIdentifier"];
    self.id_str = [aDecoder decodeObjectForKey:@"id_str"];
    self.to_user_id = [aDecoder decodeIntegerForKey:@"to_user_id"];
    self.from_user_name = [aDecoder decodeObjectForKey:@"from_user_name"];
    self.created_at = [aDecoder decodeObjectForKey:@"created_at"];
    self.from_user_id_str = [aDecoder decodeObjectForKey:@"from_user_id_str"];
    self.metadata = [aDecoder decodeObjectForKey:@"metadata"];
    self.profile_image_url_https = [aDecoder decodeObjectForKey:@"profile_image_url_https"];
    self.source = [aDecoder decodeObjectForKey:@"source"];
    self.from_user_id = [aDecoder decodeIntegerForKey:@"from_user_id"];
    self.profile_image_url = [aDecoder decodeObjectForKey:@"profile_image_url"];
    self.geo = [aDecoder decodeObjectForKey:@"geo"];
    self.to_user = [aDecoder decodeObjectForKey:@"to_user"];
    self.text = [aDecoder decodeObjectForKey:@"text"];
    self.from_user = [aDecoder decodeObjectForKey:@"from_user"];
    self.iso_language_code = [aDecoder decodeObjectForKey:@"iso_language_code"];
    self.to_user_id_str = [aDecoder decodeObjectForKey:@"to_user_id_str"];
    self.to_user_name = [aDecoder decodeObjectForKey:@"to_user_name"];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeInteger:_resultsIdentifier forKey:@"resultsIdentifier"];
    [aCoder encodeObject:_id_str forKey:@"id_str"];
    [aCoder encodeInteger:_to_user_id forKey:@"to_user_id"];
    [aCoder encodeObject:_from_user_name forKey:@"from_user_name"];
    [aCoder encodeObject:_created_at forKey:@"created_at"];
    [aCoder encodeObject:_from_user_id_str forKey:@"from_user_id_str"];
    [aCoder encodeObject:_metadata forKey:@"metadata"];
    [aCoder encodeObject:_profile_image_url_https forKey:@"profile_image_url_https"];
    [aCoder encodeObject:_source forKey:@"source"];
    [aCoder encodeInteger:_from_user_id forKey:@"from_user_id"];
    [aCoder encodeObject:_profile_image_url forKey:@"profile_image_url"];
    [aCoder encodeObject:_geo forKey:@"geo"];
    [aCoder encodeObject:_to_user forKey:@"to_user"];
    [aCoder encodeObject:_text forKey:@"text"];
    [aCoder encodeObject:_from_user forKey:@"from_user"];
    [aCoder encodeObject:_iso_language_code forKey:@"iso_language_code"];
    [aCoder encodeObject:_to_user_id_str forKey:@"to_user_id_str"];
    [aCoder encodeObject:_to_user_name forKey:@"to_user_name"];
}


@end
