//
//  NotifyCellViewController.m
//  RentalDayNotifier
//
//  Created by  on 11/10/04.
//  Copyright 2011年 Kawaz. All rights reserved.
//

#import "NotifyCellViewController.h"
#import "DatePatch.h"

@implementation NotifyCellViewController
@synthesize notification=notification_, returnButton=returnButton_, rentalLabel=rentalLabel_, 
relativeLabel=relativeLabel_, noteLabel=noteLabel_, alertIcon=alertIcon_, 
diskIcon=diskIcon_, movieIcon=movieIcon_, bookIcon=bookIcon_;

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

- (void)viewWillAppear:(BOOL)animated{
  [super viewWillAppear:animated];
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


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad{
  rentalLabel_.text = [notification_.returnDay dayDescription];
  relativeLabel_.text = [notification_ relativeDescription];
  noteLabel_.text   = notification_.note;
  alertIcon_.hidden = !notification_.alertEnable;
  UIImageView* icons[] = {diskIcon_, movieIcon_, bookIcon_};
  for(int i=0;i<3;++i){
    icons[i].hidden = ![notification_.kinds containsIndex:i];
  }
  [super viewDidLoad];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation{
  // Return YES for supported orientations
  return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
