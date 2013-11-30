//
//  MainViewController.m
//  BqSv
//
//  Created by 竹下 仁 on 11/07/24.
//  Copyright 2011 office #9. All rights reserved.
//

#import "MainViewController.h"

@implementation MainViewController

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidLoad {
	[super viewDidLoad];
	radioActiveName.userInteractionEnabled = NO;
    age.userInteractionEnabled = NO;
    rowNumber = 0;
    rowNumber2 = 5;
    lanType = 'J';
}

- (IBAction)showInfo:(id)sender {    
	
	FlipsideViewController *controller = [[FlipsideViewController alloc] initWithNibName:@"FlipsideView" bundle:nil];
	controller.delegate = self;
    controller.lanType1 = lanType;
	
	controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
	[self presentModalViewController:controller animated:YES];
	
}

- (IBAction)showInfo2:(id)sender {    
	
	FlipsideViewController2 *controller = [[FlipsideViewController2 alloc] initWithNibName:@"FlipsideView2" bundle:nil];
	controller.delegate = self;
    controller.lanType2 = lanType;
	
	controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
	[self presentModalViewController:controller animated:YES];
	
}

// 放射性物質選択後の動作
- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller
{
	
	radioActiveName.text = [NSString stringWithFormat: @"%@", controller.radioActive];
    rowNumber = controller.choiceNo;

    if (rowNumber == 0) {
        if (lanType == 'J') {
            radioActiveName.text = @"ヨウ素129";
        } else {
            radioActiveName.text = @"Iodine129";
        }
    }

    [self setLabel];
    [self getOutcome];
    [self dismissModalViewControllerAnimated:YES];
}

// 年齢選択後の動作
- (void)flipsideViewController2DidFinish:(FlipsideViewController2 *)controller2
{
	
	age.text = [NSString stringWithFormat: @"%@", controller2.age];
    rowNumber2 = controller2.choiceNo2;

    if (rowNumber2 == 0) {
        if (lanType == 'J') {
            age.text = @"0-1歳";
        } else {
            age.text = @"0-1 y/o";
        }
    }
    
    [self getOutcome];
    [self dismissModalViewControllerAnimated:YES];
}

// ラベル設定
- (void)setLabel {

    switch (rowNumber) {
        case 0:
            kigo.text = @"I-129";
            if (lanType == 'J') {
                hangen.text = @"半減期：1570万年";
            } else {
                hangen.text = @"half-life：15.7mil years";
            }
            break;
        case 1:
            kigo.text = @"I-131";
            if (lanType == 'J') {
                hangen.text = @"半減期：8.04日";
            } else {
                hangen.text = @"half-life：8.04 days";
            }
            break;
        case 2:
            kigo.text = @"Cs-134";
            if (lanType == 'J') {
                hangen.text = @"半減期：2.06年";
            } else {
                hangen.text = @"half-life：2.06 years";
            }
            break;
        case 3:
            kigo.text = @"Cs-137";
            if (lanType == 'J') {
                hangen.text = @"半減期：30.0年";
            } else {
                hangen.text = @"half-life：30.0 years";
            }
            break;
        case 4:
            kigo.text = @"Pu-238";
            if (lanType == 'J') {
                hangen.text = @"半減期：87.7年";
            } else {
                hangen.text = @"half-life：87.7 years";
            }
            break;
        case 5:
            kigo.text = @"Pu-239";
            if (lanType == 'J') {
                hangen.text = @"半減期：2.41万年";
            } else {
                hangen.text = @"half-life：24100 years";
            }
            break;
        case 6:
            kigo.text = @"Pu-240";
            if (lanType == 'J') {
                hangen.text = @"半減期：6540年";
            } else {
                hangen.text = @"half-life：6540 years";
            }
            break;
        case 7:
            kigo.text = @"Sr-90";
            if (lanType == 'J') {
                hangen.text = @"半減期：29.1年";
            } else {
                hangen.text = @"half-life：29.1 years";
            }
            break;
        case 8:
            kigo.text = @"U-235";
            if (lanType == 'J') {
                hangen.text = @"半減期：7.04億年";
            } else {
                hangen.text = @"half-life：704mil years";
            }
            break;
        case 9:
            kigo.text = @"U-238";
            if (lanType == 'J') {
                hangen.text = @"半減期：44.7億年";
            } else {
                hangen.text = @"half-life：4.47bln years";
            }
            break;            
        default:
            break;
    }
        
}

