//
//  FlipsideViewController.h
//  BqSv
//
//  Created by 竹下 仁 on 11/07/24.
//  Copyright 2011 office #9. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FlipsideViewControllerDelegate;


@interface FlipsideViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource> {
	id <FlipsideViewControllerDelegate> delegate;
    IBOutlet UILabel *bar1;
    IBOutlet UIBarButtonItem *button1;
	UIPickerView	*myPickerView;
	NSArray			*pickerViewArray;
	NSString		*radioActive;
	NSInteger		choiceNo;
    char            lanType1;
}

@property (nonatomic, assign) id <FlipsideViewControllerDelegate> delegate;
@property (nonatomic, retain) NSString	*radioActive;
@property (nonatomic) NSInteger choiceNo;
@property (nonatomic, assign) char lanType1;

- (IBAction)done:(id)sender;

@end


@protocol FlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller;

@end
