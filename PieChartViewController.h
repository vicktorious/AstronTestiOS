//
//  PieChartViewController.h
//  AstronTestiOS
//
//  Created by Rajnai Viktor on 1/24/17.
//  Copyright © 2017 Rajnai Viktor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <math.h>
#import <QuartzCore/QuartzCore.h>
#import "Person.h"

@interface PieChartViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *pieCanvasView;
@end

// The Cell contains 2 ImageViews for the AgeGroup defined icons and a label for presenting the name

@interface PieChart : UIView {
    float studentSlice;
    float workerSlice;
    float retiredSlice;
}

@property(nonatomic, readwrite) float studentSlice, workerSlice, retiredSlice;

@end