// amount入力後
- (IBAction)finishEnterAmount {
    
    // amount（ベクレル数）の入力値チェック
    if ([self amountCheck]) {
        // haveAmount（毎日の摂取量）の入力値チェック
        if ([self haveAmountCheck]) {
            // haveDays（摂取日数）の入力値チェック
            if ([self haveDaysCheck]) {
                // 結果取得
                [self getOutcome];
            }
        }
    }
}

// haveAmount（毎日の摂取量）入力後
- (IBAction)finishEnterHaveAmount {
    
    // haveAmount（毎日の摂取量）の入力値チェック
    if ([self haveAmountCheck]) {
        // amount（ベクレル数）の入力値チェック
        if ([self amountCheck]) {
            // haveDays（摂取日数）の入力値チェック
            if ([self haveDaysCheck]) {
                // 結果取得
                [self getOutcome];
            }
        }
    }
}

// haveDays（摂取日数）入力後
- (IBAction)finishEnterHaveDays {
    
    // haveDays（摂取日数）の入力値チェック
    if ([self haveDaysCheck]) {
        // amount（ベクレル数）の入力値チェック
        if ([self amountCheck]) {
            // haveAmount（毎日の摂取量）の入力値チェック
            if ([self haveAmountCheck]) {
                // 結果取得
                [self getOutcome];
            }
        }
    }
}

// amount（ベクレル数）の入力値チェック
- (BOOL)amountCheck {
    NSString *checkAmount = [amount text];
    int amount_l = [checkAmount length];
    BOOL b = FALSE;
    if (amount_l == 0) {
        b = TRUE;
    } else {
        for (int i = 0; i < amount_l; i++ ) {
            NSString *str = [[checkAmount substringFromIndex:i] substringToIndex:1];
            const char *c = [str cStringUsingEncoding:NSASCIIStringEncoding];
            if (c == NULL) {
                b = FALSE;
                break;
            }
//            if (((c[0] >= 0x30) && (c[0] <= 0x39)) || c[0] == 0x2E) {
            if ((c[0] >= 0x30) && (c[0] <= 0x39)) {                b = TRUE;
            } else {
                b = FALSE;
                break;
            }
        }
    }
    if (b) {
        double Amount = [[amount text] doubleValue];
        if ((Amount > 9999999) || (Amount < 0)) {
            b = FALSE;
            if (lanType == 'J') {
                UIAlertView *alert = [[UIAlertView alloc]
                                      initWithTitle:@""
                                      message:@"ベクレル数は０〜９９９９９９９の範囲で指定して下さい"
                                      delegate:nil
                                      cancelButtonTitle:@"OK"
                                      otherButtonTitles:nil, nil];
                [alert show];
                [alert release];
            } else {                
                UIAlertView *alert = [[UIAlertView alloc]
                                      initWithTitle:@""
                                      message:@"Please specify Becquerel in 0 to 9999999"
                                      delegate:nil
                                      cancelButtonTitle:@"OK"
                                      otherButtonTitles:nil, nil];
                [alert show];
                [alert release];
            }
        }
    } else {
        if (lanType == 'J') {
            UIAlertView *alert = [[UIAlertView alloc]
                                  initWithTitle:@""
                                  message:@"ベクレル数には整数値を入力して下さい"
                                  delegate:nil
                                  cancelButtonTitle:@"OK"
                                  otherButtonTitles:nil, nil];
            [alert show];
            [alert release];
        } else {
            UIAlertView *alert = [[UIAlertView alloc]
                                  initWithTitle:@""
                                  message:@"Please input an integer into Becquerel"
                                  delegate:nil
                                  cancelButtonTitle:@"OK"
                                  otherButtonTitles:nil, nil];
            [alert show];
            [alert release];
        }
    }
    return b;
}

