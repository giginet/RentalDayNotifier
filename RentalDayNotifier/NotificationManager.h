//
//  NoficationManager.h
//  RentalDayNotifier
//
//  Created by  on 11/09/28.
//  Copyright 2011年 Kawaz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KWSingleton.h"
#import "Notification.h"

@interface NotificationManager : KWSingleton{
  NSMutableArray* notifications_;
}

- (void)saveWithNotification:(Notification*)notification;
- (Notification*)notificationAtIndex:(NSInteger)index;
- (BOOL)removeNotificationAtIndex:(NSInteger)index;
- (NSArray*)notificationsOn:(NSDate*)date;
- (void)updateAllNotificationAlert:(NSDate*)from to:(NSDate*)to;
- (NSInteger)count;

@end
