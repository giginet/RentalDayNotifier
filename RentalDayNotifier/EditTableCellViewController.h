//
//  EditTableCellViewController.h
//  RentalDayNotifier
//
//  Created by giginet on 11/07/08.
//  Copyright 2011 Kawaz. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface EditTableCellViewController : UIViewController {
  IBOutlet UILabel* mainLabel_;
  IBOutlet UILabel* subLabel_;
}

@property(readonly, assign) UILabel* mainLabel;
@property(readonly, assign) UILabel* subLabel;
@end
