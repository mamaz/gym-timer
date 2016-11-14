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
    
    lazy var timerLabel = UILabel()
    
    convenience init() {
        self.init()
        setTimerLabel()
    }
    
    func setTimerLabel() -> Void{
        self.addSubview(timerLabel)
        self.timerLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(150)
            make.height.equalTo(50)
        }
    }
}
