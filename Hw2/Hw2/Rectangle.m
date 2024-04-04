//
//  Rectangle.m
//  Hw2
//
//  Created by Артур on 04.04.2024.
//

#import "Rectangle.h"
//2
@implementation Rectangle

- (float)calculateArea {
    return self.width * self.height;
}

- (float)calculatePerimeter {
    return 2 * (self.width + self.height);
}

- (void)printInfo {
    NSLog(@"Прямоугольник: ширина = %.2f, высота = %.2f", self.width, self.height);
    NSLog(@"Площадь: %.2f, Периметр: %.2f", [self calculateArea], [self calculatePerimeter]);
}
@end
