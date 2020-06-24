//
//  ViewController.m
//  Tipster
//
//  Created by Ana Cismaru on 6/23/20.
//  Copyright © 2020 anacismaru. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setDouble:0.1 forKey:@"default_tip_percentage"];
    [defaults synchronize];
}

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
}
- (IBAction)onEdit:(id)sender {
    double bill = [self.billField.text doubleValue];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    double tipPercentage = [defaults doubleForKey:@"default_tip_percentage"];
    double tip = tipPercentage * bill;
    double total = bill + tip;
    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f", tip];
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", total];
}


- (IBAction)onEditingBegin:(id)sender {
    [UIView animateWithDuration:0.2 animations:^{
        self.billField.frame = CGRectMake(self.billField.frame.origin.x, self.billField.frame.origin.y + 30, self.billField.frame.size.width, self.billField.frame.size.height);
        self.totalLabel.alpha = 0;
        self.tipLabel.alpha = 0;
    }];
    
}

- (IBAction)onEditingEnd:(id)sender {
    CGRect newFrame = self.billField.frame;
    newFrame.origin.y -= 30;
    [UIView animateWithDuration:0.2 animations:^{
        self.billField.frame = newFrame;
        self.totalLabel.alpha = 1;
        self.tipLabel.alpha = 1;
    }];
}


@end
