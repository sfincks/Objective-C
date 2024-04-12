//
//  Robot.m
//  Hw6
//
//  Created by Артур on 12.04.2024.
//

#import "Robot.h"

@implementation Robot

- (instancetype) initWithName: (NSString *)currentName andPoint: (CGPoint)currentPoint {
    self = [super init];
    if (self) {
        self.name = currentName;
        self.point = currentPoint;
    }
    return  self;
}

- (instancetype) initWithCoder:(NSCoder *)coder {
    self = [super init];
    if (self) {
        self.name = [coder decodeObjectForKey:@"Name"];
        float x = [coder decodeFloatForKey:@"X"];
        float y = [coder decodeFloatForKey:@"Y"];
        self.point = CGPointMake(x, y);
    }
    return self;
}

- (void) encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.name forKey:@"Name"];
    [coder encodeFloat: self.point.x forKey:@"X"];
    [coder encodeFloat:self.point.y forKey:@"Y"];
}

@end
