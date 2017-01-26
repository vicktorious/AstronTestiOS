//
//  PieChartViewController.h
//  AstronTestiOS
//
//  Created by Rajnai Viktor on 1/24/17.
//  Copyright © 2017 Rajnai Viktor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"

@interface PieChartViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *pieCanvasView;
@end

// The Cell contains 2 ImageViews for the AgeGroup defined icons and a label for presenting the name

#define CATEGORY_NUM 3

@interface PieChart : UIView {
    int sliceNum;
    double *slices;
}
@property(nonatomic, readwrite) int sliceNum;
@property(nonatomic, readwrite) double *slices;

@end
