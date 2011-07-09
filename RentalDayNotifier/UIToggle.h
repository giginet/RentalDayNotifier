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

- (void)setOnImage:(NSString*)on offImage:(NSString*)off;

@property(readwrite) BOOL toggle;
@property(readwrite, copy) NSString* onImage;
@property(readwrite, copy) NSString* offImage;
@end
