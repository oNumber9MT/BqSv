//
//  FlipsideViewController.m
//  BqSv
//
//  Created by 竹下 仁 on 11/07/24.
//  Copyright 2011 office #9. All rights reserved.
//

#import "FlipsideViewController.h"

@implementation FlipsideViewController

@synthesize delegate=_delegate, radioActive, choiceNo, lanType1;

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

    if (lanType1 == 'J') {
        button1.title = @"選択";
        bar1.text = @"放射性物質";
        pickerViewArray = [[NSArray arrayWithObjects:
                            @"ヨウ素129", @"ヨウ素131", @"セシウム134", @"セシウム137", 
                            @"プルトニウム238", @"プルトニウム239", @"プルトニウム240", 
                            @"ストロンチウム90", @"ウラン235", @"ウラン238", nil] retain];
    } else {
        button1.title = @"SELECT";
        bar1.text = @"Radioactive Substance";
        pickerViewArray = [[NSArray arrayWithObjects:
                            @"Iodine129", @"Iodine131", @"Cesium134", @"Cesium137", 
                            @"Plutonium238", @"Plutonium239", @"Plutonium240", 
                            @"Strontium90", @"Uranium235", @"Uranium238", nil] retain];        
    }
    
	CGRect pFrame = CGRectMake(0, 124, 320, 216);
	myPickerView = [[UIPickerView alloc] initWithFrame:pFrame];
    //    [myPickerView selectRow:rowNumber inComponent:0 animated:YES];
	myPickerView.showsSelectionIndicator = YES;
	myPickerView.delegate = self;
	myPickerView.dataSource = self;
	[self.view addSubview:myPickerView];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
	return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component {
	return [pickerViewArray count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView
			 titleForRow:(NSInteger)row forComponent:(NSInteger)component {
	return [pickerViewArray objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView
	  didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
	radioActive = [pickerViewArray objectAtIndex:
				   [pickerView selectedRowInComponent:0]];
	choiceNo = row;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
	[myPickerView release];
	[pickerViewArray release];
	[radioActive release];}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Actions

- (IBAction)done:(id)sender
{
    [self.delegate flipsideViewControllerDidFinish:self];
}

- (char)lanType1 {
    return lanType1;
}
@end
