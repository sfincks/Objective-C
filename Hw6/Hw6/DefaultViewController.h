//
//  DefaultViewController.h
//  Hw6
//
//  Created by Артур on 12.04.2024.
//

#import <UIKit/UIKit.h>
#import "Robot.h"

@interface DefaultViewController : UIViewController

@property (nonatomic, strong) UITextField *xTextField;
@property (nonatomic, strong) UITextField *yTextField;
@property (nonatomic, strong) UITextField *nameTextField;

@property (nonatomic, strong) UIButton *saveButton;

@end
