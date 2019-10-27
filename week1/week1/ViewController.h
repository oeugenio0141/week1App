//
//  ViewController.h
//  week1
//
//  Created by OPSolutions on 26/10/2019.
//  Copyright © 2019 OPSolutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Signup.h"
#import "Home.h"


@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

- (IBAction)LoginUser:(id)sender;

@end

