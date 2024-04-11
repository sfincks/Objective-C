//
//  main.m
//  Hw4
//
//  Created by Артур on 11.04.2024.
//

#import <Foundation/Foundation.h>
#import "Robot.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Robot *robot = [[Robot alloc] init];
        
        NSLog(@"Robot's starting position: (x: %ld, y: %ld)", (long)robot.x, (long)robot.y);
        
        [robot run:^NSString *{
            return @"up";
        }];
        
        NSLog(@"Robot's position: (x: %ld, y: %ld)", (long)robot.x, (long)robot.y);
        
        [robot run:^NSString *{
            return @"right";
        }];
        
        NSLog(@"Robot's position: (x: %ld, y: %ld)", (long)robot.x, (long)robot.y);
        
        [robot run:^NSString *{
            return @"down";
        }];
        
        NSLog(@"Robot's position: (x: %ld, y: %ld)", (long)robot.x, (long)robot.y);
        
        [robot run:^NSString *{
            return @"left";
        }];
        
        NSLog(@"Robot's final position: (x: %ld, y: %ld)", (long)robot.x, (long)robot.y);
    }
    return 0;
}
