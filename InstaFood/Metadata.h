//
//  Metadata.h
//
//  Created by Daniel Quek on 22/10/12
//  Copyright (c) 2012 Cellcity. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Metadata : NSObject <NSCoding>

@property (nonatomic, retain) NSString *iso_language_code;
@property (nonatomic, retain) NSString *result_type;

+ (Metadata *)modelObjectWithDictionary:(NSDictionary *)dict;
- (id)initWithDictionary:(NSDictionary *)dict;

@end
