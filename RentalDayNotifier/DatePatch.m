//
//  DatePatch.m
//  TrashDayNotifier
//
//  Created by giginet on 11/04/25.
//  Copyright 2011 Kawaz. All rights reserved.
//

#import "DatePatch.h"

@implementation NSDate(MonkeyPatch)
-(NSDateComponents*)convertToComponents{
  NSCalendar* cal = [NSCalendar currentCalendar];
  NSUInteger flg = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit |
  NSWeekdayCalendarUnit | NSWeekdayOrdinalCalendarUnit |NSHourCalendarUnit | 
  NSMinuteCalendarUnit |NSSecondCalendarUnit;
  NSDateComponents* cmp = [cal components:flg fromDate:self];
  return cmp;
}

- (NSString*)dayDescription{
  NSDateComponents* comps = [self convertToComponents];
  int month = comps.month;
  int day = comps.day;
  NSArray* weekdays = [NSArray arrayWithObjects:@"日",@"月",@"火",@"水",@"木",@"金",@"土", nil];
  NSString* weekday = [weekdays objectAtIndex:comps.weekday-1];
  return [NSString stringWithFormat:@"%d月%d日(%@)", month, day, weekday];
}

- (NSString*)dayDescriptionWithYear{
  NSDateComponents* comps = [self convertToComponents];
  return [NSString stringWithFormat:@"%d年%@", comps.year ,[self dayDescription]];
}

- (BOOL)isSameDay:(NSDate *)day{
  NSDateComponents* comps0 = [self convertToComponents];
  NSDateComponents* comps1 = [day convertToComponents];
  return comps0.day == comps1.day && comps0.month == comps1.month && comps0.year == comps1.year;
}

- (NSString*)relativeDate:(NSDate *)root{
  NSTimeInterval sub = [self timeIntervalSinceDate:root];
  if([self isSameDay:[NSDate date]]){
    return @"今日";
  }else if(sub < 0){
    return [NSString stringWithFormat:@"%d日前", abs(sub)/(24*60*60)];
  }else{
    return [NSString stringWithFormat:@"%d日後", abs(sub)/(24*60*60)];
  }
}

@end

@implementation NSDateComponents(MonkeyPatch)
-(NSDate*)convertToDate{
  NSCalendar* cal = [NSCalendar currentCalendar];
  return [cal dateFromComponents:self];
}
@end