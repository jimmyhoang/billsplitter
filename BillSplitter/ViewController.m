//
//  ViewController.m
//  BillSplitter
//
//  Created by Jimmy Hoang on 2017-06-11.
//  Copyright © 2017 Jimmy Hoang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billTextField;
@property (weak, nonatomic) IBOutlet UISlider *amountOfPeopleSlider;
@property (weak, nonatomic) IBOutlet UILabel *amountLabel;
@property (weak, nonatomic) IBOutlet UILabel *amountOfPeopleLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)calculateSplitAmount:(id)sender {
    NSNumberFormatter* formatter = [[NSNumberFormatter alloc] init];

    NSNumber* people = [NSNumber numberWithFloat:self.amountOfPeopleSlider.value];
                      
    NSNumber* billAmount = [formatter numberFromString:self.billTextField.text];
    
    NSDecimalNumber* perPerson = [[NSDecimalNumber decimalNumberWithDecimal:[billAmount decimalValue]] decimalNumberByDividingBy:
                                  [NSDecimalNumber decimalNumberWithDecimal:[people decimalValue]]];
    
    [formatter setMaximumFractionDigits:2];
    [formatter setCurrencyCode:@"CAD"];
    self.amountLabel.text = [NSString stringWithFormat:@"$%@ per person",[formatter stringFromNumber:perPerson]];
}
- (IBAction)peopleSlider:(id)sender {
    
    self.amountOfPeopleLabel.text = [NSString stringWithFormat:@"%.f people",self.amountOfPeopleSlider.value];

}

@end
