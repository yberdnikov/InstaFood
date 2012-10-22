//
//  Entities.h
//
//  Created by Daniel Quek on 22/10/12
//  Copyright (c) 2012 Cellcity. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DescriptionClass, Url;

@interface Entities : NSObject <NSCoding>

@property (nonatomic, retain) DescriptionClass *entitiesDescription;
@property (nonatomic, retain) NSArray *user_mentions;
@property (nonatomic, retain) NSArray *urls;
@property (nonatomic, retain) Url *url;
@property (nonatomic, retain) NSArray *hashtags;

+ (Entities *)modelObjectWithDictionary:(NSDictionary *)dict;
- (id)initWithDictionary:(NSDictionary *)dict;

@end
