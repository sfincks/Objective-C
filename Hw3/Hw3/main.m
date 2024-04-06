//
//  main.m
//  Hw3
//
//  Created by Артур on 06.04.2024.
//


//Написать классы Doctor (Доктор) и Patient (Пациент).
//Доктор делегирует пациенту выпить пилюлю.
//Пациент по указанию доктора ее выпивает.
//Требуется реализовать взаимодействие доктора и пациента через делегат.

#import <Foundation/Foundation.h>
#import "Doctor.h"
#import "Patient.h"
#import "PillsDelegation.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Doctor *doctor = [[Doctor alloc] init];
        Patient *patient = [[Patient alloc] init];
        PillsDelegation *pillsDelegate = [[PillsDelegation alloc] init];
        
        doctor.delegate = pillsDelegate;
        
        [doctor prescribeMedicineToPatient:patient];
    }
    return 0;
}
