//
//  UIToggle.m
//  RentalDayNotifier
//
//  Created by giginet on 11/07/07.
//  Copyright 2011 Kawaz. All rights reserved.
//

#import "UIToggle.h"

@interface UIToggle()
- (void)toggleSwitch;
@end

@implementation UIToggle
@synthesize toggle=toggle_, onImage=onImage_, offImage=offImage_;

- (id)initWithFrame:(CGRect)frame{
  self = [super initWithFrame:frame];
  if(self){
    toggle_ = NO;
  }
  return self;
}

- (BOOL)toggle{
  return toggle_;
}

- (void)setToggle:(BOOL)toggle{
  toggle_ = toggle;
  UIImage* bgImage = [UIImage imageNamed:toggle ? onImage_ : offImage_];
  UIImage* pressImage = [UIImage imageNamed:toggle ? offImage_ : onImage_];
  [self setBackgroundImage:bgImage forState:UIControlStateNormal];
  [self setBackgroundImage:pressImage forState:UIControlStateSelected];
}

- (void)toggleSwitch{
  self.toggle = !toggle_;
}

@end
