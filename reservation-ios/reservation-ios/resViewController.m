//
//  resViewController.m
//  reservation-ios
//
//  Created by Wesley Reisz on 3/31/13.
//  Copyright (c) 2013 com.wesleyreisz. All rights reserved.
//

#import "resViewController.h"

@interface resViewController ()
@end

@implementation resViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	NSString *urlString  = [NSString stringWithFormat:@"http://demo.wesleyreisz.com/api/reservation"];
    NSURL *url = [NSURL URLWithString:urlString];
    NSData *data = [NSData dataWithContentsOfURL:url];
    NSError *error;
    self.ds = (NSMutableArray*)[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    
    NSLog(@"%@",[self.ds description]);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
