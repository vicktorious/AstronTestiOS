//
//  PieChartViewController.m
//  AstronTestiOS
//
//  Created by Rajnai Viktor on 1/24/17.
//  Copyright © 2017 Rajnai Viktor. All rights reserved.
//

#import "PieChartViewController.h"

// Implementation of the Prototype Cells
@interface PieChart()

@end

@implementation PieChart

@synthesize sliceNum,slices;

-(id)init {
    self = [super init];
    sliceNum = 0;
    double t[CATEGORY_NUM];
    slices = t;
    return self;
}

-(void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    printf("%s",@"A");
}

@end

@interface PieChartViewController ()

@end

@implementation PieChartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if (people.count > 0) {
        [self setPieChart];
    }
    else {
        [self showDownloadError];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) showDownloadError {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error" message:@"You need to download the list at the Guest List tab" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler: nil];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void) setPieChart {
    int studentCount = 0;
    int workerCount = 0;
    int retiredCount = 0;
    
    for (Person *person in people) {
        // For the switch, I need an int, so 0 refers to student, 1 for worker, 2 for retired
        int ageGroup = person.age < 21 ? 0 : (person.age > 60) ? 2 : 1;
        switch (ageGroup) {
            case 0:
                studentCount++;
                break;
            case 1:
                workerCount++;
                break;
            case 2:
                retiredCount++;
                break;
            default:
                break;
        }
    }
    
    float studentAngle = 360 * studentCount / people.count;
    int workerAngle = 360 * workerCount / people.count;
    int retiredAngle = 360 - studentAngle - workerAngle;
    
    PieChart *pC = [[PieChart alloc]  init];
    
    CGRect r = CGRectMake(0, 0, self.pieCanvasView.bounds.size.width, self.pieCanvasView.bounds.size.height);
    
    pC.frame = r;
    pC.backgroundColor = UIColor.whiteColor;
    
    pC.sliceNum = CATEGORY_NUM;
    pC.slices[0] = studentAngle;
    pC.slices[1] = workerAngle;
    pC.slices[2] = retiredAngle;
    
    [self.pieCanvasView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self.pieCanvasView addSubview:pC];
    [pC setNeedsDisplay];
}

- (IBAction)refresh:(id)sender {
    if (people.count > 0) {
        [self setPieChart];
    } else {
        [self showDownloadError];
    }
    
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
