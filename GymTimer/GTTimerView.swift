//
//  GTTimerView.swift
//  GymTimer
//
//  Created by Hisma Mulya S on 11/14/16.
//  Copyright © 2016 mamaz. All rights reserved.
//

import UIKit
import SnapKit

class GTTimerView: UIView {
    
    public var text: String? {
        set {
            self.timerLabel.text = text
        }
        
        get {
            return self.text
        }
    }
    
    private lazy var padding: CGFloat = 15.0
    private lazy var timerLabelHeight: CGFloat = 30
    private lazy var timerLabel = UILabel()
    
    convenience init() {
        self.init()
        setTimerLabel()
    }
    
    private func setTimerLabel() -> Void{
        self.addSubview(timerLabel)
        self.timerLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(self.currentSize().width - (2 * padding))
            make.height.equalTo(timerLabelHeight)
        }
    }
    
    private func currentSize() -> CGSize {
        return self.frame.size == CGSize.zero ?
                                  CGSize(width: 70, height: 30) :
                                  self.frame.size
    }
}
