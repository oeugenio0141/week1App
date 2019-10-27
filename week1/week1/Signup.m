//
//  Signup.m
//  week1
//
//  Created by OPSolutions on 26/10/2019.
//  Copyright © 2019 OPSolutions. All rights reserved.
//

#import "Signup.h"
#import "ViewController.h"
#import "Home.h"
#import "User.h"

@interface Signup (){
    
}


@end

@implementation Signup

- (void)viewDidLoad {
    [super viewDidLoad];
    //[self clearDefaults];
    
}


//Condition if fields are empty
- (IBAction)registerUser:(id)sender {
    
    if([_fullNameField.text isEqualToString:@""] || [_phoneNumberField.text isEqualToString:@""] || [_emailField.text isEqualToString:@""] || [_passwordField.text isEqualToString:@""] || [_confirmPasswordField.text isEqualToString:@""]){
        
        UIAlertController *error = [UIAlertController alertControllerWithTitle:@"Ooops" message:@"You must complete all the fields" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *okay = [UIAlertAction actionWithTitle:@"Okay" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){}];
        
        [error addAction:okay];
        [self presentViewController:error animated:YES completion:nil];
        
    }else{
        [self checkPasswordMatch];
    }

}


//Condition to confirm if password's are matched

-(void)checkPasswordMatch{
    
    if( [_passwordField.text isEqualToString:_confirmPasswordField.text] ){
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        //[self registerNewUser];
        //[self registerNewUserArray];
        
        NSString *fullName = _fullNameField.text;
        NSString *phoneNumber = _phoneNumberField.text;
        NSString *email = _emailField.text;
        NSString *password = _passwordField.text;
        
        User *myUsers = [[User alloc] initWithFullName:fullName andWithPhoneNumber:phoneNumber andWithEmail:email andWithPassword:password];
        
        NSMutableArray *userArray = [[NSMutableArray alloc]init];

        [userArray addObject:myUsers];
        
        [self encodeUserArrayData:userArray];
        
        //[self decodeUserArrayData];
        
        UIAlertController *success = [UIAlertController alertControllerWithTitle:@"Success" message:@"Successfully registered!!" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *proceed = [UIAlertAction actionWithTitle:@"Proceed" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){
            
            [self performSegueWithIdentifier:@"home" sender:self];
            
            NSLog(@"NSDefaults = %@", defaults);
            
            
            
        }];
        
        [success addAction:proceed];
        
        [self presentViewController:success animated:YES completion:nil];
        
        
    }else{
        
        UIAlertController *error = [UIAlertController alertControllerWithTitle:@"Ooops" message:@"Password did not match!" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *tryAgain = [UIAlertAction actionWithTitle:@"Try Again" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){}];
        
        [error addAction:tryAgain];
        
        [self presentViewController:error animated:YES completion:nil];
    }
    
    
}

//Encode Array to Defaults
- (void)encodeUserArrayData:(NSMutableArray *)userArray {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:userArray requiringSecureCoding:NO error:nil];
    
    [defaults setObject:data forKey:@"arrayOfUsers"];
    
}

//Decode and returning Array of Users
- (NSMutableArray *)decodeUserArrayData {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSData *newData = [defaults objectForKey:@"arrayOfUsers"];
    
    NSMutableArray *decodedUserArray = [NSKeyedUnarchiver unarchiveObjectWithData:newData];
    
    return decodedUserArray;
    
}


-(void)registerNewUser{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setObject:_emailField.text forKey:@"email"];
    [defaults setObject:_passwordField.text forKey:@"password"];
    [defaults setBool:YES forKey:@"registered"];
    
    [defaults synchronize];
    
    UIAlertController *success = [UIAlertController alertControllerWithTitle:@"Success" message:@"Successfully Registered!" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okay = [UIAlertAction actionWithTitle:@"Okay" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){
        
        [self performSegueWithIdentifier:@"home" sender:self];
        
    }];
    
    [success addAction:okay];
    [self presentViewController:success animated:YES completion:nil];
    
}


-(void)clearDefaults{
    [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:[[NSBundle mainBundle] bundleIdentifier]];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
@end
