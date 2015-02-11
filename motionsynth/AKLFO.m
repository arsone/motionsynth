//
//  AKLFO.m
//  motionsynth
//
//  Created by Adam Salberg on 2/11/15.
//  Copyright (c) 2015 Adam Salberg. All rights reserved.
//

#import "AKLFO.h"

@implementation AKLFO

- (instancetype)init
{
    self = [super init];
    if (self) {
        _frequency = [[AKInstrumentProperty alloc] initWithValue:440 minimum:110 maximum:920];
        _amplitude = [[AKInstrumentProperty alloc] initWithValue:1];
        
        [self addProperty:_frequency];
        [self addProperty:_amplitude];
        
        AKLowFrequencyOscillator *akLFO;
        akLFO = [[AKLowFrequencyOscillator alloc] init];
        akLFO.frequency = _frequency;
        akLFO.amplitude = _amplitude;
        [self connect: akLFO];
        
        AKAudioOutput *audioOutput = [[AKAudioOutput alloc] initWithAudioSource:akLFO];
        [self connect:audioOutput];
        
    }
    return self;
}
@end