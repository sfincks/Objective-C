//
//  Figure.h
//  Hw2
//
//  Created by Артур on 04.04.2024.
//

#import <Foundation/Foundation.h>
//1
@protocol Figure <NSObject>
- (float)calculateArea;
- (float)calculatePerimeter;
- (void)printInfo;
@end

@interface Figure : NSObject <Figure>
@end
