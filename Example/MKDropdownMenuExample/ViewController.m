//
//  ViewController.m
//  MKDropdownMenuExample
//
//  Created by Max Konovalov on 17/03/16.
//  Copyright © 2016 Max Konovalov. All rights reserved.
//

#import "ViewController.h"
#import "Utilities.h"

@interface ViewController ()
@property (strong, nonatomic) NSArray<NSString *> *colors;
@end

@implementation ViewController

- (ChildViewController *)childViewController {
    return (ChildViewController *)self.childViewControllers.firstObject;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.colors = @[@"#0F4C81", @"#166BB5", @"#1B86E3"];
    self.textLabel.text = self.colors[0];
    
    self.view.backgroundColor = UIColorWithHexString(self.colors[0]);
    
    
    
    self.navigationItem.title = @"Hello";
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.childViewController.dropdownMenu closeAllComponentsAnimated:NO];
}
@end
