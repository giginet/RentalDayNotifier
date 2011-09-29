//
//  Notification.m
//  RentalDayNotifier
//
//  Created by giginet on 11/06/30.
//  Copyright 2011 Kawaz. All rights reserved.
//

#import "Notification.h"
#import "DatePatch.h"

@implementation Notification
@synthesize alertEnable=alertEnable_, rentalPeriod=rentalPeriod_, 
rentalDay=rentalDay_, alertDateTime=alertDateTime_, kinds=kinds_, 
note=note_, createdAt=createdAt_;

- (id)init{
  if((self = [super init])){
    NSUserDefaults* ud = [NSUserDefaults standardUserDefaults];
    alertEnable_ = NO;
    rentalPeriod_ = 7;
    createdAt_ = [[NSDate date] retain];
    if([ud objectForKey:@"alertDateTime"]){
      alertDateTime_ = [[ud objectForKey:@"alertDateTime"] retain];
    }else{
      alertDateTime_ = [[RelativeDateTime alloc] initWithDay:1 hour:10 andMinute:0];
    }
    rentalDay_ = [[NSDate date] retain];
    kinds_ = [[NSIndexSet alloc] init];
    note_ = [[NSString alloc] init];
  }
  return self;
}

- (void)dealloc{
  [rentalDay_ release];
  [kinds_ release];
  [note_ release];
  [alertDateTime_ release];
  [createdAt_ release];
  [super dealloc];
}

- (BOOL)isEqual:(id)object{
  Notification* notification = (Notification*)object;
  return [notification.createdAt isEqual:self];
}

/*
 NSUserDefaultにNotification型を保存するために、
 NSCodingプロトコルを実装し、encodeWithCoder,initWithCoderメソッドを
 オーバーライドした。
 これにより、Notification型をNSData型に変換し、NSUserDefaultに保存できる。
 ref:http://iphone-dev.g.hatena.ne.jp/tokorom/20090522/1242978305
 */
- (void)encodeWithCoder:(NSCoder *)aCoder{
  [aCoder encodeObject:[NSNumber numberWithInt:rentalPeriod_] forKey:@"RENTALPERIOD"];
  [aCoder encodeObject:[NSNumber numberWithBool:alertEnable_] forKey:@"ALERTENABLE"];
  [aCoder encodeObject:rentalDay_ forKey:@"RENTALDAY"];
  [aCoder encodeObject:alertDateTime_ forKey:@"alertDateTime"];
  [aCoder encodeObject:kinds_ forKey:@"KINDS"];
  [aCoder encodeObject:note_ forKey:@"NOTE"];
}

- (id)initWithCoder:(NSCoder *)aDecoder{
  if( (self = [super init])){
    rentalDay_    = [[aDecoder decodeObjectForKey:@"RENTALDAY"] retain];
    alertDateTime_= [[aDecoder decodeObjectForKey:@"alertDateTime"] retain];
    kinds_        = [[aDecoder decodeObjectForKey:@"KINDS"] retain];
    note_         = [[aDecoder decodeObjectForKey:@"NOTE"] retain];
    alertEnable_  = [(NSNumber*)[aDecoder decodeObjectForKey:@"ALERTENABLE"] boolValue];
    rentalPeriod_ = [(NSNumber*)[aDecoder decodeObjectForKey:@"RENTALPERIOD"] intValue];
  }
  return self;
}

- (NSString*)rentalDayDescription{
  return [rentalDay_ dayDescription];
}

- (NSString*)periodDescription{
  return [NSString stringWithFormat:@"%d泊%d日", rentalPeriod_, rentalPeriod_+1];
}

- (NSString*)alertDescription{
  return [alertDateTime_ description];
}

@end
