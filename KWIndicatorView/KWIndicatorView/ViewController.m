//
//  ViewController.m
//  KWIndicatorView
//
//  Created by Konrad Winkowski on 8/2/16.
//  Copyright © 2016 KonradWinkowski. All rights reserved.
//

#import "ViewController.h"
#import "KWIndicatorView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet KWIndicatorView *pulseView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)didTapPulse:(id)sender {
    [self.pulseView pulse];
}

@end
