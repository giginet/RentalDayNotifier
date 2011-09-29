//
//  EditViewController.h
//  RentalDayNotifier
//
//  Created by giginet on 11/06/26.
//  Copyright 2011 Kawaz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Notification.h"

@interface EditViewController : UITableViewController {
  Notification* notification_;
  UITextView* textField_;
}

@property(readwrite, retain) Notification* notification;

@end
