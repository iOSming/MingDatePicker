//
//  DatePickerViewController.h
//  OneCardPass
//
//  Created by ming on 2017/2/28.
//  Copyright © 2017年 ming. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DatePickerViewController : UIViewController
@property (nonatomic,strong) NSDate * selectDate;
@property (nonatomic,strong) NSDate * miniDate;
@property (copy,nonatomic) void(^DatePickerBlock)(NSDate * date, NSString * dateStr);
@end
