//
//  NotificationDatePicker.m
//  RentalDayNotifier
//
//  Created by  on 11/09/28.
//  Copyright 2011年 Kawaz. All rights reserved.
//

#import "NotificationDatePicker.h"

@implementation NotificationDatePicker
@synthesize notification=notification_;

- (id)initWithNotification:(Notification *)notification{
  self = [super init];
  if(self){
    self.notification = notification;
  }
  return self;
}

- (void)dealloc{
  [notification_ release];
  [super dealloc];
}

@end
