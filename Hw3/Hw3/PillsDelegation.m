//
//  PillsDelegation.m
//  Hw3
//
//  Created by Артур on 06.04.2024.
//

#import <Foundation/Foundation.h>
#import "PillsDelegation.h"
#import "Doctor.h"
#import "Patient.h"

@implementation PillsDelegation

- (void)doctor:(Doctor *)doctor prescribeMedicineToPatient:(Patient *)patient {
    [patient takeMedicine];
}
@end
