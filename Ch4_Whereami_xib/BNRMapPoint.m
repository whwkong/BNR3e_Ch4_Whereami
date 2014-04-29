//
//  BNRMapPoint.m
//  Ch4_Whereami_xib
//
//  Created by William Kong on 1/4/2014.
//  Copyright (c) 2014 William Kong. All rights reserved.
//

#import "BNRMapPoint.h"

@implementation BNRMapPoint
@synthesize coordinate, title;

// override init to call our custom initializer
- (id) init
{
    return [self initWithCoordinate:CLLocationCoordinate2DMake(43.07, -89.32) title:@"Hometown"];
}


- (id) initWithCoordinate:(CLLocationCoordinate2D)c title:(NSString *)t
{
    self = [super init];
    if (self) {
        coordinate = c;
        [self setTitle:t];
    }
    
    return self;
}

- (NSString *) title
{
    return @"Somewhere in Toronto";
#if 0
    if ([self isEastOfTheMississipi])
        return @"Buying supplies";
    return @"On the Oregon Trail, uncharted territory";
#endif
}

@end
