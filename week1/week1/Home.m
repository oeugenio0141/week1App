//
//  Home.m
//  week1
//
//  Created by OPSolutions on 26/10/2019.
//  Copyright © 2019 OPSolutions. All rights reserved.
//

#import "ViewController.h"
#import "Home.h"
#import "Signup.h"

@interface Home ()

@end

@implementation Home

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


- (IBAction)logoutUser:(id)sender {
    
    [self performSegueWithIdentifier:@"index" sender:self];
    
}
@end
