//
//  User.m
//
//  Created by Daniel Quek on 22/10/12
//  Copyright (c) 2012 Cellcity. All rights reserved.
//

#import "User.h"
#import "Entities.h"


@implementation User

@synthesize protectedProperty = _protectedProperty;
@synthesize is_translator = _is_translator;
@synthesize profile_image_url = _profile_image_url;
@synthesize created_at = _created_at;
@synthesize userIdentifier = _userIdentifier;
@synthesize default_profile_image = _default_profile_image;
@synthesize listed_count = _listed_count;
@synthesize profile_background_color = _profile_background_color;
@synthesize follow_request_sent = _follow_request_sent;
@synthesize location = _location;
@synthesize lang = _lang;
@synthesize url = _url;
@synthesize entities = _entities;
@synthesize geo_enabled = _geo_enabled;
@synthesize followers_count = _followers_count;
@synthesize profile_text_color = _profile_text_color;
@synthesize show_all_inline_media = _show_all_inline_media;
@synthesize userDescription = _userDescription;
@synthesize statuses_count = _statuses_count;
@synthesize notifications = _notifications;
@synthesize following = _following;
@synthesize profile_background_tile = _profile_background_tile;
@synthesize profile_use_background_image = _profile_use_background_image;
@synthesize profile_sidebar_fill_color = _profile_sidebar_fill_color;
@synthesize profile_image_url_https = _profile_image_url_https;
@synthesize default_profile = _default_profile;
@synthesize name = _name;
@synthesize profile_sidebar_border_color = _profile_sidebar_border_color;
@synthesize contributors_enabled = _contributors_enabled;
@synthesize id_str = _id_str;
@synthesize profile_banner_url = _profile_banner_url;
@synthesize screen_name = _screen_name;
@synthesize time_zone = _time_zone;
@synthesize profile_background_image_url = _profile_background_image_url;
@synthesize profile_background_image_url_https = _profile_background_image_url_https;
@synthesize profile_link_color = _profile_link_color;
@synthesize favourites_count = _favourites_count;
@synthesize utc_offset = _utc_offset;
@synthesize friends_count = _friends_count;
@synthesize verified = _verified;


+ (User *)modelObjectWithDictionary:(NSDictionary *)dict
{
    User *instance = [[User alloc] initWithDictionary:dict];
    return instance;
}

- (id)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.protectedProperty = [[dict objectForKey:@"protected"] boolValue];
            self.is_translator = [[dict objectForKey:@"is_translator"] boolValue];
            self.profile_image_url = [dict objectForKey:@"profile_image_url"];
            self.created_at = [dict objectForKey:@"created_at"];
            self.userIdentifier = [[dict objectForKey:@"id"] intValue];
            self.default_profile_image = [[dict objectForKey:@"default_profile_image"] boolValue];
     
            if (![[dict objectForKey:@"listed_count"]isKindOfClass:[NSNull class]]) self.listed_count = [[dict objectForKey:@"listed_count"] intValue] ;
            self.profile_background_color = [dict objectForKey:@"profile_background_color"];
            self.follow_request_sent = [dict objectForKey:@"follow_request_sent"];
            self.location = [dict objectForKey:@"location"];
            self.lang = [dict objectForKey:@"lang"];
            self.url = [dict objectForKey:@"url"];
            self.entities = [Entities modelObjectWithDictionary:[dict objectForKey:@"entities"]];
            self.geo_enabled = [[dict objectForKey:@"geo_enabled"] boolValue];
            if (![[dict objectForKey:@"followers_count"]isKindOfClass:[NSNull class]]) self.followers_count = [[dict objectForKey:@"followers_count"] intValue];
            self.profile_text_color = [dict objectForKey:@"profile_text_color"];
            self.show_all_inline_media = [[dict objectForKey:@"show_all_inline_media"] boolValue];
            self.userDescription = [dict objectForKey:@"description"];
            if (![[dict objectForKey:@"statuses_count"]isKindOfClass:[NSNull class]]) self.statuses_count = [[dict objectForKey:@"statuses_count"] intValue];
            self.notifications = [dict objectForKey:@"notifications"];
            self.following = [dict objectForKey:@"following"];
            self.profile_background_tile = [[dict objectForKey:@"profile_background_tile"] boolValue];
            self.profile_use_background_image = [[dict objectForKey:@"profile_use_background_image"] boolValue];
            self.profile_sidebar_fill_color = [dict objectForKey:@"profile_sidebar_fill_color"];
            self.profile_image_url_https = [dict objectForKey:@"profile_image_url_https"];
            self.default_profile = [[dict objectForKey:@"default_profile"] boolValue];
            self.name = [dict objectForKey:@"name"];
            self.profile_sidebar_border_color = [dict objectForKey:@"profile_sidebar_border_color"];
            self.contributors_enabled = [[dict objectForKey:@"contributors_enabled"] boolValue];
            self.id_str = [dict objectForKey:@"id_str"];
            self.profile_banner_url = [dict objectForKey:@"profile_banner_url"];
            self.screen_name = [dict objectForKey:@"screen_name"];
            self.time_zone = [dict objectForKey:@"time_zone"];
            self.profile_background_image_url = [dict objectForKey:@"profile_background_image_url"];
            self.profile_background_image_url_https = [dict objectForKey:@"profile_background_image_url_https"];
            self.profile_link_color = [dict objectForKey:@"profile_link_color"];
            if (![[dict objectForKey:@"favourites_count"]isKindOfClass:[NSNull class]]) self.favourites_count = [[dict objectForKey:@"favourites_count"] intValue];
            if (![[dict objectForKey:@"utc_offset"]isKindOfClass:[NSNull class]]) self.utc_offset = [[dict objectForKey:@"utc_offset"] intValue];
            if (![[dict objectForKey:@"friends_count"]isKindOfClass:[NSNull class]]) self.friends_count = [[dict objectForKey:@"friends_count"] intValue];
            self.verified = [[dict objectForKey:@"verified"] boolValue];

    }
    
    return self;
    
}

