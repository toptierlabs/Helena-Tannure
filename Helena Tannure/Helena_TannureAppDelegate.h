//
//  Helena_TannureAppDelegate.h
//  Helena Tannure
//
//  Created by TopTier on 9/27/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import <Three20/Three20.h>
@class NavController;
@class HomeViewController;
@class AgendaViewController;
@class PhotoViewController;
@class ListVideoTableViewController;

@interface Helena_TannureAppDelegate : NSObject <UIApplicationDelegate, UITabBarControllerDelegate> {
    UIWindow *window;
     UITabBarController *tabBarController;
     HomeViewController *homeViewController;
     AgendaViewController *agendaViewController;
     PhotoViewController *photoViewController;
     ListVideoTableViewController *listVideoTableViewController;
     NavController *navController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain)  UITabBarController *tabBarController;
@property (nonatomic, retain)  NavController *navController;
@property (nonatomic, retain)  HomeViewController *homeViewController;
@property (nonatomic, retain)  AgendaViewController *agendaViewController;
@property (nonatomic, retain)  PhotoViewController *photoViewController;
@property (nonatomic, retain)  ListVideoTableViewController *listVideoTableViewController;

@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory;
- (void)saveContext;

@end
