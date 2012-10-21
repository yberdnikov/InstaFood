//
//  TweetObject.h
//
//  Created by Daniel Quek on 21/10/12
//  Copyright (c) 2012 Cellcity. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface TweetObject : NSObject <NSCoding>

@property (nonatomic, assign) NSInteger max_id;
@property (nonatomic, assign) NSInteger since_id;
@property (nonatomic, retain) NSString *since_id_str;
@property (nonatomic, assign) NSInteger results_per_page;
@property (nonatomic, retain) NSString *refresh_url;
@property (nonatomic, retain) NSString *max_id_str;
@property (nonatomic, retain) NSString *query;
@property (nonatomic, retain) NSArray *results;
@property (nonatomic, retain) NSString *next_page;
@property (nonatomic, assign) NSInteger page;
@property (nonatomic, assign) NSInteger completed_in;

+ (TweetObject *)modelObjectWithDictionary:(NSDictionary *)dict;
- (id)initWithDictionary:(NSDictionary *)dict;

@end
