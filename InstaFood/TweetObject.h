//
//  TweetObject.h
//
//  Created by Daniel Quek on 22/10/12
//  Copyright (c) 2012 Cellcity. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SearchMetadata;

@interface TweetObject : NSObject <NSCoding>

@property (nonatomic, retain) SearchMetadata *search_metadata;
@property (nonatomic, retain) NSArray *statuses;

+ (TweetObject *)modelObjectWithDictionary:(NSDictionary *)dict;
- (id)initWithDictionary:(NSDictionary *)dict;

@end
