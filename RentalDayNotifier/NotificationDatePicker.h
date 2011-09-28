//
//  NotificationDatePicker.h
//  RentalDayNotifier
//
//  Created by  on 11/09/28.
//  Copyright 2011年 Kawaz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Notification.h"

@interface NotificationDatePicker : UIDatePicker{
  Notification* notification_;
}

- (id)initWithNotification:(Notification *)notification;

@property(readwrite, retain) Notification* notification;
@end
