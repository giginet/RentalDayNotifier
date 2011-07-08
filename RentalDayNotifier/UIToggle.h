//
//  UIToggle.h
//  RentalDayNotifier
//
//  Created by giginet on 11/07/07.
//  Copyright 2011 Kawaz. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface UIToggle : UIButton {
  BOOL toggle_;
  NSString* onImage_;
  NSString* offImage_;
}

@property(readwrite) BOOL toggle;
@property(readwrite, retain) NSString* onImage;
@property(readwrite, retain) NSString* offImage;
@end
