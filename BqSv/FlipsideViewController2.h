//
//  FlipsideViewController2.h
//  BqSv
//
//  Created by 竹下 仁 on 11/08/20.
//  Copyright 2011 office #9. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FlipsideViewController2Delegate;


@interface FlipsideViewController2 : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource> {
	id <FlipsideViewController2Delegate> delegate;
    IBOutlet UILabel *bar2;
    IBOutlet UIBarButtonItem *button2;
	UIPickerView	*myPickerView2;
	NSArray			*pickerViewArray2;
	NSString		*age;
	NSInteger		choiceNo2;
    char            lanType2;
}

@property (nonatomic, assign) id <FlipsideViewController2Delegate> delegate;
@property (nonatomic, retain) NSString	*age;
@property (nonatomic) NSInteger choiceNo2;
@property (nonatomic, assign) char lanType2;

- (IBAction)done:(id)sender;

@end


@protocol FlipsideViewController2Delegate
- (void)flipsideViewController2DidFinish:(FlipsideViewController2 *)controller2;
@end
