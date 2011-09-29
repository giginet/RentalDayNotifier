//
//  EditViewController.m
//  RentalDayNotifier
//
//  Created by giginet on 11/06/26.
//  Copyright 2011 Kawaz. All rights reserved.
//

#import "EditViewController.h"
#import "EditTableCellViewController.h"
#import "UIToggle.h"
#import "EditIconToggle.h"
#import "NotificationDatePicker.h"
#import "PeriodPicker.h"
#import "NotifyPicker.h"
#import "NotificationManager.h"

@interface EditViewController()
- (void)pressSaveButton:(id)sender;
- (void)closeKeyboard:(id)sender;
@end

@implementation EditViewController
@synthesize notification=notification_;

- (void)viewDidLoad{
  [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated{
  if(!notification_){
    notification_ = [[Notification alloc] init];
    self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave 
                                                                                           target:self 
                                                                                           action:@selector(pressSaveButton:)] autorelease];
  }
  [self.tableView reloadData];
  [super viewWillAppear:animated];
}

- (void)dealloc{
  [notification_ release];
  [super dealloc];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
  return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
  return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  NSString *CellIdentifier = [NSString stringWithFormat:@"Cell:%d_%d", indexPath.section, indexPath.row];
  
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  if (cell == nil) {
    int section = indexPath.section;
    cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    EditTableCellViewController* vc = [[[EditTableCellViewController alloc] initWithNibName:@"EditTableCell" bundle:nil] autorelease];
    if(section == 0){
      NSString* icons[] = {@"book", @"movie", @"dvd"};
      NSString* labels[] = {@"BOOK", @"MOVIE", @"MUSIC"};
      for(int i=0;i<3;++i){
        EditIconToggle* kind = [[[EditIconToggle alloc] initWithFrame:CGRectMake(20+70*i, 20, 70, 70)] autorelease];
        
        [kind.toggle setOnImage:[NSString stringWithFormat:@"%@_on.png", icons[i]] 
                       offImage:[NSString stringWithFormat:@"%@_off.png", icons[i]]];
        kind.label.text = labels[i];
        // その種類が含まれていたらONにする
        [kind.toggle setToggle:[notification_.kinds containsIndex:i]];
        [cell addSubview:kind];
      }
    }else if(section == 1){
      // 借りた日
      cell = (UITableViewCell*)vc.view;
      vc.mainLabel.text = [notification_ rentalDayDescription];
    }else if(section == 2){
      // レンタル期間
      cell = (UITableViewCell*)vc.view;
      vc.mainLabel.text = [notification_ periodDescription];
    }else if(section == 3){
      // 返却通知
      cell = (UITableViewCell*)vc.view;
      vc.mainLabel.text = [notification_ alertDescription];
      UIToggle* toggle = [[[UIToggle alloc] initWithFrame:CGRectMake(30, 20, 50, 50)] autorelease];
      [toggle setOnImage:@"on.png" offImage:@"off.png"];
      [cell addSubview:toggle];
    }else if(section == 4){
      // 備考欄
      textField_ = [[[UITextView alloc] initWithFrame:CGRectMake(15, 10, 290, 80)] autorelease];
      textField_.text = notification_.note;
      UIView* accessoryView =[[[UIView alloc] initWithFrame:CGRectMake(0,0,320,50)] autorelease];
      accessoryView.backgroundColor = [UIColor whiteColor];
      
      // ボタンを作成する。
      UIButton* closeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
      closeButton.frame = CGRectMake(210,10,100,30);
      [closeButton setTitle:@"閉じる" forState:UIControlStateNormal];
      // ボタンを押したときによばれる動作を設定する。
      [closeButton addTarget:self action:@selector(closeKeyboard:) forControlEvents:UIControlEventTouchUpInside];
      // ボタンをViewに貼る
      [accessoryView addSubview:closeButton];
      
      textField_.inputAccessoryView = accessoryView;
      [cell addSubview:textField_];
    }
  }
  
  return cell;
}

- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
  NSString* headers[] = {@"種類", @"借りた日", @"レンタル期間", @"返却通知", @"備考"};
  return headers[section];
}

- (void)pressSaveButton:(id)sender{
  // save the notification.
  [[NotificationManager instance] saveWithNotification:notification_];
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
  int section = indexPath.section;
  UIViewController* dateSelectController = [[[UIViewController alloc] init] autorelease];
  dateSelectController.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
  if(section == 1){
    NotificationDatePicker* dp = [[[NotificationDatePicker alloc] initWithNotification:notification_] autorelease];
    dp.datePickerMode = UIDatePickerModeDate;
    dp.maximumDate = [NSDate date];
    [dateSelectController.view addSubview:dp];
    [self.navigationController pushViewController:dateSelectController animated:YES];
  }else if(section == 2){
    PeriodPicker* pp = [[[PeriodPicker alloc] initWithNotification:notification_] autorelease];
    [dateSelectController.view addSubview:pp];
    [self.navigationController pushViewController:dateSelectController animated:YES];
  }else if(section == 3){
    NotifyPicker* np = [[[NotifyPicker alloc] initWithNotification:notification_] autorelease];
    [dateSelectController.view addSubview:np];
    [self.navigationController pushViewController:dateSelectController animated:YES];
  }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
  return 100;
}

-(void)closeKeyboard:(id)sender{
  if([textField_ canResignFirstResponder]){
    [textField_ resignFirstResponder];
  }
}

@end