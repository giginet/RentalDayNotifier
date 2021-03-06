//
//  NotifyCellViewController.h
//  RentalDayNotifier
//
//  Created by  on 11/10/04.
//  Copyright 2011年 Kawaz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Notification.h"

@interface NotifyCellViewController : UIViewController{
  IBOutlet UIButton* returnButton_;
  IBOutlet UILabel* rentalLabel_;
  IBOutlet UILabel* relativeLabel_;
  IBOutlet UILabel* noteLabel_;
  IBOutlet UIImageView* alertIcon_;
  IBOutlet UIImageView* diskIcon_;
  IBOutlet UIImageView* movieIcon_;
  IBOutlet UIImageView* bookIcon_;
  Notification* notification_;
}

- (id)initWithNotification:(Notification*)notification;

@property(readonly, retain) UIButton*    returnButton;
@property(readonly, retain) UILabel*     rentalLabel;
@property(readonly, retain) UILabel*     relativeLabel;
@property(readonly, retain) UILabel*     noteLabel;
@property(readonly, retain) UIImageView* alertIcon;
@property(readonly, retain) UIImageView* diskIcon;
@property(readonly, retain) UIImageView* movieIcon;
@property(readonly, retain) UIImageView* bookIcon;
@property(readonly, retain) Notification* notification;
@end
