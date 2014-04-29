//
//  WhereamiViewController.m
//  Ch4_Whereami_xib
//
//  Created by William Kong on 1/2/2014.
//  Copyright (c) 2014 William Kong. All rights reserved.
//

#import "WhereamiViewController.h"
#import "BNRMapPoint.h"

@interface WhereamiViewController ()

@end

@implementation WhereamiViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        
        // Create location manager object
        locationManager = [[CLLocationManager alloc] init];
        
        [locationManager setDelegate:self];
        
        
        // And we want it to be as accurate as possible
        // regardless of how much time/power it takes
        [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
        
    }
    return self;
}

- (void) dealloc
{
    // tell location manager to stop sending messages
    [locationManager setDelegate:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//
// "Building a MapKit"
//
- (void) findLocation
{
    [locationManager startUpdatingLocation];
    [activityIndicator startAnimating];
    [locationTitleField setHidden:YES];
}

//
// "Building a MapKit"
//
- (void) foundLocation:(CLLocation *)loc
{
    CLLocationCoordinate2D coord = [loc coordinate];
    
    NSLog(@"foundLocation");
    NSLog(@"locationTitleField : %@", [locationTitleField text]);
    
    // Create an instance of BNRMapPoint with the current data
    BNRMapPoint *mp = [[BNRMapPoint alloc] initWithCoordinate:coord title:[locationTitleField text]];
    
    // Add it to map view
    [worldView addAnnotation:mp];
    
    
    // zoom the region to this location
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coord, 250, 250);
    
    [worldView setRegion:region animated:YES];
    
    // reset the UI
    [locationTitleField setText:@""];
    [activityIndicator stopAnimating];
    [locationTitleField setHidden:NO];
    [locationManager stopUpdatingLocation];
    
}


- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"didUpdateToLocation");
    NSLog(@"%@", newLocation);
    
    // Ch5. Building a MapKit
    // how many seconds ago was this new location created?
    NSTimeInterval t = [[newLocation timestamp] timeIntervalSinceNow];
    
    // CLLocationManagers will return the last found location of the
    // device first, so you don't want that data in this case
    // If this location was made more than 3 minutes ago, ignore it
    if (t < -180) {
        // this is cached data, so ignore it
        return;
    }
    
    [self foundLocation:newLocation];
}


- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error
{
    NSLog(@"Could not find location: %@", error);
}




// handles mapView callback;delegate method
- (void) mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    CLLocationCoordinate2D loc = [userLocation coordinate];
    
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(loc, 250, 250);
    
    [worldView setRegion:region animated:YES];
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [self findLocation];
    
    NSLog(@"textFieldShouldReturn");
    NSLog(@"%@",[locationTitleField text]);
    
    [textField resignFirstResponder];
    
    return YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [worldView setShowsUserLocation:YES];
}


@end
