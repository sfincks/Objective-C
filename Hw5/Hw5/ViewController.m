//
//  ViewController.m
//  Hw5
//
//  Created by Артур on 11.04.2024.
//

#import "ViewController.h"
#import "Loader.h"
@interface ViewController ()

@end

@implementation ViewController

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self performLoadingWithGETRequest];
    [self performLoadingWithPOSTRequest];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.loader = [Loader new];

    self.textView = [[UITextView alloc] initWithFrame:self.view.bounds];
    self.textView.editable = NO;
    [self.view addSubview:self.textView];
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(50,50,150,600)];
    self.textField.placeholder = @"Search ya.ru...";
    self.textField.delegate = self;
    [self.view addSubview:self.textField];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self performSearchRequestWithQuery:textField.text];
    [textField resignFirstResponder];
    return YES;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [self performSearchRequestWithQuery:searchBar.text];
    [searchBar resignFirstResponder];
}

- (void)performLoadingWithGETRequest {
    [self.loader performGETRequestForURL:@"https://postman-echo.com/get" arguments:@{@"first": @"first value", @"second": @"second value"} competion:^(NSDictionary * dict, NSError * error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (error) {
                NSLog(@"%@", [NSString stringWithFormat:@"Error: %@", error]);
                return;
            }
            NSLog(@"%@", [NSString stringWithFormat:@"%@", dict]);
        });
    }];
}

- (void)performLoadingWithPOSTRequest {
    [self.loader performPOSTRequestForURL: @"https://postman-echo.com/post" arguments:@{@"first": @"first value", @"second": @"second value"} competion: ^(NSDictionary * dict, NSError * error){
        dispatch_async(dispatch_get_main_queue(), ^{
            if (error) {
                NSLog(@"%@", [NSString stringWithFormat:@"Error: %@", error]);
                return;
            }
            NSLog(@"%@", [NSString stringWithFormat:@"%@", dict]);
        });
    }];
}

- (void)performSearchRequestWithQuery:(NSString *)query {
    NSString *urlString = [NSString stringWithFormat:@"https://www.yandex.ru/search/?text=%@", [query stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]]];
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error);
            return;
        }
        
        NSString *searchResults = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.textView.text = searchResults;
        });
    }];
    
    [dataTask resume];
}

@end
