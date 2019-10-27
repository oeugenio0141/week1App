//
//  ViewController.m
//  week1
//
//  Created by OPSolutions on 26/10/2019.
//  Copyright © 2019 OPSolutions. All rights reserved.
//

#import "ViewController.h"
#import "Signup.h"
#import "Home.h"
#import "User.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

// Check if fields are empty
- (IBAction)LoginUser:(id)sender {

    if([_emailField.text isEqualToString:@""] || [_passwordField.text isEqualToString:@""]){
        
        UIAlertController *error = [UIAlertController alertControllerWithTitle:@"Ooops" message:@"You must complete all the fields" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *okay = [UIAlertAction actionWithTitle:@"Okay" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){}];
        
        [error addAction:okay];
        [self presentViewController:error animated:YES completion:nil];
        
    }else{
        [self checkAccountMatch];
    }

}

//
-(void)checkAccountMatch{
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    
    if([_emailField.text isEqualToString:[defaults objectForKey:@"email"]] && [_passwordField.text isEqualToString:[defaults objectForKey:@"password"]]){
        
        UIAlertController *success = [UIAlertController alertControllerWithTitle:@"Success" message:@"Successfully logged in" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *proceed = [UIAlertAction actionWithTitle:@"Proceed" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){
            
            [self performSegueWithIdentifier:@"home2" sender:self];
            
        }];
        
        [success addAction:proceed];
        [self presentViewController:success animated:YES completion:nil];
        
        
    }else{
        
        UIAlertController *error = [UIAlertController alertControllerWithTitle:@"Ooops" message:@"Username and Password did not match!" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *tryAgain = [UIAlertAction actionWithTitle:@"Try Again" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){}];
        
        [error addAction:tryAgain];
        [self presentViewController:error animated:YES completion:nil];

       
    }
   
}


//Decode and returning Array of Users
- (NSMutableArray *)decodeUserArrayData {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSData *newData = [defaults objectForKey:@"arrayOfUsers"];
    
    NSMutableArray *decodedUserArray = [NSKeyedUnarchiver unarchiveObjectWithData:newData];
    
    return decodedUserArray;
    
}



@end
