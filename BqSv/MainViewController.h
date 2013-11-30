//
//  MainViewController.h
//  BqSv
//
//  Created by 竹下 仁 on 11/07/24.
//  Copyright 2011 office #9. All rights reserved.
//

#import "FlipsideViewController.h"
#import "FlipsideViewController2.h"

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate, FlipsideViewController2Delegate> {
	IBOutlet UITextField *radioActiveName;
    IBOutlet UILabel *kigo;
    IBOutlet UILabel *hangen;
	IBOutlet UITextField *amount;
    IBOutlet UITextField *age;
    IBOutlet UITextField *haveAmount;
    IBOutlet UITextField *haveDays;
	IBOutlet UILabel *outcome;
    IBOutlet UILabel *unit;
    IBOutlet UILabel *outcome2;
    IBOutlet UILabel *unit2;
    IBOutlet UIToolbar *toolBar;
    IBOutlet UILabel *titleRAN;
    IBOutlet UILabel *titleBQ;
    IBOutlet UILabel *titleAGE;
    IBOutlet UILabel *titleHA;
    IBOutlet UILabel *titleHD;
    IBOutlet UILabel *unitHD;
    IBOutlet UILabel *titleHIBAKU;
    IBOutlet UILabel *titleKEIKO;
    IBOutlet UILabel *titleKYUNYU;
    IBOutlet UILabel *guide1;
    IBOutlet UILabel *guide2;
    int rowNumber;
    int rowNumber2;
    char lanType;
}

- (IBAction)showInfo:(id)sender;
- (IBAction)finishEnterAmount;
- (IBAction)finishEnterHaveAmount;
- (IBAction)finishEnterHaveDays;
- (IBAction)showInfo2:(id)sender;
- (IBAction)chgLanJap;
- (IBAction)chgLanEng;
- (BOOL)amountCheck;
- (BOOL)haveAmountCheck;
- (BOOL)haveDaysCheck;
- (void)getOutcome;
- (void)setLabel;

@end

    