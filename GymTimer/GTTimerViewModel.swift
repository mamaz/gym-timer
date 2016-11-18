//
//  GTTimerViewModel.swift
//  GymTimer
//
//  Created by Hisma Mulya S on 11/10/16.
//  Copyright © 2016 mamaz. All rights reserved.
//

import UIKit
import Foundation

enum TimerMode {
    case Workout
    case Rest
    case Finish
}

protocol GTTimerViewModelDelegate: class {
    func didTick(time: String, mode: TimerMode) -> Void
}

class GTTimerViewModel: NSObject {
    
    public var counter: Int = 1
    public weak var delegate: GTTimerViewModelDelegate?
    
    private var timer: Timer?
    private var workTime: Int = Constants.defaultWorkoutTime
    private var restTime: Int = Constants.defaultRestTime
    private var mode: TimerMode = .Workout
    
    
    init(counter: Int) {
        self.counter = counter
        super.init()
    }
    
    public func start(delegate: GTTimerViewModelDelegate?) {
        self.delegate = delegate
        self.timer = Timer.scheduledTimer(timeInterval: 1.0,
                                          target: self,
                                          selector: #selector(update),
                                          userInfo: nil,
                                          repeats: true)
        self.counter -= 1
    }
    
    @objc private func update(timer:Timer) {
        if self.counter < 0 {
            return;
        }
        
        switch self.mode {
            case .Workout:
                self.workTime -= 1
                self.delegate?.didTick(time: String(self.workTime), mode: .Workout)
                
                if self.workTime == 0 {
                    self.mode = .Rest
                    self.resetTimer()
                }
            
            case .Rest:
                self.restTime -= 1
                self.delegate?.didTick(time: String(self.restTime), mode: .Rest)
                
                if self.restTime == 0 {
                    self.mode = .Workout
                    self.counter -= 1
                    self.resetTimer()
                }
                
                if self.counter < 0 {
                    self.timer?.invalidate()
                    self.timer = nil
                    
                    self.delegate?.didTick(time: String(0), mode: .Finish)
                    self.resetTimer()
                }
            
            default:
                print("default")
        }
    }
    
    private func resetTimer(){
        self.workTime = 20
        self.restTime = 10
    }
}

