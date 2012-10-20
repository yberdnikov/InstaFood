//
//  CustomTabBar.m
//  InstaFood
//
//  Created by Daniel-Mac on 20/10/12.
//  Copyright (c) 2012 MagicDev. All rights reserved.
//

#import "CustomTabBar.h"

@interface CustomTabBar ()

@end

@implementation CustomTabBar

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self addCustomElements];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self hideTabBar];
}

-(void)hideTabBar
{
    for(UIView *view in self.view.subviews)
	{
		if([view isKindOfClass:[UITabBar class]])
		{
			view.hidden = YES;
			break;
		}
	}
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)addCustomElements
{
    // Initialise our two images
	UIImage *btnImage = [UIImage imageNamed:@"edit_photo-inactive.png"];
	UIImage *btnImageSelected = [UIImage imageNamed:@"edit_photo-active.png"];
    
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
	
	self.btn1 = [UIButton buttonWithType:UIButtonTypeCustom]; //Setup the button
	_btn1.frame = CGRectMake(1, screenBounds.size.height-btnImage.size.height, btnImage.size.width, btnImage.size.height); // Set the frame (size and position) of the button)
	[_btn1 setBackgroundImage:btnImage forState:UIControlStateNormal]; // Set the image for the normal state of the button
	[_btn1 setBackgroundImage:btnImageSelected forState:UIControlStateSelected]; // Set the image for the selected state of the button
	[_btn1 setTag:0]; // Assign the button a "tag" so when our "click" event is called we know which button was pressed.
	[_btn1 setSelected:true]; // Set this button as selected (we will select the others to false as we only want Tab 1 to be selected initially
	
	// Now we repeat the process for the other buttons
	btnImage = [UIImage imageNamed:@"explore-inactive.png"];
	btnImageSelected = [UIImage imageNamed:@"explore-active.png"];
	self.btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
	_btn2.frame = CGRectMake(159, screenBounds.size.height-btnImage.size.height, btnImage.size.width, btnImage.size.height);
	[_btn2 setBackgroundImage:btnImage forState:UIControlStateNormal];
	[_btn2 setBackgroundImage:btnImageSelected forState:UIControlStateSelected];
	[_btn2 setTag:1];
	
    //add base
    UIImage *base = [UIImage imageNamed:@"tab-background.png"];
    UIImageView *baseImageView = [[UIImageView alloc]initWithImage:base];
    baseImageView.frame = CGRectMake(0, screenBounds.size.height - base.size.height, base.size.width, base.size.height);
    [self.view addSubview:baseImageView];
	
	// Add my new buttons to the view
	[self.view addSubview:_btn1];
	[self.view addSubview:_btn2];
	
	// Setup event handlers so that the buttonClicked method will respond to the touch up inside event.
	[_btn1 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
	[_btn2 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)buttonClicked:(id)sender
{
	int tagNum = [sender tag];
	[self selectTab:tagNum];
}

- (void)selectTab:(int)tabID
{
	switch(tabID)
	{
		case 0:
			[_btn1 setSelected:true];
			[_btn2 setSelected:false];
			break;
		case 1:
			[_btn1 setSelected:false];
			[_btn2 setSelected:true];
			break;
	}
	
	self.selectedIndex = tabID;
}

@end
