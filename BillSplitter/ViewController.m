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
    
    int iPeople = (int)self.amountOfPeopleSlider.value;

    NSNumber* people = [NSNumber numberWithInt:iPeople];
                      
    NSNumber* billAmount = [formatter numberFromString:self.billTextField.text];
    
    NSLog(@"people:%@",people);
    
    NSDecimalNumber* perPerson = [[NSDecimalNumber decimalNumberWithDecimal:[billAmount decimalValue]] decimalNumberByDividingBy:
                                  [NSDecimalNumber decimalNumberWithDecimal:[people decimalValue]]];
    NSLog(@"per person:%@",perPerson);
    
    double tipCalc = [perPerson doubleValue];
    tipCalc = tipCalc * .12;
    NSDecimalNumber* tip = [[NSDecimalNumber alloc] initWithDouble:tipCalc];
    
    NSLog(@"tip:%@", tip);

    NSDecimalNumber* total = [perPerson decimalNumberByAdding:tip];
    
    self.amountLabel.text = [NSString stringWithFormat:@"$%@ per person incl 12%% tip",[formatter stringFromNumber:total]];
}
- (IBAction)peopleSlider:(id)sender {
    
    self.amountOfPeopleLabel.text = [NSString stringWithFormat:@"%.f people",self.amountOfPeopleSlider.value];

}

@end
