//
//  Triangle.m
//  Hw2
//
//  Created by Артур on 04.04.2024.
//

#import "Triangle.h"
#import <math.h>
//2
@implementation Triangle
- (float)calculateArea {
    float p = (self.sideA + self.sideB + self.sideC) / 2;
    return sqrt(p * (p - self.sideA) * (p - self.sideB) * (p - self.sideC));
}

- (float)calculatePerimeter {
    return self.sideA + self.sideB + self.sideC;
}

- (void)printInfo {
    NSLog(@"Треугольник: сторона A = %.2f, сторона B = %.2f, сторона C = %.2f", self.sideA, self.sideB, self.sideC);
    NSLog(@"Площадь: %.2f, Периметр: %.2f", [self calculateArea], [self calculatePerimeter]);
}
@end
