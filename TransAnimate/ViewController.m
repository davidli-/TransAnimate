//
//  ViewController.m
//  TransAnimate
//
//  Created by davidli on 2017/2/10.
//  Copyright © 2017年 Taole. All rights reserved.
//

#import "ViewController.h"
#import "ViewController2.h"
#import "TransitioningDelegate.h"
#import "NavigationDelegate.h"


@interface ViewController ()

@property (nonatomic, strong) NavigationDelegate *navigationDelegate;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}


-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


-(void)dealloc
{
}


- (IBAction)onTransAction:(id)sender
{
    ViewController2 *viewcontroler = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"ViewController2"];

    if (self.navigationController) {
        if (!_navigationDelegate) {
            _navigationDelegate = [NavigationDelegate new];
        }
        self.navigationController.delegate = _navigationDelegate;
        [self.navigationController pushViewController:viewcontroler animated:YES];
    }
    else{
        TransitioningDelegate *transitionDelegate = [TransitioningDelegate new];
        viewcontroler.transitioningDelegate = transitionDelegate;
        [self presentViewController:viewcontroler animated:YES completion:nil];
    }
}

@end
