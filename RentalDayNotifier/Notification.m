//
//  Notification.m
//  RentalDayNotifier
//
//  Created by giginet on 11/06/30.
//  Copyright 2011 Kawaz. All rights reserved.
//

#import "Notification.h"


@implementation Notification
@synthesize alertEnable=alertEnable_, rentalPeriod=rentalPeriod_, rentalDay=rentalDay_, alertTime=alertTime_, kinds=kinds_, note=note_;

- (id)init{
  if((self = [super init])){
    alertEnable_ = NO;
    rentalPeriod_ = 7;
    rentalDay_ = [[NSDate date] retain];
    alertTime_ = [[NSDate date] retain];
    kinds_ = [[NSIndexSet alloc] init];
    note_ = [[NSString alloc] init];
  }
  return self;
}

- (void)dealloc{
  [rentalDay_ release];
  [kinds_ release];
  [note_ release];
  [alertTime_ release];
  [super dealloc];
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
  [aCoder encodeObject:alertTime_ forKey:@"ALERTTIME"];
  [aCoder encodeObject:kinds_ forKey:@"KINDS"];
  [aCoder encodeObject:note_ forKey:@"NOTE"];
}

- (id)initWithCoder:(NSCoder *)aDecoder{
  if( (self = [super init])){
    rentalDay_    = [[aDecoder decodeObjectForKey:@"RENTALDAY"] retain];
    alertTime_    = [[aDecoder decodeObjectForKey:@"ALERTTIME"] retain];
    kinds_        = [[aDecoder decodeObjectForKey:@"KINDS"] retain];
    note_         = [[aDecoder decodeObjectForKey:@"NOTE"] retain];
    alertEnable_  = [(NSNumber*)[aDecoder decodeObjectForKey:@"ALERTENABLE"] boolValue];
    rentalPeriod_ = [(NSNumber*)[aDecoder decodeObjectForKey:@"RENTALPERIOD"] intValue];
  }
  return self;
}

@end
