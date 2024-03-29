//
//  TesstAppDelegate.m
//  AFTest
//
//  Created by Anand PR on 06/08/13.
//  Copyright (c) 2013 Vofox. All rights reserved.
//

#import "TesstAppDelegate.h"
#import "AFJSONRequestOperation.h"
#import "TesstAPI.h"

@implementation TesstAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
//    NSURL *url = [NSURL URLWithString:@""];
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    
//    
//    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
//        NSLog(@"IP Address: %@", JSON);
//    } failure:nil];
//    
//    [operation start];
    
    [self getFavoriteList];
    
    
    
    // Override point for customization after application launch.
    return YES;
}

- (void) getFavoriteList
{
    [[TesstAPI sharedAPI] getFavoriteList:^(BOOL status, id responseObject , NSError *error) {
        if (status) {
            NSLog(@"alertListFriends:%@",[responseObject valueForKeyPath:@"AlertList.FBFriendID"]);
        }
        else
        {
            //                [SUtilities errorAlert:[error localizedDescription]];
        }
    }];
    
}
     
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
