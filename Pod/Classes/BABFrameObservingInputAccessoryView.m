//
//  BABFrameObservingInputAccessoryView.m
//
//  Created by Bryn Bodayle on October/21/2014.
//  Copyright (c) 2014 Bryn Bodayle. All rights reserved.
//

#import "BABFrameObservingInputAccessoryView.h"

static void *BABFrameObservingContext = &BABFrameObservingContext;

@interface BABFrameObservingInputAccessoryView()

@property (nonatomic, assign, getter=isObserverAdded) BOOL observerAdded;

@end

@implementation BABFrameObservingInputAccessoryView

#pragma mark - Object Lifecycle

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.userInteractionEnabled = NO;
    }
    return self;
}

- (void)dealloc {
    
    if(_observerAdded) {
        
        [self.superview removeObserver:self forKeyPath:@"frame" context:BABFrameObservingContext];
        [self.superview removeObserver:self forKeyPath:@"center" context:BABFrameObservingContext];
    }
}

#pragma mark - Setters & Getters

- (CGRect)inputAcesssorySuperviewFrame {
    
    return self.superview.frame;
}

#pragma mark - Overwritten Methods

- (void)willMoveToSuperview:(UIView *)newSuperview {
    
    
    if(self.isObserverAdded) {
        
        [self.superview removeObserver:self forKeyPath:@"frame" context:BABFrameObservingContext];
        [self.superview removeObserver:self forKeyPath:@"center" context:BABFrameObservingContext];
    }
    
    [newSuperview addObserver:self forKeyPath:@"frame" options:0 context:BABFrameObservingContext];
    [newSuperview addObserver:self forKeyPath:@"center" options:0 context:BABFrameObservingContext];
    self.observerAdded = YES;
    
    [super willMoveToSuperview:newSuperview];
}

#pragma mark - Observation

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    
    if (object == self.superview && ([keyPath isEqualToString:@"frame"] || [keyPath isEqualToString:@"center"])) {
        
        if(self.inputAcessoryViewFrameChangedBlock) {
            
            CGRect frame = self.superview.frame;
            self.inputAcessoryViewFrameChangedBlock(frame);
        }
    }
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    CGRect frame = self.superview.frame;
    if(self.inputAcessoryViewFrameChangedBlock){
        self.inputAcessoryViewFrameChangedBlock(frame);
    }
}

@end
