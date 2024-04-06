//
//  Doctor.h
//  Hw3
//
//  Created by Артур on 06.04.2024.
//

#import <Foundation/Foundation.h>

@class Patient;
@class Doctor;

@protocol PillsDelegation <NSObject>

- (void)doctor:(Doctor *)doctor prescribeMedicineToPatient:(Patient *)patient;

@end

@interface Doctor : NSObject

@property (nonatomic, weak) id<PillsDelegation> delegate;

- (void)prescribeMedicineToPatient:(Patient *)patient;

@end
