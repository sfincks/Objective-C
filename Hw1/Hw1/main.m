//
//  main.m
//  Hw1
//
//  Created by Артур on 02.04.2024.
//

#import <Foundation/Foundation.h>
#import <math.h>

// 1. Решить квадратные уравнения:
// x^2 – 8x + 12 = 0,
// 12x^2 – 4x + 2 = 0,
// x^2 – 100x - 2 = 0
// (заменять константы в коде).
void quadraticEquation(double a, double b, double c) {
    NSLog(@"\nРешение квадратного уравнения");
    double discriminant = b*b - 4*a*c;
    
    if (discriminant > 0) {
        double x1 = (-b + sqrt(discriminant)) / (2*a);
        double x2 = (-b - sqrt(discriminant)) / (2*a);
        NSLog(@"x1 = %f, x2 = %f", x1, x2);
    } else if (discriminant == 0) {
        double x = -b / (2*a);
        NSLog(@"x = %f", x);
    } else {
        NSLog(@"Нет решения");
    }
}

// 2. Создать программу, которая находит большее число среди 3-х чисел
int findMaxNumber(int number1, int number2, int number3) {
    NSLog(@"\nЗадача 2");
    
    int max = number1;
    
    if (number2 > max) {
        max = number2;
    }
    if (number3 > max) {
        max = number3;
    }
    return max;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //1 задача
        quadraticEquation(1, -8, 12); // x^2 – 8x + 12 = 0
        quadraticEquation(12, -4, 2); // 12x^2 – 4x + 2 = 0
        quadraticEquation(1, -100, -2); // x^2 – 100x - 2 = 0
        
        //2 задача
        int number1, number2, number3;
        
        printf("Введите три числа: ");
        scanf("%d %d %d", &number1, &number2, &number3);
        
        int maxNumber = findMaxNumber(number1, number2, number3);
        
        NSLog(@"Наибольшее число среди введенных: %d", maxNumber);
    }
    return 0;
}
