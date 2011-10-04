//
//  NotifyViewController.h
//  RentalDayNotifier
//
//  Created by giginet on 11/06/26.
//  Copyright 2011 Kawaz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NotificationManager.h"

@interface NotifyViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
  IBOutlet UITableView* tableView_;
  IBOutlet UINavigationBar* bar_;
  NotificationManager* manager_;
  
}

@end