//
//  Urls.h
//
//  Created by Daniel Quek on 22/10/12
//  Copyright (c) 2012 Cellcity. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Urls : NSObject <NSCoding>

@property (nonatomic, retain) NSString *display_url;
@property (nonatomic, retain) NSString *url;
@property (nonatomic, retain) NSArray *indices;
@property (nonatomic, retain) NSString *expanded_url;

+ (Urls *)modelObjectWithDictionary:(NSDictionary *)dict;
- (id)initWithDictionary:(NSDictionary *)dict;

@end
