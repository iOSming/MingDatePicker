//
//  RootTableViewController.m
//  MingDatePicker
//
//  Created by ming on 2017/3/7.
//  Copyright © 2017年 ming. All rights reserved.
//

#import "RootTableViewController.h"
#import "DatePickerViewController.h"
#import "PresentTransition.h"
#import "DismissTransition.h"
@interface RootTableViewController ()<UIViewControllerTransitioningDelegate>
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@end

@implementation RootTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

//static tableview

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self performSegueWithIdentifier:@"ShowDatePickerSegue" sender:self];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"ShowDatePickerSegue"]) {
        
        DatePickerViewController * datepickerVc = segue.destinationViewController;
        datepickerVc.selectDate = [NSDate date];
        datepickerVc.miniDate = [NSDate date];
        datepickerVc.transitioningDelegate = self;
        datepickerVc.modalPresentationStyle = UIModalPresentationCustom;
        [datepickerVc setDatePickerBlock:^(NSDate * date, NSString * dateStr) {
            _dateLabel.text = dateStr;
        }];
    }
}
#pragma mark - transitioningDelegate
- ( id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                   presentingController:(UIViewController *)presenting
                                                                       sourceController:(UIViewController *)source{
    PresentTransition * present = [PresentTransition new];
    return present;
}
- ( id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    DismissTransition * dismiss = [DismissTransition new];
    return dismiss;
}


@end
