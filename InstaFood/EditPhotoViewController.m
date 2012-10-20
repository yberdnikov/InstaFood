//
//  ViewController.m
//  InstaFood
//
//  Created by Daniel-Mac on 14/10/12.
//  Copyright (c) 2012 MagicDev. All rights reserved.
//

#import "EditPhotoViewController.h"

@interface EditPhotoViewController ()

@end

@implementation EditPhotoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UIImage *bgImage = [UIImage imageNamed:@"edit_background.png"];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:bgImage]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
