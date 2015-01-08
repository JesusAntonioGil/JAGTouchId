//
//  ViewController.m
//  TouchIdSampler
//
//  Created by Jesus Antonio Gil on 7/1/15.
//  Copyright (c) 2015 Jesus Antonio Gil. All rights reserved.
//

#import "ViewController.h"
#import "JAGTouchId.h"

@interface ViewController () <JAGTouchIdDelegate>

@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

@end


@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - ACTIONS

- (IBAction)onTouchIdButtonTap:(id)sender
{
    JAGTouchId *touchId = [[JAGTouchId alloc] init];
    touchId.delegate = self;
    [touchId startTouchIdAuthetication];
}

#pragma mark - DELEGATES
#pragma mark - TouchID Delegate

- (void)touchIdAuthetication:(BOOL)success error:(NSError *)error
{
    if(success)
    {
        self.resultLabel.textColor = [UIColor greenColor];
        self.resultLabel.text = @"SUCCESS";
    }
    else
    {
        self.resultLabel.textColor = [UIColor redColor];
        self.resultLabel.text = error.localizedDescription;
    }
}

@end
