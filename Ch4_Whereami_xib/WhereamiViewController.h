//
//  WhereamiViewController.h
//  Ch4_Whereami_xib
//
//  Created by William Kong on 1/2/2014.
//  Copyright (c) 2014 William Kong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface WhereamiViewController : UIViewController <CLLocationManagerDelegate, MKMapViewDelegate, UITextFieldDelegate >
{
    CLLocationManager *locationManager;
    
    IBOutlet MKMapView *worldView;
    IBOutlet UIActivityIndicatorView *activityIndicator;
    IBOutlet UITextField *locationTitleField;
    
}


- (void) findLocation;
- (void) foundLocation:(CLLocation *) loc;


// delegate methods
- (void) mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation;


@end
