//
//  ViewController.m
//  InstaFood
//
//  Created by Daniel-Mac on 14/10/12.
//  Copyright (c) 2012 MagicDev. All rights reserved.
//

#import "EditPhotoViewController.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import "AFSubPhotoEditorViewController.h"
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

void kShowAlert (NSString *message)
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"InstaFood"
                                                   message:message
                                                  delegate:nil
                                         cancelButtonTitle:@"OK"
                                         otherButtonTitles:nil];
    [alert show];
}

@interface EditPhotoViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate, AFPhotoEditorControllerDelegate, CLLocationManagerDelegate>

@property (nonatomic, strong) CLGeocoder *geocoder;
@property (nonatomic, strong) CLLocationManager *locationManager;

- (IBAction)loadPhotoAblum:(id)sender;
- (IBAction)loadCamera:(id)sender;

@end

@implementation EditPhotoViewController
{
    UIImage *editedImage;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor scrollViewTexturedBackgroundColor]];

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
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
        imagePicker.delegate = self;
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        imagePicker.allowsEditing = NO;
        [self presentViewController:imagePicker animated:YES completion:nil];
    }
}

#pragma mark - UIImagePickerControllerDelegate

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [self dismissViewControllerAnimated:NO completion:nil];
    
    AFSubPhotoEditorViewController *editorController = [[AFSubPhotoEditorViewController alloc]initWithImage:[info objectForKey:UIImagePickerControllerOriginalImage]];
    [editorController setDelegate:self];
    [self presentViewController:editorController animated:YES completion:nil];
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - AFPhotoEditorControllerDelegate

-(void)photoEditor:(AFPhotoEditorController *)editor finishedWithImage:(UIImage *)image
{
    [self dismissViewControllerAnimated:YES completion:^{
        self.geocoder = [[CLGeocoder alloc] init];
        self.locationManager = [[CLLocationManager alloc]init];
        _locationManager.delegate = self;
        [_locationManager startUpdatingLocation];

        editedImage = image;
    }];
}

-(void)photoEditorCanceled:(AFPhotoEditorController *)editor
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - CLLocationManagerDelegate

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    kShowAlert([error localizedDescription]);
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    [self.geocoder reverseGeocodeLocation:manager.location completionHandler:
     ^(NSArray *placemarks, NSError *error) {
         CLPlacemark *placemark = [placemarks objectAtIndex:0];
         NSLog(@"Placemark array: %@",placemark.addressDictionary);
         
         //String to address
         NSString *city = [[placemark.addressDictionary valueForKey:@"City"]stringByReplacingOccurrencesOfString:@" " withString:@""];
         NSString *name = [[placemark.addressDictionary valueForKey:@"Name"]stringByReplacingOccurrencesOfString:@" " withString:@""];
         
         NSString *text = [NSString stringWithFormat:@"#InstaFood #%@ #%@" ,city, name];
         NSArray *activityItems = @[editedImage, text];
         UIActivityViewController *activityVC = [[UIActivityViewController alloc]initWithActivityItems:activityItems applicationActivities:nil];

         [self presentViewController:activityVC animated:YES completion:nil];
         [manager stopUpdatingLocation];
     }];
}

@end
