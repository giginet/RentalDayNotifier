//
//  RelativeDateTime.h
//  RentalDayNotifier
//
//  Created by giginet on 11/07/10.
//  Copyright 2011 Kawaz. All rights reserved.
//

#import <Foundation/Foundation.h>
// 相対的な日付モデル

@interface RelativeDateTime : NSObject <NSCoding> {
  int relativeDay_;
  int hour_;
  int minute_;
}

// 日付、時間を指定したコンストラクタ
- (id)initWithDay:(int)day hour:(int)hour andMinute:(int)minute;
// fromから絶対的なNSDateを返す
- (NSDate*)toDate:(NSDate*)from;

@property(readonly) int day;
@property(readonly) int hour;
@property(readonly) int minute;
@end
