//
//  NotifyCellViewController.m
//  RentalDayNotifier
//
//  Created by  on 11/10/04.
//  Copyright 2011年 Kawaz. All rights reserved.
//

#import "NotifyCellViewController.h"

@implementation NotifyCellViewController
@synthesize notification=notification_;

- (id)initWithNotification:(Notification *)notification{
  self = [super initWithNibName:@"NotifyCell" bundle:nil];
  if(self){
    notification_ = [notification retain];
  }
  return self;
}

- (void)dealloc{
  [notification_ release];
  [super dealloc];
}

- (void)viewDidUnload{
  [returnButton_ release];
  [rentalLabel_ release];
  [relativeLabel_ release];
  [noteLabel_ release];
  [alertIcon_ release];
  [diskIcon_ release];
  [movieIcon_ release];
  [bookIcon_ release];
  [super viewDidUnload];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    // Custom initialization
  }
  return self;
}

- (void)didReceiveMemoryWarning{
  // Releases the view if it doesn't have a superview.
  [super didReceiveMemoryWarning];
  
  // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
 // Implement loadView to create a view hierarchy programmatically, without using a nib.
 - (void)loadView
 {
 }
 */

/*
 // Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
 - (void)viewDidLoad
 {
 [super viewDidLoad];
 }
 */

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation{
  // Return YES for supported orientations
  return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
