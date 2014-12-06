//
//  ViewController.m
//  Demo
//
//  Created by Conrad Kramer on 12/5/14.
//  Copyright (c) 2014 Conrad Kramer. All rights reserved.
//

#import "ViewController.h"
#import "DCImagePickerController.h"

@interface ViewController () <DCImagePickerControllerDelegate>

@end

@implementation ViewController

- (void)loadView {
    [super loadView];

    self.view.backgroundColor = [UIColor whiteColor];

    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.translatesAutoresizingMaskIntoConstraints = NO;
    [button setTitle:@"Display" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(showImagePicker) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];

    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:button attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0f constant:0.0f]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:button attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0f constant:0.0f]];
}

- (void)showImagePicker {
    DCImagePickerController *imagePickerController = [[DCImagePickerController alloc] init];
    imagePickerController.minimumNumberOfItems = 2;
    imagePickerController.maximumNumberOfItems = 5;
    imagePickerController.delegate = self;

    [self presentViewController:imagePickerController animated:YES completion:nil];
}

#pragma mark - DCImagePickerControllerDelegate

- (void)dcImagePickerController:(DCImagePickerController *)picker didFinishPickingMediaWithInfo:(NSArray *)info {
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)dcImagePickerControllerDidCancel:(DCImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:nil];
}

@end
