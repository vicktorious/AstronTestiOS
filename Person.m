//
//  Person.m
//  AstronTestiOS
//
//  Created by Rajnai Viktor on 1/25/17.
//  Copyright © 2017 Rajnai Viktor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

@interface Person ()

@end

@implementation Person

@synthesize firstName,lastName,gender,age;

-(id)init {
    self = [super init];
    firstName = @"";
    lastName = @"";
    gender = @"";
    age = 0;
    return self;
}

@end
