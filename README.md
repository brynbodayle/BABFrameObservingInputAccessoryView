# BABFrameObservingInputAccessoryView

A simple view which allows for an iOS Messages style keyboard input view and panning behavior. 

![Sample Project](http://www.brynbodayle.com/Files/BABFrameObservingInputAccessoryView.gif)

Supports iOS 7.0+

* Free of method swizzling
* No associated objects or other runtime hacks
* Works easily with or without Auto Layout
* Tested on iOS 7, iOS 8, iPhone & iPad

This is a UIView subclass which allows for observing the frame of a UITextView or UITextField's inputAcessoryView. This allows your to keep the text field above the keyboard as it moves. Also this allows for interactive keyboard dismissal using UIScrollView's keyboardDismissMode property.


## Sample Code & Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

Here is a sample viewDidLoad implementation.
```objective-c
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeInteractive;
    
    BABFrameObservingInputAccessoryView *inputView = [[BABFrameObservingInputAccessoryView alloc] init];
    inputView.userInteractionEnabled = NO;
    
    self.textField.inputAccessoryView = inputView;
    
    __weak typeof(self)weakSelf = self;
    
    inputView.keyboardFrameChangedBlock = ^(BOOL keyboardVisible, CGRect keyboardFrame){
        
        CGFloat value = CGRectGetHeight(weakSelf.view.frame) - CGRectGetMinY(keyboardFrame);
        weakSelf.toolbarContainerVerticalSpacingConstraint.constant = MAX(0, value);
        [weakSelf.view layoutIfNeeded];
        
    };
}
```


## Requirements

- Requires iOS 7.0+

## Installation

BABFrameObservingInputAccessoryView is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

    pod 'BABFrameObservingInputAccessoryView'

## Author

Bryn Bodayle, bryn.bodayle@gmail.com

## License

BABFrameObservingInputAccessoryView is available under the MIT license. See the LICENSE file for more info.