// haveAmountの入力値チェック
- (BOOL)haveAmountCheck {
    NSString *checkHaveAmount = [haveAmount text];
    int haveAmount_l = [checkHaveAmount length];
    BOOL b = FALSE;
    for (int i = 0; i < haveAmount_l; i++ ) {
        NSString *str = [[checkHaveAmount substringFromIndex:i] substringToIndex:1];
        const char *c = [str cStringUsingEncoding:NSASCIIStringEncoding];
        if (c == NULL) {
            b = FALSE;
            break;
        }
//        if (((c[0] >= 0x30) && (c[0] <= 0x39)) || c[0] == 0x2E) {
        if ((c[0] >= 0x30) && (c[0] <= 0x39)) {
            b = TRUE;
        } else {
            b = FALSE;
            break;
        }
    }
    if (b) {
        double hvAmount = [[haveAmount text] doubleValue];
        if ((hvAmount > 1000) || (hvAmount < 0)) {
            b = FALSE;
            if (lanType == 'J') {
                UIAlertView *alert = [[UIAlertView alloc]
                                      initWithTitle:@""
                                      message:@"摂取量(g)は０〜１０００gの範囲で指定して下さい"
                                      delegate:nil
                                      cancelButtonTitle:@"OK"
                                      otherButtonTitles:nil, nil];
                [alert show];
                [alert release];
            } else {
                UIAlertView *alert = [[UIAlertView alloc]
                                      initWithTitle:@""
                                      message:@"Please specify Intake/Day in 0 to 1000g"
                                      delegate:nil
                                      cancelButtonTitle:@"OK"
                                      otherButtonTitles:nil, nil];
                [alert show];
                [alert release];                
            }
        }
    } else {
        if (lanType == 'J') {
            UIAlertView *alert = [[UIAlertView alloc]
                                  initWithTitle:@""
                                  message:@"摂取量(g)には整数値を入力して下さい"
                                  delegate:nil
                                  cancelButtonTitle:@"OK"
                                  otherButtonTitles:nil, nil];
            [alert show];
            [alert release];
        } else {
            UIAlertView *alert = [[UIAlertView alloc]
                                  initWithTitle:@""
                                  message:@"Please input an integer into Intake/Day"
                                  delegate:nil
                                  cancelButtonTitle:@"OK"
                                  otherButtonTitles:nil, nil];
            [alert show];
            [alert release];
        }
    }
    return b;
}

// haveDaysの入力値チェック
- (BOOL)haveDaysCheck {
    NSString *checkHaveDays = [haveDays text];
    int haveDays_l = [checkHaveDays length];
    BOOL b = FALSE;
    for (int i = 0; i < haveDays_l; i++ ) {
        NSString *str = [[checkHaveDays substringFromIndex:i] substringToIndex:1];
        const char *c = [str cStringUsingEncoding:NSASCIIStringEncoding];
        if (c == NULL) {
            b = FALSE;
            break;
        }
        if ((c[0] >= 0x30) && (c[0] <= 0x39)) {
            b = TRUE;
        } else {
            b = FALSE;
            break;
        }
    }
    if (b) {
        int hvDays = [[haveDays text] intValue];
        if ((hvDays > 365) || (hvDays < 1)) {
            b = FALSE;
            if (lanType == 'J') {
                UIAlertView *alert = [[UIAlertView alloc]
                                      initWithTitle:@""
                                      message:@"日数は１〜３６５の間で指定して下さい"
                                      delegate:nil
                                      cancelButtonTitle:@"OK"
                                      otherButtonTitles:nil, nil];
                [alert show];
                [alert release];
            } else {
                UIAlertView *alert = [[UIAlertView alloc]
                                      initWithTitle:@""
                                      message:@"Please specify Term in 1 to 365"
                                      delegate:nil
                                      cancelButtonTitle:@"OK"
                                      otherButtonTitles:nil, nil];
                [alert show];
                [alert release];
            }
        }
    } else {
        if (lanType == 'J') {
            UIAlertView *alert = [[UIAlertView alloc]
                                  initWithTitle:@""
                                  message:@"日数に正しい数値を入力して下さい"
                                  delegate:nil
                                  cancelButtonTitle:@"OK"
                                  otherButtonTitles:nil, nil];
            [alert show];
            [alert release];
        } else {
            UIAlertView *alert = [[UIAlertView alloc]
                                  initWithTitle:@""
                                  message:@"Please input an integer into Term"
                                  delegate:nil
                                  cancelButtonTitle:@"OK"
                                  otherButtonTitles:nil, nil];
            [alert show];
            [alert release];
        }
    }
    return b;
}

