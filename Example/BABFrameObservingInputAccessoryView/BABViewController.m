//
//  BABViewController.m
//  BABFrameObservingInputAccessoryView
//
//  Created by Bryn Bodayle on 02/14/2015.
//  Copyright (c) 2014 Bryn Bodayle. All rights reserved.
//

#import "BABViewController.h"
#import "BABFrameObservingInputAccessoryView.h"

@interface BABViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *toolbarContainerVerticalSpacingConstraint;

@end

@implementation BABViewController

#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeInteractive;
    
    BABFrameObservingInputAccessoryView *inputView = [[BABFrameObservingInputAccessoryView alloc] init];
    inputView.userInteractionEnabled = NO;
    
    self.textField.inputAccessoryView = inputView;
    
    __weak typeof(self)weakSelf = self;
    
    inputView.keyboardFrameChangedBlock = ^(BOOL keyboardVisible, CGRect keyboardFrame){
        
        //Adjust the offset for different situation, e.g: personal hotspot.. etc
        CGFloat value = CGRectGetHeight([[UIScreen mainScreen] bounds]) - CGRectGetMinY(keyboardFrame);
        weakSelf.toolbarContainerVerticalSpacingConstraint.constant = MAX(0, value);
        [weakSelf.view layoutIfNeeded];
        
    };
}

#pragma mark - Button Targets

- (IBAction)dismiss:(id)sender {
    
    [self.textField resignFirstResponder];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class]) forIndexPath:indexPath];
    cell.textLabel.text = @"Cell";
    
    return cell;
}

@end
