//
//  JAGTouchId.h
//  TouchIdSampler
//
//  Created by Jesus Antonio Gil on 7/1/15.
//  Copyright (c) 2015 Jesus Antonio Gil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <LocalAuthentication/LocalAuthentication.h>

@protocol JAGTouchIdDelegate

- (void)touchIdAuthetication:(BOOL)success error:(NSError *)error;

@end


@interface JAGTouchId : NSObject

@property (weak, nonatomic) id <JAGTouchIdDelegate> delegate;

- (void)startTouchIdAuthetication;

@end
