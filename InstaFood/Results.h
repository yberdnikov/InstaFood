//
//  Results.h
//
//  Created by Daniel Quek on 21/10/12
//  Copyright (c) 2012 Cellcity. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Metadata;

@interface Results : NSObject <NSCoding>

@property (nonatomic, assign) NSInteger resultsIdentifier;
@property (nonatomic, retain) NSString *id_str;
@property (nonatomic, assign) NSInteger to_user_id;
@property (nonatomic, retain) NSString *from_user_name;
@property (nonatomic, retain) NSString *created_at;
@property (nonatomic, retain) NSString *from_user_id_str;
@property (nonatomic, retain) Metadata *metadata;
@property (nonatomic, retain) NSString *profile_image_url_https;
@property (nonatomic, retain) NSString *source;
@property (nonatomic, assign) NSInteger from_user_id;
@property (nonatomic, retain) NSString *profile_image_url;
@property (nonatomic, retain) NSString *geo;
@property (nonatomic, retain) NSString *to_user;
@property (nonatomic, retain) NSString *text;
@property (nonatomic, retain) NSString *from_user;
@property (nonatomic, retain) NSString *iso_language_code;
@property (nonatomic, retain) NSString *to_user_id_str;
@property (nonatomic, retain) NSString *to_user_name;

+ (Results *)modelObjectWithDictionary:(NSDictionary *)dict;
- (id)initWithDictionary:(NSDictionary *)dict;

@end
