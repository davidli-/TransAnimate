//
//  ViewController2.m
//  TransAnimate
//
//  Created by davidli on 2017/2/10.
//  Copyright © 2017年 Taole. All rights reserved.
//

#import "ViewController2.h"
#import "TransitioningDelegate.h"
#import "NavigationDelegate.h"

@interface ViewController2 ()

@property (nonatomic, strong) NavigationDelegate *navigationDelegate;

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


-(void)dealloc
{
}

- (IBAction)onTransAction:(id)sender {
    if (self.navigationController) {
        if (!_navigationDelegate) {
            _navigationDelegate = [NavigationDelegate new];
        }
        self.navigationController.delegate = _navigationDelegate;
        [self.navigationController popViewControllerAnimated:YES];
    }else{
        TransitioningDelegate *transitionDelegate = [TransitioningDelegate new];
        self.transitioningDelegate = transitionDelegate;
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}


@end
