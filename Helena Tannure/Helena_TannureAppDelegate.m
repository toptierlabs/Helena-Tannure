//
//  Helena_TannureAppDelegate.m
//  Helena Tannure
//
//  Created by TopTier on 9/27/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Helena_TannureAppDelegate.h"
#import "NavController.h"
#import "PhotoViewController.h"

@implementation Helena_TannureAppDelegate


@synthesize window=_window;

@synthesize tabBarController=_tabBarController;
@synthesize navController;
@synthesize homeViewController;
@synthesize agendaViewController;
@synthesize photoViewController;
@synthesize listVideoTableViewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    // Add the tab bar controller's current view as a subview of the window
    
//    [[TTURLRequestQueue mainQueue] setMaxContentLength:0];
//    
//    TTNavigator *navigator = [TTNavigator navigator];
//    navigator.window = self.window;
//    
//    TTURLMap *map = navigator.URLMap;
//    [map from:@"tt://appPhotos" toSharedViewController:[PhotoViewController class]];
//    
//    [navigator openURLAction:[TTURLAction actionWithURLPath:@"tt://appPhotos"]];
//    
    tabBarController = [[UITabBarController alloc] init];   
    
    homeViewController = [[HomeViewController alloc] init];
    agendaViewController = [[AgendaViewController alloc] init];
    photoViewController = [[PhotoViewController alloc] init];
   // photoViewController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    
    listVideoTableViewController = [[ListVideoTableViewController alloc] init];
    navController = [[[NavController alloc] initWithRootViewController:listVideoTableViewController] autorelease];
    
    UINavigationController *photoNavController = [[[UINavigationController alloc] initWithRootViewController:photoViewController] autorelease];
    self.tabBarController.viewControllers = [NSArray arrayWithObjects:homeViewController,agendaViewController,navController,photoNavController, nil];
    
    //homeViewController,agendaViewController,navController, 
    
    self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];
    return YES;
 
    
}



-(BOOL) application:(UIApplication *)application handleOpenURL:(NSURL *)url{
    TTOpenURL([url absoluteString]);
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

- (void)dealloc
{
    [_window release];
    [_tabBarController release];
    [listVideoTableViewController release];
    [navController release];
    [homeViewController release];
    [agendaViewController release];
    [photoViewController release];
    [super dealloc];
}

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
}
*/

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed
{
}
*/

@end
