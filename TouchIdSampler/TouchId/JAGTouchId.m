//
//  JAGTouchId.m
//  TouchIdSampler
//
//  Created by Jesus Antonio Gil on 7/1/15.
//  Copyright (c) 2015 Jesus Antonio Gil. All rights reserved.
//

#import "JAGTouchId.h"


@interface JAGTouchId ()

@property (strong, nonatomic) LAContext *context;

@end


@implementation JAGTouchId

#pragma mark - PUBLIC

- (void)startTouchIdAuthetication
{
    self.context = [[LAContext alloc] init];
    if ([self checkBiometricsAuthetication])
    {
        [self authenticateBiometric];
    }
}

#pragma mark - PRIVATE

- (BOOL)checkBiometricsAuthetication
{
    NSError *error = nil;
    
    if(![self.context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error])
    {
        [self.delegate touchIdAuthetication:NO error:error];
        return NO;
    }
    
    return YES;
}

- (void)authenticateBiometric
{
    [self.context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:@"Place your finguer on the sensor" reply:^(BOOL success, NSError *error)
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.delegate touchIdAuthetication:success error:error];
        });

    }];
}

@end
