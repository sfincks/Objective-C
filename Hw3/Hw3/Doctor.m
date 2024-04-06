//
//  Doctor.m
//  Hw3
//
//  Created by Артур on 06.04.2024.
//

#import <Foundation/Foundation.h>
#import "Doctor.h"
#import "Patient.h"

@implementation Doctor

- (void)prescribeMedicineToPatient:(Patient *)patient {
    [self.delegate doctor:self prescribeMedicineToPatient:patient];
}

@end
