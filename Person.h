//
//  Person.h
//  AstronTestiOS
//
//  Created by Rajnai Viktor on 1/25/17.
//  Copyright © 2017 Rajnai Viktor. All rights reserved.
//

#ifndef Person_h
#define Person_h

@interface Person : NSObject {
    NSString *firstName;
    NSString *lastName;
    NSString *gender;
    int age;
}
@property(nonatomic, readwrite) NSString* firstName;
@property(nonatomic, readwrite) NSString* lastName;
@property(nonatomic, readwrite) NSString* gender;
@property(nonatomic, readwrite) int age;

@end

extern NSMutableArray *people;

#endif /* Person_h */
