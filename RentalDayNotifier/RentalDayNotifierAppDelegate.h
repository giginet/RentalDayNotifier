//
//  RentalDayNotifierAppDelegate.h
//  RentalDayNotifier
//
//  Created by giginet on 11/06/26.
//  Copyright 2011 Kawaz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RentalDayNotifierAppDelegate : NSObject <UIApplicationDelegate, UITabBarControllerDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;

@end
