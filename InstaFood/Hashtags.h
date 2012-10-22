//
//  Hashtags.h
//
//  Created by Daniel Quek on 22/10/12
//  Copyright (c) 2012 Cellcity. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Hashtags : NSObject <NSCoding>

@property (nonatomic, retain) NSArray *indices;
@property (nonatomic, retain) NSString *text;

+ (Hashtags *)modelObjectWithDictionary:(NSDictionary *)dict;
- (id)initWithDictionary:(NSDictionary *)dict;

@end
