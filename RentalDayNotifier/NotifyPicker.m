//
//  NotifyPicker.m
//  RentalDayNotifier
//
//  Created by  on 11/09/28.
//  Copyright 2011年 Kawaz. All rights reserved.
//

#import "NotifyPicker.h"
#import "RelativeDateTime.h"

@implementation NotifyPicker
@synthesize notification=notification_;

- (id)initWithNotification:(Notification *)notification{
  self = [super init];
  if (self) {
    self.delegate = self;
    self.dataSource = self;
    self.showsSelectionIndicator = YES;
    self.notification = notification;
    [self selectRow:notification.alertDateTime.day + 1 inComponent:0 animated:NO];
    [self selectRow:notification.alertDateTime.hour inComponent:1 animated:NO];
    [self selectRow:notification.alertDateTime.minute inComponent:2 animated:NO];
  }
  return self;
}

- (void)dealloc{
  [notification_ release];
  [super dealloc];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
  return 3;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
  if(component == 0){
    return 3;
  }else if(component == 1){
    return 24;
  }else if(component == 2){
    return 12;
  }
  return 1;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
  if(component == 0){
    NSString* dates[] = {@"前日", @"当日", @"翌日"};
    return dates[row];
  }else if(component == 1){
    return [NSString stringWithFormat:@"%d時", row];
  }else if(component == 2){
    return [NSString stringWithFormat:@"%d分", row*5];
  }
  return @"";
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
  if (component == 0) { 
    notification_.alertDateTime.day = row - 1;
  } else if(component == 1) {
    notification_.alertDateTime.hour = row;
  } else {
    notification_.alertDateTime.minute = row;
  }
}

@end