// 被爆量結果取得
- (void)getOutcome {
	double keisu1, keisu2;
	double bqAmount = [[amount text] doubleValue];
    double hvAmount = [[haveAmount text] doubleValue];
    int hvDays = [[haveDays text] intValue];
    
//        NSLog(@"rowNumber = %d",rowNumber);
//        NSLog(@"rowNumber2 = %d",rowNumber2);

    switch (rowNumber) {
		case 0:
            switch (rowNumber2) {
                case 0:
                    keisu1 = 0.18;
                    keisu2 = 0.072;
                    break;
                case 1:
                    keisu1 = 0.22;
                    keisu2 = 0.086;
                    break;
                case 2:
                    keisu1 = 0.17;
                    keisu2 = 0.061;
                    break;
                case 3:
                    keisu1 = 0.19;
                    keisu2 = 0.067;
                    break;
                case 4:
                    keisu1 = 0.14;
                    keisu2 = 0.046;
                    break;
                case 5:
                    keisu1 = 0.11;
                    keisu2 = 0.036;
                    break;
                default:
                    break;
            }
            break;
		case 1:
            switch (rowNumber2) {
                case 0:
                    keisu1 = 0.18;
                    keisu2 = 0.072;
                    break;
                case 1:
                    keisu1 = 0.18;
                    keisu2 = 0.072;
                    break;
                case 2:
                    keisu1 = 0.1;
                    keisu2 = 0.037;
                    break;
                case 3:
                    keisu1 = 0.052;
                    keisu2 = 0.019;
                    break;
                case 4:
                    keisu1 = 0.034;
                    keisu2 = 0.011;
                    break;
                case 5:
                    keisu1 = 0.022;
                    keisu2 = 0.0074;
                    break;
                default:
                    break;
            }
            break;
		case 2:
            switch (rowNumber2) {
                case 0:
                    keisu1 = 0.026;
                    keisu2 = 0.07;
                    break;
                case 1:
                    keisu1 = 0.016;
                    keisu2 = 0.063;
                    break;
                case 2:
                    keisu1 = 0.013;
                    keisu2 = 0.041;
                    break;
                case 3:
                    keisu1 = 0.014;
                    keisu2 = 0.028;
                    break;
                case 4:
                    keisu1 = 0.019;
                    keisu2 = 0.023;
                    break;
                case 5:
                    keisu1 = 0.019;
                    keisu2 = 0.02;
                    break;
                default:
                    break;
            }
            break;
		case 3:
            switch (rowNumber2) {
                case 0:
                    keisu1 = 0.021;
                    keisu2 = 0.11;
                    break;
                case 1:
                    keisu1 = 0.012;
                    keisu2 = 0.1;
                    break;
                case 2:
                    keisu1 = 0.00098;
                    keisu2 = 0.07;
                    break;
                case 3:
                    keisu1 = 0.01;
                    keisu2 = 0.048;
                    break;
                case 4:
                    keisu1 = 0.013;
                    keisu2 = 0.042;
                    break;
                case 5:
                    keisu1 = 0.013;
                    keisu2 = 0.039;
                    break;
                default:
                    break;
            }
            break;
		case 4:
            switch (rowNumber2) {
                case 0:
                    keisu1 = 4;
                    keisu2 = 200;
                    break;
                case 1:
                    keisu1 = 0.4;
                    keisu2 = 190;
                    break;
                case 2:
                    keisu1 = 0.31;
                    keisu2 = 140;
                    break;
                case 3:
                    keisu1 = 0.24;
                    keisu2 = 110;
                    break;
                case 4:
                    keisu1 = 0.22;
                    keisu2 = 100;
                    break;
                case 5:
                    keisu1 = 0.23;
                    keisu2 = 110;
                    break;
                default:
                    break;
            }
            break;
		case 5:
            switch (rowNumber2) {
                case 0:
                    keisu1 = 4.2;
                    keisu2 = 210;
                    break;
                case 1:
                    keisu1 = 0.42;
                    keisu2 = 200;
                    break;
                case 2:
                    keisu1 = 0.33;
                    keisu2 = 150;
                    break;
                case 3:
                    keisu1 = 0.27;
                    keisu2 = 120;
                    break;
                case 4:
                    keisu1 = 0.24;
                    keisu2 = 110;
                    break;
                case 5:
                    keisu1 = 0.25;
                    keisu2 = 120;
                    break;
                default:
                    break;
            }
            break;
		case 6:
            switch (rowNumber2) {
                case 0:
                    keisu1 = 4.2;
                    keisu2 = 210;
                    break;
                case 1:
                    keisu1 = 0.42;
                    keisu2 = 200;
                    break;
                case 2:
                    keisu1 = 0.33;
                    keisu2 = 150;
                    break;
                case 3:
                    keisu1 = 0.27;
                    keisu2 = 120;
                    break;
                case 4:
                    keisu1 = 0.24;
                    keisu2 = 110;
                    break;
                case 5:
                    keisu1 = 0.25;
                    keisu2 = 120;
                    break;
                default:
                    break;
            }
            break;
		case 7:
            switch (rowNumber2) {
                case 0:
                    keisu1 = 0.23;
                    keisu2 = 0.42;
                    break;
                case 1:
                    keisu1 = 0.073;
                    keisu2 = 0.4;
                    break;
                case 2:
                    keisu1 = 0.047;
                    keisu2 = 0.27;
                    break;
                case 3:
                    keisu1 = 0.06;
                    keisu2 = 0.18;
                    break;
                case 4:
                    keisu1 = 0.08;
                    keisu2 = 0.16;
                    break;
                case 5:
                    keisu1 = 0.028;
                    keisu2 = 0.16;
                    break;
                default:
                    break;
            }
            break;
		case 8:
            switch (rowNumber2) {
                case 0:
                    keisu1 = 0.35;
                    keisu2 = 30;
                    break;
                case 1:
                    keisu1 = 0.13;
                    keisu2 = 26;
                    break;
                case 2:
                    keisu1 = 0.085;
                    keisu2 = 17;
                    break;
                case 3:
                    keisu1 = 0.071;
                    keisu2 = 11;
                    break;
                case 4:
                    keisu1 = 0.07;
                    keisu2 = 9.2;
                    break;
                case 5:
                    keisu1 = 0.047;
                    keisu2 = 8.5;
                    break;
                default:
                    break;
            }
            break;
		case 9:
            switch (rowNumber2) {
                case 0:
                    keisu1 = 0.34;
                    keisu2 = 29;
                    break;
                case 1:
                    keisu1 = 0.12;
                    keisu2 = 25;
                    break;
                case 2:
                    keisu1 = 0.08;
                    keisu2 = 16;
                    break;
                case 3:
                    keisu1 = 0.068;
                    keisu2 = 10;
                    break;
                case 4:
                    keisu1 = 0.067;
                    keisu2 = 9.2;
                    break;
                case 5:
                    keisu1 = 0.045;
                    keisu2 = 8;
                    break;
                default:
                    break;
            }
            break;
		default:
			break;
	}
    
//        NSLog(@"keisu1 = %f",keisu1);
//        NSLog(@"keisu2 = %f",keisu2);
    
	double outcome_tmp = keisu1*(bqAmount/1000*hvAmount)*hvDays;
    if (outcome_tmp > 1000000) {
        outcome_tmp = outcome_tmp / 1000000;
        unit.text = @"Sv";
    } else if (outcome_tmp > 1000) {
        outcome_tmp = outcome_tmp / 1000;
        unit.text = @"mSv";
    } else {
        unit.text = @"μSv";
    }
    
    if ((outcome_tmp < 0.0001) && (outcome_tmp != 0)) {
        if (lanType == 'J') {
            outcome.text = @"0.0001未満";
        } else {
            outcome.text = @"less than 0.0001";
        }
    } else {
        outcome.text = [NSString stringWithFormat: @"%g", outcome_tmp];
    }
    
    
	double outcome2_tmp = keisu2*(bqAmount/1000*hvAmount)*hvDays;
    if (outcome2_tmp > 1000000) {
        outcome2_tmp = outcome2_tmp / 1000000;
        unit2.text = @"Sv";
    } else if (outcome2_tmp > 1000) {
        outcome2_tmp = outcome2_tmp / 1000;
        unit2.text = @"mSv";
    } else {
        unit2.text = @"μSv";
    }
    
    if ((outcome2_tmp < 0.0001) && (outcome2_tmp != 0)) {
        if (lanType == 'J') {
            outcome2.text = @"0.0001未満";
        } else {
            outcome2.text = @"less than 0.0001";
        }
        
    } else {
        outcome2.text = [NSString stringWithFormat: @"%g", outcome2_tmp];
    }
    
    //	outcome.text = [NSString stringWithFormat: @"%g", keisu1*(bqAmount/1000*hvAmount)*hvDays ];
    
    //		[controller release];
}

