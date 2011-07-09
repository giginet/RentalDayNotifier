//
//  UIToggle.m
//  RentalDayNotifier
//
//  Created by giginet on 11/07/07.
//  Copyright 2011 Kawaz. All rights reserved.
//

#import "UIToggle.h"

@interface UIToggle()
- (void)toggleSwitch:(id)sender;
@end

@implementation UIToggle
@synthesize toggle=toggle_, onImage=onImage_, offImage=offImage_;

- (id)initWithFrame:(CGRect)frame{
  self = [super initWithFrame:frame];
  if(self){
    toggle_ = NO;
    [self addTarget:self action:@selector(toggleSwitch:) forControlEvents:UIControlEventTouchUpInside];
  }
  return self;
}

- (BOOL)toggle{
  return toggle_;
}

- (void)setOnImage:(NSString *)on offImage:(NSString *)off{
  self.onImage = on;
  self.offImage = off;
}

- (void)setToggle:(BOOL)toggle{
  toggle_ = toggle;
  UIImage* bgImage = [UIImage imageNamed:toggle ? onImage_ : offImage_];
  UIImage* pressImage = [UIImage imageNamed:toggle ? offImage_ : onImage_];
  [self setBackgroundImage:bgImage forState:UIControlStateNormal];
  [self setBackgroundImage:pressImage forState:UIControlStateSelected];
}

- (void)setOnImage:(NSString *)onImage{
  onImage_ = [[NSString stringWithString:onImage] retain];
  if(toggle_){
    [self setBackgroundImage:[UIImage imageNamed:onImage] forState:UIControlStateNormal];
    [self setBackgroundImage:[UIImage imageNamed:onImage] forState:UIControlStateSelected];
  }
}

- (NSString*)onImage{
  return [NSString stringWithString:onImage_];
}

- (void)setOffImage:(NSString *)offImage{
  offImage_ = [[NSString stringWithString:offImage] retain];
  if(!toggle_){
    [self setBackgroundImage:[UIImage imageNamed:offImage] forState:UIControlStateNormal];
    [self setBackgroundImage:[UIImage imageNamed:offImage] forState:UIControlStateSelected];
  }
}

- (NSString*)offImage{
  return [NSString stringWithString:offImage_];
}

- (void)toggleSwitch:(id)sender{
  self.toggle = !toggle_;
}

@end
