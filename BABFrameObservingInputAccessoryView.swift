//
//  BABFrameObservingInputAccessoryView.swift
//  Pods
//
//  Created by Nicholas Tau on 3/30/16.
//
//

import UIKit

class BABFrameObservingInputAccessoryView: UIView {
    var inputAccessoryViewFramwChanged :(CGRect -> Void)?
    let observerAdded = false
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commitInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        commitInit()
    }

    private func commitInit(){
        userInteractionEnable = false
    }
    
    deinit{
        if observerAdded{
            self.superview.removeObserver()
        }
    }
}
