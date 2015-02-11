//
//  AKLFO.h
//  motionsynth
//
//  Created by Adam Salberg on 2/11/15.
//  Copyright (c) 2015 Adam Salberg. All rights reserved.
//

#import "AKFoundation.h"

@interface AKLFO : AKInstrument

// Instrument Properties
@property AKParameter *amplitude;
@property AKParameter *frequency;
@property AKLowFrequencyOscillatorType *type;

// Audio outlet for global effects processing
//@property (readonly) AKStereoAudio *auxilliaryOutput;

@end

//- (instancetype)initWithFrequency:(float)frequency amplitude:(float)amplitude;

//@end
