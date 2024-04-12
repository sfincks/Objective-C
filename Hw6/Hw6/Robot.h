//
//  Robot.h
//  Hw6
//
//  Created by Артур on 12.04.2024.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface Robot : NSObject<NSCoding>

@property (nonatomic) NSString *name;
@property (nonatomic) CGPoint point;



- (instancetype) initWithName: (NSString *)currentName andPoint: (CGPoint)currentPoint;

@end

NS_ASSUME_NONNULL_END
