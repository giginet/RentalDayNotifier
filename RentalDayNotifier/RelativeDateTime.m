//
//  RelativeDateTime.m
//  RentalDayNotifier
//
//  Created by giginet on 11/07/10.
//  Copyright 2011 Kawaz. All rights reserved.
//

#import "RelativeDateTime.h"
#import "DatePatch.h"

@implementation RelativeDateTime
@synthesize day=day_, hour=hour_, minute=minute_;

- (id)init{
  if((self = [super init])){
    day_ = 0;
    hour_ = 0;
    minute_ = 0;
  }
  return self;
}

- (id)initWithDay:(int)day hour:(int)hour andMinute:(int)minute{
  if((self = [super init])){
    day_ = day;
    hour_ = hour;
    minute_ = minute;
  }
  return self;
}

- (NSString*)description{
  NSString* day;
  if(day_ == -1){
    day = @"前日";
  }else if(day_ == 1){
    day = @"翌日";
  }else if(day_ == 0){
    day = @"当日";
  }else if(day_ < -1){
    day = [NSString stringWithFormat:@"%d日前", day_];
  }else if(day_ > 1){
    day = [NSString stringWithFormat:@"%d日後", day_];
  }
  return [NSString stringWithFormat:@"%@ %2.2d:%2.2d", day, hour_, minute_];
}


- (NSDate*)toDate:(NSDate *)from{
  NSDateComponents* comps = [from convertToComponents];
  comps.day = day_;
  comps.hour = hour_;
  comps.minute = minute_;
  return [comps convertToDate];
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
  [aCoder encodeObject:[NSNumber numberWithInt:day_] forKey:@"DAY"];
  [aCoder encodeObject:[NSNumber numberWithInt:hour_] forKey:@"HOUR"];
  [aCoder encodeObject:[NSNumber numberWithInt:minute_] forKey:@"MINUTE"];
}

- (id)initWithCoder:(NSCoder *)aDecoder{
  if( (self = [super init])){
    day_    = [(NSNumber*)[aDecoder decodeObjectForKey:@"DAY"] intValue];
    hour_   = [(NSNumber*)[aDecoder decodeObjectForKey:@"HOUR"] intValue];
    minute_ = [(NSNumber*)[aDecoder decodeObjectForKey:@"MINUTE"] intValue];
  }
  return self;
}

@end
