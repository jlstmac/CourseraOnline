//
//  AppDelegate.m
//  CourseraOnline
//
//  Created by LinShan Jiang on 23/12/15.
//  Copyright © 2015年 LinShan Jiang. All rights reserved.
//

#import "AppDelegate.h"
#import "COHomeViewController.h"
#import "COFavoritesViewController.h"
#import "COModel.h"
#import "UIKit+AFNetworking.h"
#import "COFavorites.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    //show the network activity indicator
    [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:YES];
    
    COHomeViewController* homeVC = [[COHomeViewController alloc] init];
    COFavoritesViewController* favoriteVC = [[COFavoritesViewController alloc] init];
    
    NSArray* arrVC = [NSArray arrayWithObjects:homeVC,favoriteVC, nil];
    NSUInteger count = [arrVC count];
    NSMutableArray* arrNC = [[NSMutableArray alloc] initWithCapacity:count];
    for (int i = 0; i < count; i++) {
        UINavigationController* nc = [[UINavigationController alloc] initWithRootViewController:[arrVC objectAtIndex:i]];
        [arrNC addObject:nc];
    }
    
    UITabBarController* tabVC = [[UITabBarController alloc] init];
    tabVC.viewControllers = arrNC;
    
    self.window.rootViewController = tabVC;
    
    [self.window makeKeyAndVisible];
    
//    [COModel globalTimelinePostsWithBlock:^(NSArray *posts, NSError *error) {
//        if (error) {
//            NSAlert *alert = [[NSAlert alloc] init];
//            alert.messageText = NSLocalizedString(@"Error", nil);
//            alert.informativeText = error.localizedDescription;
//            [alert addButtonWithTitle:NSLocalizedString(@"OK", nil)];
//            [alert runModal];
//        }
//        
////        self.postsArrayController.content = posts;
//    }];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    //save the file
    [[COFavorites sharedInstance] save];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    

}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
