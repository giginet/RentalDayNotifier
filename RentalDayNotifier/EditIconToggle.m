//
//  EditIconToggle.m
//  RentalDayNotifier
//
//  Created by giginet on 11/07/09.
//  Copyright 2011 Kawaz. All rights reserved.
//

#import "EditIconToggle.h"


@implementation EditIconToggle
@synthesize toggle=toggle_, label=label_;

- (id)initWithFrame:(CGRect)frame{
  self = [super initWithFrame:frame];
  if (self) {
    toggle_ = [[UIToggle alloc] initWithFrame:CGRectMake(14, 10, 42, 42)];
    label_ = [[UILabel alloc] initWithFrame:CGRectMake(10, 50, 60, 20)];
    [self addSubview:toggle_];
    [self addSubview:label_];
    label_.textColor = [UIColor whiteColor];
    label_.backgroundColor = [UIColor clearColor];
    self.backgroundColor = [UIColor blackColor];
  }
  return self;
}
 
- (void)dealloc{
  [toggle_ release];
  [label_ release];
  [super dealloc];
}

@end
