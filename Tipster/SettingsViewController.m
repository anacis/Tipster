//
//  SettingsViewController.m
//  Tipster
//
//  Created by Ana Cismaru on 6/23/20.
//  Copyright © 2020 anacismaru. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *defaultTipsBar;
@property (weak, nonatomic) IBOutlet UITextField *defaultTipsTextField;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)onValueChanged:(id)sender {
    NSArray *percentages = @[@(0.1), @(0.15), @(0.2), @(0.25)];
    double tipPercentage = [percentages[self.defaultTipsBar.selectedSegmentIndex] doubleValue];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setDouble:tipPercentage forKey:@"default_tip_percentage"];
    [defaults synchronize];
}
- (IBAction)onTextChanged:(id)sender {
    double tipPercentage = [self.defaultTipsTextField.text doubleValue] / 100;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setDouble:tipPercentage forKey:@"default_tip_percentage"];
    [defaults synchronize];
}


@end
