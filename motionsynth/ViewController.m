//
//  ViewController.m
//  motionsynth
//
//  Created by Adam Salberg on 2/11/15.
//  Copyright (c) 2015 Adam Salberg. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    currentMaxRotX = 0;
    currentMaxRotY = 0;
    currentMaxRotZ = 0;
    
    self.motionManager = [[CMMotionManager alloc] init];
    self.motionManager.gyroUpdateInterval = .2;
    
    [self.motionManager startGyroUpdatesToQueue:[NSOperationQueue currentQueue] withHandler:^(CMGyroData *gyroData, NSError *error) {
        [self outputRotationData:gyroData.rotationRate];
    }];
}

- (void)outputRotationData:(CMRotationRate)rotation {
    self.rotX.text = [NSString stringWithFormat:@" %.2fr/s", rotation.x];
    if(fabs(rotation.x) > fabs(currentMaxRotX))
    {
        currentMaxRotX = rotation.x;
    }
    
    self.rotY.text = [NSString stringWithFormat:@" %.2fr/s", rotation.y];
    if(fabs(rotation.y) > fabs(currentMaxRotY))
    {
        currentMaxRotY = rotation.y;
    }
    
    self.rotZ.text = [NSString stringWithFormat:@" %.2fr/s", rotation.z];
    if(fabs(rotation.z) > fabs(currentMaxRotZ))
    {
        currentMaxRotZ = rotation.z;
    }
    
    self.maxRotX.text = [NSString stringWithFormat:@" %.2f", currentMaxRotX];
    self.maxRotY.text = [NSString stringWithFormat:@" %.2f", currentMaxRotY];
    self.maxRotZ.text = [NSString stringWithFormat:@" %.2f", currentMaxRotZ];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
