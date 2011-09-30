//
//  NoficationManager.m
//  RentalDayNotifier
//
//  Created by  on 11/09/28.
//  Copyright 2011年 Kawaz. All rights reserved.
//

#import "NotificationManager.h"

@interface NotificationManager()
- (Notification*)createNotification:(NSString*)label;
- (NSArray*)loadStorage;
- (void)writeStorage:(NSArray*)array;
@end

@implementation NotificationManager

- (id)init{
  notifications_ = [[NSMutableArray alloc] initWithArray:[self loadStorage]];
  return self;
}

- (void)dealloc{
  [notifications_ release];
  [self dealloc];
}

- (void)saveWithNotification:(Notification *)notification{
  if([notifications_ containsObject:notification]){
    //存在した場合、更新する
    int index = [notifications_ indexOfObject:notification];
    [notifications_ replaceObjectAtIndex:index withObject:notification];
  }else{
    //存在しなかった場合、新規作成する
    [notifications_ addObject:notification];
    [notification release];
  }
  [self writeStorage:notifications_];
}

- (Notification*)notificationAtIndex:(NSInteger)index{
  return (Notification*)[notifications_ objectAtIndex:index];
}

- (BOOL)removeNotificationAtIndex:(NSInteger)index{
  if([notifications_ count] <= index) return NO;
  Notification* n = [notifications_ objectAtIndex:index];
  [notifications_ removeObject:n];
  [self writeStorage:notifications_];
  return YES;
}

- (NSArray *)notificationsOn:(NSDate *)date{
  NSMutableArray* notifications = [[NSMutableArray alloc] init];
  for(Notification* n in notifications_){
    if([n isNotificationDayOn:date]) [notifications addObject:n];
  }
  return notifications;
}

- (void)updateAllNotificationAlert:(NSDate *)from to:(NSDate *)to{
}

- (NSInteger)count{
  return [notifications_ count];
}

- (NSArray*)loadStorage{
  //保存されているデータをNSData型からNotification型に変換して読み込む
  NSMutableArray* notifications = [NSMutableArray array];
  NSUserDefaults* ud = [NSUserDefaults standardUserDefaults];
  NSArray* notificationDatas = [ud arrayForKey:@"notifications"];
  for(NSData* data in notificationDatas){
    Notification* n = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    [notifications addObject:n];
  }
  return [[NSArray alloc] initWithArray:notifications];
}

- (void)writeStorage:(NSArray*)array{
  //渡された配列のNotification型をNSData型に変換して保存する
  NSUserDefaults* ud = [NSUserDefaults standardUserDefaults];
  NSMutableArray* notificationDatas = [NSMutableArray array];
  for(Notification* n in array){
    NSData* d = [NSKeyedArchiver archivedDataWithRootObject:n];
    [notificationDatas addObject:d];
  }
  NSLog(@"%@", ud);
  [ud setObject:[[NSArray alloc] initWithArray:notificationDatas] forKey:@"notifications"];
}

- (Notification *)createNotification:(NSString *)label{
  Notification* notification = [[Notification alloc] init];
  [notifications_ addObject:notification];
  return notification;
}

@end
