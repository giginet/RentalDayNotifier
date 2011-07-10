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

@implementation EditViewController

- (void)viewDidLoad{
  self.view.backgroundColor = [UIColor blackColor];
  self.tableView.separatorColor = [UIColor blackColor];
  [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated{
  if(!notification_){
    notification_ = [[Notification alloc] init];
  }
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
      cell.backgroundColor = [UIColor blackColor];
    }else if(section == 1){
      // 借りた日
      EditTableCellViewController* vc = [[[EditTableCellViewController alloc] initWithNibName:@"EditTableCell" bundle:nil] autorelease];
      cell = (UITableViewCell*)vc.view;
      vc.mainLabel.text = [notification_ rentalDayDescription];
    }else if(section == 2){
      // レンタル期間
      EditTableCellViewController* vc = [[[EditTableCellViewController alloc] initWithNibName:@"EditTableCell" bundle:nil] autorelease];
      cell = (UITableViewCell*)vc.view;
      vc.mainLabel.text = [notification_ periodDescription];
    }else if(section == 3){
      // 返却通知
      EditTableCellViewController* vc = [[[EditTableCellViewController alloc] initWithNibName:@"EditTableCell" bundle:nil] autorelease];
      cell = (UITableViewCell*)vc.view;
      vc.mainLabel.text = [notification_ alertDescription];
      UIToggle* toggle = [[[UIToggle alloc] initWithFrame:CGRectMake(40, 20, 50, 50)] autorelease];
      [toggle setOnImage:@"on.png" offImage:@"off.png"];
      [cell addSubview:toggle];
    }else if(section == 4){
      // 備考欄
      UITextView* txf = [[[UITextView alloc] initWithFrame:CGRectMake(15, 10, 290, 80)] autorelease];
      txf.text = notification_.note;
      [cell addSubview:txf];
    }
  }
  
  return cell;
}

- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
  NSString* headers[] = {@"種類", @"借りた日", @"レンタル期間", @"返却通知", @"備考"};
  return headers[section];
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }   
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }   
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  // Navigation logic may go here. Create and push another view controller.
  /*
   <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
   // ...
   // Pass the selected object to the new view controller.
   [self.navigationController pushViewController:detailViewController animated:YES];
   [detailViewController release];
   */
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
  return 100;
}

@end