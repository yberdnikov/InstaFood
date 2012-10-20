//
//  DetailViewController.h
//  NavSample
//
//  Created by Daniel-Mac on 20/10/12.
//  Copyright (c) 2012 MagicDev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
