//
//  User.h
//  week1
//
//  Created by OPSolutions on 26/10/2019.
//  Copyright © 2019 OPSolutions. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface User : NSObject <NSCoding>

@property (nonatomic, strong) NSString *fullName;
@property (nonatomic, strong) NSString *phoneNumber;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *password;

- (instancetype)initWithFullName:(NSString *)fullName
              andWithPhoneNumber:(NSString *)phoneNumber
                    andWithEmail:(NSString *)email
                 andWithPassword:(NSString *)password;

- (void)encodeWithCoder:(nonnull NSCoder *)aCoder;

- (nullable instancetype)initWithCoder:(nonnull NSCoder *)aDecoder;

@end

NS_ASSUME_NONNULL_END
