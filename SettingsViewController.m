//
//  SettingsViewController.m
//  Tipster
//
//  Created by Ruy Gonzalez on 9/13/18.
//  Copyright © 2018 Ruy Gonzalez. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *defaulttipcontrol;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)defaultChanged:(id)sender {
    // calculate tip based on this value and percentage selected
    NSArray *percentages = @[@(0.15), @(0.20), @(0.22)];
    // get percentage based on segment selected
    double tipPercentage = [percentages[self.defaulttipcontrol.selectedSegmentIndex] doubleValue];
    // now save as default using UserDefaults
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setDouble:tipPercentage forKey:@"default_tip_percentage"];
    [defaults synchronize];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
