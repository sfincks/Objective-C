//
//  Robot.h
//  Hw4
//
//  Created by Артур on 11.04.2024.
//

#import <Foundation/Foundation.h>

@interface Robot : NSObject

@property (nonatomic, assign) NSInteger x;
@property (nonatomic, assign) NSInteger y;

- (void)run:(NSString *(^)(void))movementBlock;

@end
