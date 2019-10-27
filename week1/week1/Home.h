//
//  Home.h
//  week1
//
//  Created by OPSolutions on 26/10/2019.
//  Copyright © 2019 OPSolutions. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Home : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *logoutBtn;

- (IBAction)logoutUser:(id)sender;

@end

NS_ASSUME_NONNULL_END
