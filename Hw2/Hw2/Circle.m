//
//  Circle.m
//  Hw2
//
//  Created by Артур on 04.04.2024.
//

#import "Circle.h"
//2
@implementation Circle

- (float)calculateArea {
    return M_PI * self.radius * self.radius;
}

- (float)calculatePerimeter {
    return 2 * M_PI * self.radius;
}

- (void)printInfo {
    NSLog(@"Круг: радиус = %.2f", self.radius);
    NSLog(@"Площадь: %.2f, Длина окружности: %.2f", [self calculateArea], [self calculatePerimeter]);
}
@end
