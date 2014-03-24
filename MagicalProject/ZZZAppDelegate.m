//
//  ZZZAppDelegate.m
//  MagicalProject
//
//  Created by _Zach on 3/21/14.
//  Copyright (c) 2014 ZZZ. All rights reserved.
//

#import "ZZZAppDelegate.h"
#import <CoreData+MagicalRecord.h>
#import "MagicSpell.h"
#import "ZZZViewController.h"

@implementation ZZZAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [MagicalRecord setupAutoMigratingCoreDataStack];
    //TODO, import some data and then setup a FRC for the tableView
   
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"magical-items" ofType:@"json"];
    NSData *jsonArray = [[NSData alloc] initWithContentsOfFile:filePath];
    
    NSError *error;
    NSArray *parsedJSON = [NSJSONSerialization JSONObjectWithData:jsonArray options:NSJSONReadingAllowFragments error:&error];
    if (error) {
        NSLog(@"error: %@", error);
    }
  
    [MagicalRecord saveWithBlock:^(NSManagedObjectContext *localContext) {
        
        // this is buggy and does not return all imported records.
        [MagicSpell MR_importFromArray:parsedJSON inContext:localContext];
        // async call so the fetchReq wont return the first time :/
        
        NSFetchRequest *fetch = [[NSFetchRequest alloc] initWithEntityName:@"MagicSpell"];
        NSError *error = nil;
        NSPredicate *pred = [NSPredicate predicateWithFormat:@"id > 1"];
        fetch.predicate = pred;
        NSArray *stuff = [localContext executeFetchRequest:fetch error:&error];
        NSLog(@"fetched stuff is: %@", stuff);
    }];
   
    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    
    UIViewController *viewController = [[ZZZViewController alloc] init];
    self.window.rootViewController = viewController;
    [self.window makeKeyAndVisible];
    
    return YES;
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

- (void)applicationWillTerminate:(UIApplication *)application {
    [MagicalRecord cleanUp];
}

@end
