//
//  SearchMetadata.h
//
//  Created by Daniel Quek on 22/10/12
//  Copyright (c) 2012 Cellcity. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface SearchMetadata : NSObject <NSCoding>

@property (nonatomic, assign) NSInteger max_id;
@property (nonatomic, assign) NSInteger since_id;
@property (nonatomic, retain) NSString *since_id_str;
@property (nonatomic, retain) NSString *refresh_url;
@property (nonatomic, retain) NSString *max_id_str;
@property (nonatomic, assign) NSInteger count;
@property (nonatomic, retain) NSString *query;
@property (nonatomic, retain) NSString *next_results;
@property (nonatomic, assign) NSInteger completed_in;

+ (SearchMetadata *)modelObjectWithDictionary:(NSDictionary *)dict;
- (id)initWithDictionary:(NSDictionary *)dict;

@end
