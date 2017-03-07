//
//  DatePickerViewController.m
//  OneCardPass
//
//  Created by ming on 2017/2/28.
//  Copyright © 2017年 ming. All rights reserved.
//

#import "DatePickerViewController.h"

@interface DatePickerViewController ()
@property (weak, nonatomic) IBOutlet UIDatePicker *datePickerView;

@end

@implementation DatePickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _datePickerView.backgroundColor = [UIColor whiteColor];
    [_datePickerView setMinimumDate:_miniDate?:nil];
    [_datePickerView setDate:_selectDate?:[NSDate date]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)cancelClick:(id)sender {
    [self dismissViewControllerAnimated:YES completion:NULL];
}
- (IBAction)commitClick:(id)sender {
    NSDate * selectDate = [_datePickerView date];
    NSDateFormatter * formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat = @"yyyy-MM-dd";
    NSString * selectDateStr = [formatter stringFromDate:selectDate];
    if (self.DatePickerBlock) {
        self.DatePickerBlock(selectDate,selectDateStr);
    }
    [self dismissViewControllerAnimated:YES completion:NULL];
}

@end
