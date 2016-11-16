//
//  GTTimerViewModel.swift
//  GymTimer
//
//  Created by Hisma Mulya S on 11/10/16.
//  Copyright © 2016 mamaz. All rights reserved.
//

import UIKit
import Foundation

protocol GTTimerViewModelDelegate: class {
    func didTick(time: String, mode: String) -> Void
}

class GTTimerViewModel: NSObject {
    enum TimerMode {
        case Work
        case Rest
    }
    
    public weak var delegate: GTTimerViewModelDelegate?
//    private lazy var timer = Timer.scheduledTimer(timeInterval: 1.0,
//                                             target: self,
//                                             selector: #selector(update),
//                                             userInfo: nil,
//                                             repeats: true)
    
    private var workTimer: Int = 20
    private var restTime: Int = 10
    private var mode: TimerMode = .Work
    
    
//    var counter: Int = 0
    override init() {
        super.init()
    }
    
    func start(delegate: GTTimerViewModelDelegate?) {
        self.delegate = delegate
//        self.timer.fire()
//        self.counter -= 1
    }
    
    func update(timer:Timer) {
        print("Update is called")
        
        switch self.mode {
        case .Work:
            print("work")
            
            
        case .Rest:
            print("rest")
        }
    }
    
    
}

