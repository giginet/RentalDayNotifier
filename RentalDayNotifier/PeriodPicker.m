//
//  PeriodPicker.m
//  RentalDayNotifier
//
//  Created by  on 11/09/28.
//  Copyright 2011年 Kawaz. All rights reserved.
//

#import "PeriodPicker.h"

@implementation PeriodPicker
@synthesize notification=notification_;

- (id)initWithNotification:(Notification *)notification{
  self = [super init];
  if (self) {
    self.delegate = self;
    self.dataSource = self;
    self.showsSelectionIndicator = YES;
    self.notification = notification;
    [self selectRow:notification.rentalPeriod - 1 inComponent:0 animated:NO];
  }
  return self;
}

- (void)dealloc{
  [notification_ release];
  [super dealloc];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
  return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
  return 14;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
  return [NSString stringWithFormat:@"%d泊%d日", row+1, row+2];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
  notification_.rentalPeriod = row + 1;
}

@end
