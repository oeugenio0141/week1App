//
//  Signup.h
//  week1
//
//  Created by OPSolutions on 26/10/2019.
//  Copyright © 2019 OPSolutions. All rights reserved.
//

#import <UIKit/UIKit.h>



NS_ASSUME_NONNULL_BEGIN

@interface Signup : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *fullNameField;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumberField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UITextField *confirmPasswordField;
@property (weak, nonatomic) IBOutlet UIButton *registerBtn;
@property (nonatomic, strong) NSMutableArray *userArray;




- (IBAction)registerUser:(id)sender;


@end

NS_ASSUME_NONNULL_END
