//
//  Notification.h
//  RentalDayNotifier
//
//  Created by giginet on 11/06/30.
//  Copyright 2011 Kawaz. All rights reserved.
//

#import <Foundation/Foundation.h>
// レンタル通知モデル

@interface Notification : NSObject <NSCoding>{
  BOOL alertEnable_;     // 通知が有効かどうか
  int rentalPeriod_;     // 何泊レンタルしたか
  NSDate* rentalDay_;    // レンタル日
  NSDate* alertTime_;    // 通知日時
  NSIndexSet* kinds_;    // レンタルしたモノの種類を格納
  NSString* note_;       // 備考
}

@property(readwrite) BOOL alertEnable;
@property(readwrite) int rentalPeriod;
@property(readwrite, retain) NSDate* rentalDay;
@property(readwrite, retain) NSDate* alertTime;
@property(readwrite, retain) NSIndexSet* kinds;
@property(readwrite, retain) NSString* note;
@end
