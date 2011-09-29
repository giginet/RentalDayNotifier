//
//  NotificationDatePicker.m
//  RentalDayNotifier
//
//  Created by  on 11/09/28.
//  Copyright 2011年 Kawaz. All rights reserved.
//

#import "NotificationDatePicker.h"

@interface NotificationDatePicker()
- (void)setRentalDay:(id)sender;
@end

@implementation NotificationDatePicker
@synthesize notification=notification_;

- (id)initWithNotification:(Notification *)notification{
  self = [super init];
  if(self){
    self.notification = notification;
    [self addTarget:self action:@selector(setRentalDay:) forControlEvents:UIControlEventValueChanged];
    self.date = notification_.rentalDay;
  }
  return self;
}

- (void)dealloc{
  [notification_ release];
  [super dealloc];
}

- (void)setRentalDay:(id)sender{
  notification_.rentalDay = self.date;
}

@end