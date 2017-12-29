//
//  ChildViewController.m
//  MKDropdownMenuExample
//
//  Created by Max Konovalov on 18/03/16.
//  Copyright © 2016 Max Konovalov. All rights reserved.
//

#import "ChildViewController.h"
#import "ShapeSelectView.h"

NS_ENUM(NSInteger, DropdownComponents) {
    DropdownComponentShape = 0,
    DropdownComponentColor,
    DropdownComponentsCount
};

@interface ChildViewController ()
@property (strong, nonatomic) NSArray<NSString *> *componentTitles;
@property (strong, nonatomic) NSArray<NSString *> *shapeTitles;
@property (assign, nonatomic) int shapeColors;
@end

@implementation ChildViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.componentTitles = @[@"Color", @"Shape", @"Line Width"];
    self.shapeTitles = @[@"Black", @"Gray", @"Blue", @"Red", @"Green", @"Yellow"];
    self.shapeColors = 6;
    
    
    // Set up dropdown menu loaded from storyboard
    // Note that `dataSource` and `delegate` outlets are connected in storyboard
    
    self.dropdownMenu.layer.borderColor = [[UIColor colorWithRed:0.78 green:0.78 blue:0.8 alpha:1.0] CGColor];
    self.dropdownMenu.layer.borderWidth = 0.5;
    
    UIColor *selectedBackgroundColor = [UIColor colorWithRed:0.91 green:0.92 blue:0.94 alpha:1.0];
    self.dropdownMenu.selectedComponentBackgroundColor = selectedBackgroundColor;
    self.dropdownMenu.dropdownBackgroundColor = selectedBackgroundColor;
    
    self.dropdownMenu.dropdownShowsTopRowSeparator = NO;
    self.dropdownMenu.dropdownShowsBottomRowSeparator = NO;
    self.dropdownMenu.dropdownShowsBorder = YES;
    
    self.dropdownMenu.backgroundDimmingOpacity = 0.05;
    
    
    // Set up shape view
    
    self.shapeView.sidesCount = 2;
    self.shapeView.fillColor = [self colorForRow:0];
    self.shapeView.strokeColor = [UIColor clearColor];
    self.shapeView.lineWidth = 1;
}

#pragma mark - MKDropdownMenuDataSource

- (NSInteger)numberOfComponentsInDropdownMenu:(MKDropdownMenu *)dropdownMenu {
    return 1;
}

- (NSInteger)dropdownMenu:(MKDropdownMenu *)dropdownMenu numberOfRowsInComponent:(NSInteger)component {
    switch (component) {
        case DropdownComponentShape:
            return [self.shapeTitles count];
        case DropdownComponentColor:
            return _shapeColors;
        default:
            return 0;
    }
}

#pragma mark - MKDropdownMenuDelegate

- (CGFloat)dropdownMenu:(MKDropdownMenu *)dropdownMenu rowHeightForComponent:(NSInteger)component {
    if (component == DropdownComponentColor) {
        return 20;
    }
    return 0; // use default row height
}

- (CGFloat)dropdownMenu:(MKDropdownMenu *)dropdownMenu widthForComponent:(NSInteger)component {
    if (component == DropdownComponentShape) {
        return 20;
    }
    return 0; // use automatic width
}

- (BOOL)dropdownMenu:(MKDropdownMenu *)dropdownMenu shouldUseFullRowWidthForComponent:(NSInteger)component {
    return NO;
}

//- (NSAttributedString *)dropdownMenu:(MKDropdownMenu *)dropdownMenu attributedTitleForComponent:(NSInteger)component {
////    return [[NSAttributedString alloc] initWithString:self.componentTitles[component]
////                                           attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:16 weight:UIFontWeightLight],
////                                                        NSForegroundColorAttributeName: self.view.tintColor}];
//    return [[NSAttributedString alloc] init];
//}

//- (NSAttributedString *)dropdownMenu:(MKDropdownMenu *)dropdownMenu attributedTitleForSelectedComponent:(NSInteger)component {
////    return [[NSAttributedString alloc] initWithString:self.componentTitles[component]
////                                           attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:16 weight:UIFontWeightRegular],
////                                                        NSForegroundColorAttributeName: self.view.tintColor}];
//    return [[NSAttributedString alloc] init];
//}

- (UIView *)dropdownMenu:(MKDropdownMenu *)dropdownMenu viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    switch (component) {
        case DropdownComponentShape: {
            ShapeSelectView *shapeSelectView = (ShapeSelectView *)view;
            if (shapeSelectView == nil || ![shapeSelectView isKindOfClass:[ShapeSelectView class]]) {
                shapeSelectView = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([ShapeSelectView class]) owner:nil options:nil] firstObject];
            }
//            shapeSelectView.shapeView.sidesCount = row + 2;
            shapeSelectView.textLabel.text = self.shapeTitles[row];
            shapeSelectView.textLabel.textColor = shapeSelectView.shapeView.fillColor = [self colorForRow:row];
            
            return shapeSelectView;
        }
        default:
            return nil;
    }
}

//- (UIColor *)dropdownMenu:(MKDropdownMenu *)dropdownMenu backgroundColorForRow:(NSInteger)row forComponent:(NSInteger)component {
//    if (component == DropdownComponentColor) {
//        return [self colorForRow:row];
//    }
//    return nil;
//}

- (void)dropdownMenu:(MKDropdownMenu *)dropdownMenu didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    switch (component) {
        case DropdownComponentShape:
            self.shapeView.sidesCount = row + 2;
            [dropdownMenu reloadComponent:component];
            self.shapeView.fillColor = [self colorForRow:row];
            break;
        case DropdownComponentColor:
            self.shapeView.fillColor = [self colorForRow:row];
            break;
        default:
            break;
    }
}

#pragma mark - Utility

//- (UIColor *)colorForRow:(NSInteger)row {
//    return [UIColor colorWithHue:(CGFloat)row/[self.dropdownMenu numberOfRowsInComponent:DropdownComponentColor]
//                      saturation:1.0
//                      brightness:1.0
//                           alpha:1.0];
//}

-(UIColor *)colorForRow:(NSInteger)row {
    UIColor *color;
    switch (row) {
        case 0:
            color = [UIColor blackColor];
            break;
        case 1:
            color = [UIColor grayColor];
            break;
        case 2:
            color = [UIColor blueColor];
            break;
        case 3:
            color = [UIColor redColor];
            break;
        case 4:
            color = [UIColor greenColor];
            break;
        case 5:
            color = [UIColor yellowColor];
            break;
        default:
            color = [UIColor whiteColor];
            break;
    }
    
    return color;
}

@end
