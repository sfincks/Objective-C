//
//  ViewController.m
//  Hw6
//
//  Created by Артур on 12.04.2024.
//

#import "ViewController.h"
#import "Robot.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColor.whiteColor;
    
    
    [self setupViews];
}

- (void) setupViews {
    [self setupXTextField];
    [self setupYTextField];
    [self setupNameTextField];
    [self setupButton];
    
    [self setupConstraints];
}

- (void) setupXTextField {
    self.xTextField = [[UITextField alloc] init];
    self.xTextField.placeholder = @"X coordinate";
    self.xTextField.borderStyle = UITextBorderStyleRoundedRect;
    
    self.xTextField.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview:self.xTextField];
}

- (void) setupYTextField {
    self.yTextField = [[UITextField alloc] init];
    self.yTextField.placeholder = @"Y coordinate";
    self.yTextField.borderStyle = UITextBorderStyleRoundedRect;
    
    self.yTextField.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview:self.yTextField];
}

- (void) setupNameTextField {
    self.nameTextField = [[UITextField alloc] init];
    self.nameTextField.placeholder = @"Name";
    self.nameTextField.borderStyle = UITextBorderStyleRoundedRect;
    
    self.nameTextField.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview:self.nameTextField];
}

- (void) setupButton {
    self.saveButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.saveButton setBackgroundColor:[UIColor blueColor]];
    [self.saveButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.saveButton setTitle:@"saveToFile" forState:UIControlStateNormal];
    [self.saveButton addTarget:self action:@selector(saveButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    
    self.saveButton.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview:self.saveButton];
}

- (void) setupConstraints {
    [NSLayoutConstraint activateConstraints:@[
        [self.xTextField.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
        [self.xTextField.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:100],
        [self.xTextField.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:20],
        [self.xTextField.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-20],
        
        [self.yTextField.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
        [self.yTextField.topAnchor constraintEqualToAnchor:self.xTextField.bottomAnchor constant:20],
        [self.yTextField.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:20],
        [self.yTextField.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-20],
        
        [self.nameTextField.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
        [self.nameTextField.topAnchor constraintEqualToAnchor:self.yTextField.bottomAnchor constant:20],
        [self.nameTextField.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:20],
        [self.nameTextField.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-20],
        
        [self.saveButton.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
        [self.saveButton.topAnchor constraintEqualToAnchor:self.nameTextField.bottomAnchor constant:50],
        [self.saveButton.widthAnchor constraintEqualToConstant:200]
    ]];
}


- (void) saveButtonTapped: (id)sender {
    Robot *robot = [[Robot alloc] initWithName:self.nameTextField.text andPoint:CGPointMake([self.xTextField.text floatValue], [self.yTextField.text floatValue])];
    
    NSString *fileName = [NSString stringWithFormat:@"%@.txt", robot.name];
    NSString *filePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    filePath = [filePath stringByAppendingPathComponent:fileName];
    
    NSData *robotData = [NSKeyedArchiver archivedDataWithRootObject:robot requiringSecureCoding:NO error:nil];
    [robotData writeToFile:filePath atomically:YES];
    
    [self showFileData];
}

- (void) showFileData {
    NSString *fileName = [NSString stringWithFormat:@"%@.txt", self.nameTextField.text];
    NSString *filePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    filePath = [filePath stringByAppendingPathComponent:fileName];
    
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    
    if (data) {
        Robot *savedRobot = [NSKeyedUnarchiver unarchiveObjectWithData: data];
        
        if (savedRobot) {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Success" message:[NSString stringWithFormat:@"Data saved successfully:\nName=%@, X=%f, Y=%f", savedRobot.name, savedRobot.point.x, savedRobot.point.y] preferredStyle:UIAlertControllerStyleAlert];
            [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
            [self presentViewController:alert animated:YES completion:nil];
        }
    } else {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error" message:@"File can't be read!" preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
        [self presentViewController:alert animated:YES completion:nil];
    }
}

@end
