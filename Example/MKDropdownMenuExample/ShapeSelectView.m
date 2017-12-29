//
//  ShapeSelectView.m
//  MKDropdownMenuExample
//
//  Created by Max Konovalov on 18/03/16.
//  Copyright © 2016 Max Konovalov. All rights reserved.
//

#import "ShapeSelectView.h"

@implementation ShapeSelectView

- (void)awakeFromNib {
    [super awakeFromNib];
    self.shapeView.strokeColor = [UIColor clearColor];
    self.shapeView.lineWidth = 1;
}

@end
