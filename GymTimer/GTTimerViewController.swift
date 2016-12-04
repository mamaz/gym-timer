//
//  GTTimerViewController.swift
//  GymTimer
//
//  Created by Hisma Mulya S on 11/10/16.
//  Copyright © 2016 mamaz. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import ReactiveCocoa

class GTTimerViewController: UIViewController, GTTimerViewModelDelegate {
    
    private var timerViewModel: GTTimerViewModel?
    private lazy var modeLabel = UILabel()
    private lazy var timerLabel = UILabel()
    private lazy var stopButton = UIButton()
    
    // the compiler for swift 2.3 / 3
    // require this
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    convenience init(viewModel: GTTimerViewModel?) {
        self.init()
        self.timerViewModel = viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        self.title = "Timer"
        self.navigationItem.hidesBackButton = true
        
        self.setUpModeLabel()
        self.setUpCountdownLabel()
        self.setUpStopButton()
        
        self.stopButton.reactive.trigger(for: .touchUpInside).observeValues { [unowned self] in
            self.navigationController?.popViewController(animated: true)
        }
        
        self.timerViewModel?.start(delegate: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // delegates
    func didTick(time: String, mode: TimerMode) {
        print("Time \(time) and mode \(mode)")
        self.modeLabel.text = "\(mode)"
        self.timerLabel.text = time
    }
    
    func didFinishTicking() {
        self.modeLabel.text = "Finish"
        self.stopButton.setTitle("Finish", for: .normal)
    }
    
    // views
    private func setUpModeLabel() {
        self.modeLabel.text = "Workout"
        self.modeLabel.textAlignment = .center
        self.modeLabel.font = UIFont.largeAvenir()
        self.view.addSubview(self.modeLabel)
        
        self.modeLabel.snp.makeConstraints { make in
            make.top.equalTo(74)
            make.centerX.equalTo(self.view)
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.height.equalTo(30)
        }
    }
    
    private func setUpCountdownLabel() {
        self.timerLabel.text = String(Constants.defaultWorkoutTime)
        self.timerLabel.textAlignment = .center
        self.timerLabel.font = UIFont.hugeAvenir()
        self.view.addSubview(self.timerLabel)
        
        self.timerLabel.snp.makeConstraints { make in
            make.centerX.equalTo(self.view)
            make.top.equalTo(self.modeLabel.snp.bottom).offset(20)
            make.height.equalTo(50)
            make.width.equalTo(100)
        }
    }
    
    private func setUpStopButton() {
        self.stopButton.setTitle("Stop", for: .normal)
        self.stopButton.backgroundColor = UIColor.darkGray
        self.stopButton.layer.cornerRadius = 2.0
        self.stopButton.layer.masksToBounds = true
        self.view.addSubview(self.stopButton)
        
        self.stopButton.snp.makeConstraints { make in
            make.centerX.equalTo(self.view)
            make.top.equalTo(self.timerLabel.snp.bottom).offset(20)
            make.left.equalTo(30)
            make.right.equalTo(-30)
            make.height.equalTo(30)
        }
    }
    
    deinit {
        print("deinit on GTTimerViewController")
        self.timerViewModel = nil
    }
}