// 日本語表記に変更
- (IBAction)chgLanJap {
    switch (rowNumber) {
        case 0:
            radioActiveName.text = @"ヨウ素129";
            break;
        case 1:
            radioActiveName.text = @"ヨウ素131";
            break;
        case 2:
            radioActiveName.text = @"セシウム134";
            break;
        case 3:
            radioActiveName.text = @"セシウム137";
            break;
        case 4:
            radioActiveName.text = @"プルトニウム238";
            break;
        case 5:
            radioActiveName.text = @"プルトニウム239";
            break;
        case 6:
            radioActiveName.text = @"プルトニウム240";
            break;
        case 7:
            radioActiveName.text = @"ストロンチウム90";
            break;
        case 8:
            radioActiveName.text = @"ウラン235";
            break;
        case 9:
            radioActiveName.text = @"ウラン238";
            break;            
        default:
            break;
    }
    
    switch (rowNumber2) {
        case 0:
            age.text = @"0-1歳";
            break;            
        case 1:
            age.text = @"1-2歳";
            break;            
        case 2:
            age.text = @"2-7歳";
            break;            
        case 3:
            age.text = @"7-12歳";
            break;            
        case 4:
            age.text = @"12-17歳";
            break;            
        case 5:
            age.text = @"17歳以上";
            break;            
        default:
            break;
    }
    
    titleRAN.text = @"放射性物質";
    titleBQ.text = @"ベクレル数";
    titleAGE.text = @"年齢";
    titleHA.text = @"１日の摂取量";
    titleHD.text = @"摂取日数";
    unitHD.text = @"日";
    titleHIBAKU.text = @"蓄積被曝線量";
    titleKEIKO.text = @"経口摂取";
    titleKYUNYU.text = @"吸入摂取";
    guide1.text = @"一般人の法定年間許容被曝量：1mSV (1000μSv)";
    guide2.text = @"現在の暫定年間許容被曝量：20mSV (20000μSv)";
    
    if (outcome.text == @"less than 0.0001") {
        outcome.text = @"0.0001未満";
    }
    if (outcome2.text == @"less than 0.0001") {
        outcome2.text = @"0.0001未満";
    }
    
    lanType = 'J';
    [self setLabel];
    
}

