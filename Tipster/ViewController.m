//
//  ViewController.m
//  Tipster
//
//  Created by Ruy Gonzalez on 8/24/18.
//  Copyright © 2018 Ruy Gonzalez. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

// create outlets for views
@property (weak, nonatomic) IBOutlet UITextField *billField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;

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

// called when screen is tapped
- (IBAction)onTap:(id)sender {
    // print something in log to show that screen was clicked
    NSLog(@"Screen tapped");
    // want to dismiss keyboard when screen tapped and keyboard open
    [self.view endEditing:YES]; // same as self.view.endEditing(true) in java syntax wise
}

// called when edit text thing is clicked and something is changed or when percentages segment control is changed
- (IBAction)onEdit:(id)sender {
    // get value of bill typed in by user
    double bill = [self.billField.text doubleValue];
    
    // calculate tip based on this value and percentage selected
    NSArray *percentages = @[@(0.15), @(0.20), @(0.22)];
    // get percentage based on segment selected
    double tipPercentage = [percentages[self.tipControl.selectedSegmentIndex] doubleValue];
    double tip = tipPercentage * bill;
    double total = bill + tip;
    
    // change values in labels
    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f", tip];
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", total];
}

- (IBAction)onEditingBegin:(id)sender {
    // animation so that when editing is begun on the bill text field, the text field animates by changing location
    // wraps move, to animate it
    [UIView animateWithDuration:0.2 animations:^{
        self.billField.frame = CGRectMake(self.billField.frame.origin.x, self.billField.frame.origin.y + 30, self.billField.frame.size.width, self.billField.frame.size.height);
        self.tipLabel.alpha = 0; // fade away
    }];
}

- (IBAction)onEditingEnd:(id)sender {
    // animates the textfield back
    CGRect newFrame = self.billField.frame;
    newFrame.origin.y -= 30;
    
    // wraps move, to animate it
    [UIView animateWithDuration:0.2 animations:^{
        self.billField.frame = newFrame;
        self.tipLabel.alpha = 1; // fade back in when done editing
    }];
    
}

@end
