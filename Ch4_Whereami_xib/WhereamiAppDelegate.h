//
//  WhereamiAppDelegate.h
//  Ch4_Whereami_xib
//
//  Created by William Kong on 1/2/2014.
//  Copyright (c) 2014 William Kong. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WhereamiViewController;

@interface WhereamiAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) WhereamiViewController *viewController;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
