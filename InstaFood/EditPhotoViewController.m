//
//  ViewController.m
//  InstaFood
//
//  Created by Daniel-Mac on 14/10/12.
//  Copyright (c) 2012 MagicDev. All rights reserved.
//

#import "EditPhotoViewController.h"
#import <AssetsLibrary/AssetsLibrary.h>

@interface EditPhotoViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

- (IBAction)loadPhotoAblum:(id)sender;
- (IBAction)loadCamera:(id)sender;

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

- (IBAction)loadPhotoAblum:(id)sender {
    UIImagePickerController *pickerController = [[UIImagePickerController alloc]init];
    pickerController.delegate = self;
    [self presentViewController:pickerController animated:YES completion:nil];
}

- (IBAction)loadCamera:(id)sender {
}

#pragma mark - UIImagePickerControllerDelegate

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [self dismissViewControllerAnimated:YES completion:nil];
    NSLog(@"%@", info);
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
