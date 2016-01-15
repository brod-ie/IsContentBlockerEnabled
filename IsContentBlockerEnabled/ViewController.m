//
//  ViewController.m
//  IsContentBlockerEnabled
//
//  Created by Ryan Brodie on 15/01/2016.
//  Copyright © 2016 Ryan Brodie. All rights reserved.
//

#import "ViewController.h"
#import "SafariServices/SafariServices.h"
#import "Config.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated {
    // Init SFViewController with testPage.html endpoint
    NSURL *url = [NSURL URLWithString:REDIRECT_TEST_PAGE_URL];
    SFSafariViewController *sfvc = [[SFSafariViewController alloc] initWithURL:url];
    
    // Commented out for debugging
    // sfvc.view.hidden = YES;
    
    sfvc.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    
    // Present
    [self presentViewController:sfvc animated:NO completion:^(){}];
    
    // And now, we wait..
    // ⏰
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
