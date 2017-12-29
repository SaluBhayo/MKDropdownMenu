//
//  ViewController.h
//  MKDropdownMenuExample
//
//  Created by Max Konovalov on 17/03/16.
//  Copyright © 2016 Max Konovalov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MKDropdownMenu.h"
#import "ChildViewController.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *textLabel;

@property (readonly, nonatomic) ChildViewController *childViewController;

@end
