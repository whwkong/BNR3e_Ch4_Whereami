//
//  BNRMapPoint.h
//  Ch4_Whereami_xib
//
//  Created by William Kong on 1/4/2014.
//  Copyright (c) 2014 William Kong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface BNRMapPoint : NSObject <MKAnnotation>
{
    
}

// a new designated initializer for instances of BNRMapPoint
- (id) initWithCoordinate: (CLLocationCoordinate2D) c title:(NSString*) t;

// this is a required property for MKAnnotation
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;

// this is an optional property for MKAnnotation
@property (nonatomic, copy) NSString *title;
@end
