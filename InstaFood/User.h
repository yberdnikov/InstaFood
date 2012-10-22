//
//  User.h
//
//  Created by Daniel Quek on 22/10/12
//  Copyright (c) 2012 Cellcity. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Entities;

@interface User : NSObject <NSCoding>

@property (nonatomic, assign) BOOL protectedProperty;
@property (nonatomic, assign) BOOL is_translator;
@property (nonatomic, retain) NSString *profile_image_url;
@property (nonatomic, retain) NSString *created_at;
@property (nonatomic, assign) NSInteger userIdentifier;
@property (nonatomic, assign) BOOL default_profile_image;
@property (nonatomic, assign) NSInteger listed_count;
@property (nonatomic, retain) NSString *profile_background_color;
@property (nonatomic, retain) NSString *follow_request_sent;
@property (nonatomic, retain) NSString *location;
@property (nonatomic, retain) NSString *lang;
@property (nonatomic, retain) NSString *url;
@property (nonatomic, retain) Entities *entities;
@property (nonatomic, assign) BOOL geo_enabled;
@property (nonatomic, assign) NSInteger followers_count;
@property (nonatomic, retain) NSString *profile_text_color;
@property (nonatomic, assign) BOOL show_all_inline_media;
@property (nonatomic, retain) NSString *userDescription;
@property (nonatomic, assign) NSInteger statuses_count;
@property (nonatomic, retain) NSString *notifications;
@property (nonatomic, retain) NSString *following;
@property (nonatomic, assign) BOOL profile_background_tile;
@property (nonatomic, assign) BOOL profile_use_background_image;
@property (nonatomic, retain) NSString *profile_sidebar_fill_color;
@property (nonatomic, retain) NSString *profile_image_url_https;
@property (nonatomic, assign) BOOL default_profile;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *profile_sidebar_border_color;
@property (nonatomic, assign) BOOL contributors_enabled;
@property (nonatomic, retain) NSString *id_str;
@property (nonatomic, retain) NSString *profile_banner_url;
@property (nonatomic, retain) NSString *screen_name;
@property (nonatomic, retain) NSString *time_zone;
@property (nonatomic, retain) NSString *profile_background_image_url;
@property (nonatomic, retain) NSString *profile_background_image_url_https;
@property (nonatomic, retain) NSString *profile_link_color;
@property (nonatomic, assign) NSInteger favourites_count;
@property (nonatomic, assign) NSInteger utc_offset;
@property (nonatomic, assign) NSInteger friends_count;
@property (nonatomic, assign) BOOL verified;

+ (User *)modelObjectWithDictionary:(NSDictionary *)dict;
- (id)initWithDictionary:(NSDictionary *)dict;

@end
