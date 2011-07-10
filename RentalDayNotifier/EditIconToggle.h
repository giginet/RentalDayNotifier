//
//  EditIconToggle.h
//  RentalDayNotifier
//
//  Created by giginet on 11/07/09.
//  Copyright 2011 Kawaz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIToggle.h"

@interface EditIconToggle : UIView {
  UIToggle* toggle_;
  UILabel* label_;
}

@property(readwrite, retain) UIToggle* toggle;
@property(readwrite, retain) UILabel* label;
@end
