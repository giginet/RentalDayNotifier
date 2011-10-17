//
//  Notification.h
//  RentalDayNotifier
//
//  Created by giginet on 11/06/30.
//  Copyright 2011 Kawaz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RelativeDateTime.h"
// レンタル通知モデル

@interface Notification : NSObject <NSCoding>{
  BOOL alertEnable_;                   // 通知が有効かどうか
  int rentalPeriod_;                   // 何泊レンタルしたか
  NSDate* rentalDay_;                  // レンタル日
  NSIndexSet* kinds_;                  // レンタルしたモノの種類を格納
  NSString* note_;                     // 備考
  RelativeDateTime* alertDateTime_;    // 通知日時
  NSDate* createdAt_;                  // 作成日
}

- (NSString*)rentalDayDescription;
- (NSString*)periodDescription;
- (NSString*)alertDescription;
- (NSDate*)returnDay;                  // 返却日を返します
- (NSString*)relativeDescription;
- (BOOL)isNotificationDayOn:(NSDate*)date;

@property(readwrite) BOOL alertEnable;
@property(readwrite) int rentalPeriod;
@property(readwrite, retain) NSDate* rentalDay;
@property(readwrite, retain) NSIndexSet* kinds;
@property(readwrite, retain) NSString* note;
@property(readwrite, assign) RelativeDateTime* alertDateTime;
@property(readonly, retain)  NSDate* createdAt;
@property(readonly, retain)  NSDate* returnDay;
@end
