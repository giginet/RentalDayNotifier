//
//  DatePatch.h
//  TrashDayNotifier
//
//  Created by giginet on 11/04/25.
//  Copyright 2011 Kawaz. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSDate(MonkeyPatch)
- (NSDateComponents*)convertToComponents; // NSDateを元にNSDateComponentsを生成
- (NSString*)dayDescription;              // 日付を読みやすい形式に出力
- (NSString*)dayDescriptionWithYear;      // 日付を西暦付きで出力
- (BOOL)isSameDay:(NSDate*)day;           // dayが同一日かどうか判定（時間以下は無視する）
- (NSString*)relativeDate:(NSDate*)root;  // rootと何日離れているかを文字列で出力
@end

@interface NSDateComponents(MonkeyPatch)
- (NSDate*)convertToDate;                 // NSDateComponentsを元にNSDateを生成
@end