// 英語表記に変更
- (IBAction)chgLanEng {
    switch (rowNumber) {
        case 0:
            radioActiveName.text = @"Iodine129";
            break;
        case 1:
            radioActiveName.text = @"Iodine131";
            break;
        case 2:
            radioActiveName.text = @"Cesium134";
            break;
        case 3:
            radioActiveName.text = @"Cesium137";
            break;
        case 4:
            radioActiveName.text = @"Plutonium238";
            break;
        case 5:
            radioActiveName.text = @"Plutonium239";
            break;
        case 6:
            radioActiveName.text = @"Plutonium240";
            break;
        case 7:
            radioActiveName.text = @"Strontium90";
            break;
        case 8:
            radioActiveName.text = @"Uranium235";
            break;
        case 9:
            radioActiveName.text = @"Uranium238";
            break;            
        default:
            break;
    }

    switch (rowNumber2) {
        case 0:
            age.text = @"0-1 y/o";
            break;            
        case 1:
            age.text = @"1-2 y/o";
            break;            
        case 2:
            age.text = @"2-7 y/o";
            break;            
        case 3:
            age.text = @"7-12 y/o";
            break;            
        case 4:
            age.text = @"12-17 y/o";
            break;            
        case 5:
            age.text = @"over 17 y/o";
            break;            
        default:
            break;
    }
    
    titleRAN.text = @"Radioactive Substance";
    titleBQ.text = @"Becquerel";
    titleAGE.text = @"Age";
    titleHA.text = @"Intake/Day";
    titleHD.text = @"Term";
    unitHD.text = @"Days";
    titleHIBAKU.text = @"Exposure Dose";
    titleKEIKO.text = @"Ingestion";
    titleKYUNYU.text = @"Inhalation";
    guide1.text = @"Permissible Exposure Dose：1mSV (1000μSv)";
    guide2.text = @"Temporary Permissible Exposure Dose：20mSV (20000μSv)";
    
    if (outcome.text == @"0.0001未満") {
        outcome.text = @"less than 0.0001";
    }
    if (outcome2.text == @"0.0001未満") {
        outcome2.text = @"less than 0.0001";
    }

    lanType = 'E';
    [self setLabel];
        
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload
{
    [super viewDidUnload];

    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
	[radioActiveName release];
    [amount release];
    [haveAmount release];
    [haveDays release];
    [outcome release];}

- (void)dealloc
{
    [super dealloc];
}

@end
