//
//  FlipsideViewController2.m
//  BqSv
//
//  Created by 竹下 仁 on 11/08/20.
//  Copyright 2011 office #9. All rights reserved.
//

#import "FlipsideViewController2.h"


@implementation FlipsideViewController2

@synthesize delegate=_delegate, age, choiceNo2, lanType2;

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor viewFlipsideBackgroundColor];  

	if (lanType2 == 'J') {
        button2.title = @"選択";
        bar2.text = @"年齢";
        pickerViewArray2 = [[NSArray arrayWithObjects:
                             @"0-1歳", @"1-2歳", @"2-7歳", @"7-12歳", @"12-17歳", @"17歳以上", nil] retain];        
    } else {        
        button2.title = @"SELECT";
        bar2.text = @"Age";
        pickerViewArray2 = [[NSArray arrayWithObjects:
                             @"0-1 y/o", @"1-2 y/o", @"2-7 y/o", @"7-12 y/o", @"12-17 y/o", @"over 17 y/o", nil] retain];        
    }
    
	CGRect pFrame = CGRectMake(0, 124, 320, 216);
	myPickerView2 = [[UIPickerView alloc] initWithFrame:pFrame];
	myPickerView2.showsSelectionIndicator = YES;
	myPickerView2.delegate = self;
	myPickerView2.dataSource = self;
	[self.view addSubview:myPickerView2];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
	return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component {
	return [pickerViewArray2 count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView
			 titleForRow:(NSInteger)row forComponent:(NSInteger)component {
	return [pickerViewArray2 objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView
	  didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
	age = [pickerViewArray2 objectAtIndex:
				   [pickerView selectedRowInComponent:0]];
	choiceNo2 = row;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
	[myPickerView2 release];
	[pickerViewArray2 release];
	[age release];}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Actions

- (IBAction)done:(id)sender
{
    [self.delegate flipsideViewController2DidFinish:self];
}

@end
