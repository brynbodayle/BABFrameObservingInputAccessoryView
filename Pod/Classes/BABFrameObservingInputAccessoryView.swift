//
//  ObserverView.swift
//  NTInputbar
//
//  Created by Nicholas Tau on 3/30/16.
//  Copyright © 2016 JJ. All rights reserved.
//  https://github.com/brynbodayle/BABFrameObservingInputAccessoryView
//  rewrited in swift
//

import UIKit

class BABFrameObservingInputAccessoryView: UIView {
    var inputAccessoryViewFramwChanged :(CGRect -> Void)?
    var observerAdded = false
    let BABFrameObservingContext: UnsafeMutablePointer<Void> = nil
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commitInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        commitInit()
    }
    
    private func commitInit(){
        userInteractionEnabled = false
    }
    
    deinit{
        if observerAdded{
            self.superview?.removeObserver(self, forKeyPath:"frame", context: BABFrameObservingContext)
            self.superview?.removeObserver(self, forKeyPath: "center", context: BABFrameObservingContext)
        }
    }
    
    func inputAcesssorySuperviewFrame() -> CGRect {
        return (self.superview?.frame)!
    }
    
    override func willMoveToSuperview(newSuperview: UIView?) {
        if observerAdded {
            self.superview?.removeObserver(self, forKeyPath: "frame", context: BABFrameObservingContext)
            self.superview?.removeObserver(self, forKeyPath: "center", context: BABFrameObservingContext)
        }
        newSuperview?.addObserver(self, forKeyPath: "frame", options: .New, context: BABFrameObservingContext)
        newSuperview?.addObserver(self, forKeyPath: "center", options: .New, context: BABFrameObservingContext)
        observerAdded = true
        superview?.willMoveToSuperview(newSuperview)
    }
    
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        if object as? UIView == self.superview && (keyPath == "frame" || keyPath == "center"){
            if self.inputAccessoryViewFramwChanged != nil {
                self.inputAccessoryViewFramwChanged?((self.superview?.frame)!)
            }
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if self.inputAccessoryViewFramwChanged != nil {
            self.inputAccessoryViewFramwChanged?((self.superview?.frame)!)
        }
    }
}

