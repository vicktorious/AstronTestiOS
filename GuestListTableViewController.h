//
//  GuestListTableViewController.h
//  AstronTestiOS
//
//  Created by Rajnai Viktor on 1/24/17.
//  Copyright © 2017 Rajnai Viktor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"

@interface GuestListTableViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate>
    @property (weak, nonatomic, readwrite) IBOutlet UITableView *tv;
    @property (nonatomic, readwrite) NSMutableArray *people;
@end

@interface PersonCell : UITableViewCell
    @property (weak, nonatomic) IBOutlet UIImageView *leftImageView;
    @property (weak, nonatomic) IBOutlet UILabel *nameLabel;
    @property (weak, nonatomic) IBOutlet UIImageView *rightImageView;
@end
