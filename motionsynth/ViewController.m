//
//  ViewController.m
//  motionsynth
//
//  Created by Adam Salberg on 2/11/15.
//  Copyright (c) 2015 Adam Salberg. All rights reserved.
//

#import "ViewController.h"
#import "AKLFO.h"
#import "AKTools.h"

@interface ViewController ()

@end

@implementation ViewController {
    AKLowFrequencyOscillator *akLFO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    akLFO = [[AKLowFrequencyOscillator alloc] init];
    [AKOrchestra addInstrument:akLFO];
    [AKOrchestra start];
    
    currentMaxRotX = 0.0;
    currentMaxRotY = 0.0;
    currentMaxRotZ = 0.0;
    
    self.motionManager = [[CMMotionManager alloc] init];
    self.motionManager.gyroUpdateInterval = .2;
    
    [self.motionManager startGyroUpdatesToQueue:[NSOperationQueue currentQueue] withHandler:^(CMGyroData *gyroData, NSError *error) {
        [self outputRotationData:gyroData.rotationRate];
    }];
}

- (void)outputRotationData:(CMRotationRate)rotation {
    [AKTools setProperty:akLFO.frequency withSlider:(UISlider *)sender];
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

- (IBAction)resetMaxValues:(id)sender {
    currentMaxRotX = 0.0;
    currentMaxRotY = 0.0;
    currentMaxRotZ = 0.0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