#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.protectedProperty = [aDecoder decodeBoolForKey:@"protectedProperty"];
    self.is_translator = [aDecoder decodeBoolForKey:@"is_translator"];
    self.profile_image_url = [aDecoder decodeObjectForKey:@"profile_image_url"];
    self.created_at = [aDecoder decodeObjectForKey:@"created_at"];
    self.userIdentifier = [aDecoder decodeIntegerForKey:@"userIdentifier"];
    self.default_profile_image = [aDecoder decodeBoolForKey:@"default_profile_image"];
    self.listed_count = [aDecoder decodeIntegerForKey:@"listed_count"];
    self.profile_background_color = [aDecoder decodeObjectForKey:@"profile_background_color"];
    self.follow_request_sent = [aDecoder decodeObjectForKey:@"follow_request_sent"];
    self.location = [aDecoder decodeObjectForKey:@"location"];
    self.lang = [aDecoder decodeObjectForKey:@"lang"];
    self.url = [aDecoder decodeObjectForKey:@"url"];
    self.entities = [aDecoder decodeObjectForKey:@"entities"];
    self.geo_enabled = [aDecoder decodeBoolForKey:@"geo_enabled"];
    self.followers_count = [aDecoder decodeIntegerForKey:@"followers_count"];
    self.profile_text_color = [aDecoder decodeObjectForKey:@"profile_text_color"];
    self.show_all_inline_media = [aDecoder decodeBoolForKey:@"show_all_inline_media"];
    self.userDescription = [aDecoder decodeObjectForKey:@"userDescription"];
    self.statuses_count = [aDecoder decodeIntegerForKey:@"statuses_count"];
    self.notifications = [aDecoder decodeObjectForKey:@"notifications"];
    self.following = [aDecoder decodeObjectForKey:@"following"];
    self.profile_background_tile = [aDecoder decodeBoolForKey:@"profile_background_tile"];
    self.profile_use_background_image = [aDecoder decodeBoolForKey:@"profile_use_background_image"];
    self.profile_sidebar_fill_color = [aDecoder decodeObjectForKey:@"profile_sidebar_fill_color"];
    self.profile_image_url_https = [aDecoder decodeObjectForKey:@"profile_image_url_https"];
    self.default_profile = [aDecoder decodeBoolForKey:@"default_profile"];
    self.name = [aDecoder decodeObjectForKey:@"name"];
    self.profile_sidebar_border_color = [aDecoder decodeObjectForKey:@"profile_sidebar_border_color"];
    self.contributors_enabled = [aDecoder decodeBoolForKey:@"contributors_enabled"];
    self.id_str = [aDecoder decodeObjectForKey:@"id_str"];
    self.profile_banner_url = [aDecoder decodeObjectForKey:@"profile_banner_url"];
    self.screen_name = [aDecoder decodeObjectForKey:@"screen_name"];
    self.time_zone = [aDecoder decodeObjectForKey:@"time_zone"];
    self.profile_background_image_url = [aDecoder decodeObjectForKey:@"profile_background_image_url"];
    self.profile_background_image_url_https = [aDecoder decodeObjectForKey:@"profile_background_image_url_https"];
    self.profile_link_color = [aDecoder decodeObjectForKey:@"profile_link_color"];
    self.favourites_count = [aDecoder decodeIntegerForKey:@"favourites_count"];
    self.utc_offset = [aDecoder decodeIntegerForKey:@"utc_offset"];
    self.friends_count = [aDecoder decodeIntegerForKey:@"friends_count"];
    self.verified = [aDecoder decodeBoolForKey:@"verified"];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeBool:_protectedProperty forKey:@"protectedProperty"];
    [aCoder encodeBool:_is_translator forKey:@"is_translator"];
    [aCoder encodeObject:_profile_image_url forKey:@"profile_image_url"];
    [aCoder encodeObject:_created_at forKey:@"created_at"];
    [aCoder encodeInteger:_userIdentifier forKey:@"userIdentifier"];
    [aCoder encodeBool:_default_profile_image forKey:@"default_profile_image"];
    [aCoder encodeInteger:_listed_count forKey:@"listed_count"];
    [aCoder encodeObject:_profile_background_color forKey:@"profile_background_color"];
    [aCoder encodeObject:_follow_request_sent forKey:@"follow_request_sent"];
    [aCoder encodeObject:_location forKey:@"location"];
    [aCoder encodeObject:_lang forKey:@"lang"];
    [aCoder encodeObject:_url forKey:@"url"];
    [aCoder encodeObject:_entities forKey:@"entities"];
    [aCoder encodeBool:_geo_enabled forKey:@"geo_enabled"];
    [aCoder encodeInteger:_followers_count forKey:@"followers_count"];
    [aCoder encodeObject:_profile_text_color forKey:@"profile_text_color"];
    [aCoder encodeBool:_show_all_inline_media forKey:@"show_all_inline_media"];
    [aCoder encodeObject:_userDescription forKey:@"userDescription"];
    [aCoder encodeInteger:_statuses_count forKey:@"statuses_count"];
    [aCoder encodeObject:_notifications forKey:@"notifications"];
    [aCoder encodeObject:_following forKey:@"following"];
    [aCoder encodeBool:_profile_background_tile forKey:@"profile_background_tile"];
    [aCoder encodeBool:_profile_use_background_image forKey:@"profile_use_background_image"];
    [aCoder encodeObject:_profile_sidebar_fill_color forKey:@"profile_sidebar_fill_color"];
    [aCoder encodeObject:_profile_image_url_https forKey:@"profile_image_url_https"];
    [aCoder encodeBool:_default_profile forKey:@"default_profile"];
    [aCoder encodeObject:_name forKey:@"name"];
    [aCoder encodeObject:_profile_sidebar_border_color forKey:@"profile_sidebar_border_color"];
    [aCoder encodeBool:_contributors_enabled forKey:@"contributors_enabled"];
    [aCoder encodeObject:_id_str forKey:@"id_str"];
    [aCoder encodeObject:_profile_banner_url forKey:@"profile_banner_url"];
    [aCoder encodeObject:_screen_name forKey:@"screen_name"];
    [aCoder encodeObject:_time_zone forKey:@"time_zone"];
    [aCoder encodeObject:_profile_background_image_url forKey:@"profile_background_image_url"];
    [aCoder encodeObject:_profile_background_image_url_https forKey:@"profile_background_image_url_https"];
    [aCoder encodeObject:_profile_link_color forKey:@"profile_link_color"];
    [aCoder encodeInteger:_favourites_count forKey:@"favourites_count"];
    [aCoder encodeInteger:_utc_offset forKey:@"utc_offset"];
    [aCoder encodeInteger:_friends_count forKey:@"friends_count"];
    [aCoder encodeBool:_verified forKey:@"verified"];
}


@end
