//
//  GuestListTableViewController.m
//  AstronTestiOS
//
//  Created by Rajnai Viktor on 1/24/17.
//  Copyright © 2017 Rajnai Viktor. All rights reserved.
//

#import "GuestListTableViewController.h"

@interface PersonCell()

@end

@implementation PersonCell

@end


@interface GuestListTableViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation GuestListTableViewController

@synthesize tv,people;

    NSMutableArray *people;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    tv.delegate = self;
    tv.dataSource = self;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [people count];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tv deselectRowAtIndexPath:indexPath animated:true];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PersonCell" forIndexPath:indexPath];
    
    PersonCell *pCell = (PersonCell*) cell;
    
    Person *p = people[indexPath.row];
    NSString *ageGroup = p.age < 21 ? @"student" : (p.age > 60) ? @"retired" : @"worker";
    
    pCell.nameLabel.text = [[p.firstName stringByAppendingString:@" " ] stringByAppendingString:p.lastName];
    [pCell.leftImageView setImage:([p.gender  isEqual: @"male"]) ? NULL : [UIImage imageNamed:ageGroup]];
    [pCell.rightImageView setImage:([p.gender  isEqual: @"female"]) ? NULL : [UIImage imageNamed:ageGroup]];
    
    return pCell;
}

- (IBAction)refresh:(id)sender {
    
    NSURL *url = [NSURL URLWithString:@"http://mash1.astron.hu:23985/recruiting/attendees"];
    
    NSURLSessionDataTask *downloadTask = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            NSString *responseString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            printf("%s", [responseString cStringUsingEncoding:NSUTF8StringEncoding]);
        
            NSArray* message = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:NULL];
        
            self.people = [[NSMutableArray alloc] initWithCapacity:[message count]];
        
            for (NSDictionary* msg in message) {
                
                Person *newPerson = [[Person alloc] init];
                NSDictionary* name = msg[@"name"];
                newPerson.firstName = name[@"firstname"];
                newPerson.lastName = name[@"lastname"];
                newPerson.gender = msg[@"gender"];
                newPerson.age = [msg[@"age"] doubleValue];
                [self.people addObject:newPerson];
            }
        
            NSArray *sortedArray;
            sortedArray = [self.people sortedArrayUsingComparator:^NSComparisonResult(id a, id b) {
                NSString *first = [(Person*)a lastName];
                NSString *second = [(Person*)b lastName];
                return [first compare:second];
            }];
        
            self.people = [sortedArray mutableCopy];
        
            [self.tv reloadData];
        }];
    
    [downloadTask resume];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
