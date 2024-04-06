//
//  PillsDelegation.h
//  Hw3
//
//  Created by Артур on 06.04.2024.
//

#import <Foundation/Foundation.h>

@class Doctor;
@class Patient;

@interface PillsDelegation : NSObject

- (void)doctor:(Doctor *)doctor prescribeMedicineToPatient:(Patient *)patient;

@end
