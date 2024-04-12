//
//  ViewController.h
//  Hw5
//
//  Created by Артур on 11.04.2024.
//

#import <UIKit/UIKit.h>
#import "Loader.h"
@interface ViewController : UIViewController

@property (strong, nonatomic) Loader *loader;

@property (strong, nonatomic) IBOutlet UITextView *textView;

@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;

@property (strong, nonatomic) IBOutlet UITextField *textField;

-(void) performLoadingWithGETRequest;
-(void) performLoadingWithPOSTRequest;

@end
