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

- (void)startTouchIdAuthentication
{
    self.context = [[LAContext alloc] init];
    if ([self checkBiometricsAuthentication])
    {
        [self authenticateBiometric];
    }
}

#pragma mark - PRIVATE

- (BOOL)checkBiometricsAuthentication
{
    NSError *error = nil;
    
    if(![self.context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error])
    {
        [self.delegate touchIdAuthentication:NO error:error];
        return NO;
    }
    
    return YES;
}

- (void)authenticateBiometric
{
    [self.context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:@"Place your finger on the sensor" reply:^(BOOL success, NSError *error)
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.delegate touchIdAuthentication:success error:error];
        });

    }];
}

@end
