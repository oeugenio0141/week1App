//
//  User.m
//  week1
//
//  Created by OPSolutions on 26/10/2019.
//  Copyright © 2019 OPSolutions. All rights reserved.
//

#import "User.h"

@implementation User

- (instancetype)initWithFullName:(NSString *)fullName
                andWithPhoneNumber:(NSString *)phoneNumber
                andWithEmail:(NSString *)email
                andWithPassword:(NSString *)password {
    
    self = [super init];
    
    if (self) {
        _fullName = fullName;
        _phoneNumber = phoneNumber;
        _email = email;
        _password = password;
    }
    return self;
}


- (void)encodeWithCoder:(nonnull NSCoder *)aCoder {
    [aCoder encodeObject:self.fullName forKey:@"fullName"];
    [aCoder encodeObject:self.phoneNumber forKey:@"phoneNumber"];
    [aCoder encodeObject:self.email forKey:@"email"];
    [aCoder encodeObject:self.password forKey:@"password"];
}

- (nullable instancetype)initWithCoder:(nonnull NSCoder *)aDecoder {
    if (self = [super init]) {
        self.fullName = [aDecoder decodeObjectForKey:@"fullName"];
        self.phoneNumber = [aDecoder decodeObjectForKey:@"phoneNumber"];
        self.email = [aDecoder decodeObjectForKey:@"email"];
        self.password = [aDecoder decodeObjectForKey:@"password"];
        
    }
    return self;
}

@end
