//
//  ViewController.swift
//  GymTimer
//
//  Created by Hisma Mulya S on 11/10/16.
//  Copyright © 2016 mamaz. All rights reserved.
//

import UIKit
import SnapKit

class GTSetupViewController: UIViewController {
    
    private lazy var descriptionLabel = UILabel()
    private lazy var counterLabel = UILabel()
    private lazy var stepper = UIStepper()
    private lazy var startButton = UIButton()
    
    
    // the compiler for swift 2.3 / 3 
    // require this
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    convenience init(flowController: AnyObject, viewModel: AnyObject) {
        self.init()
        // overridden construct here
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.title = "Setup View"
        
        self.setUpDescriptionLabel()
        self.setUpCounterLabel()
        self.setUpStepper()
        self.setUpStartButton()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    // Views
    
    private func setUpDescriptionLabel() {
        self.descriptionLabel.text = "Please select how many reps you want to finish today:"
        self.descriptionLabel.lineBreakMode = .byWordWrapping
        self.descriptionLabel.numberOfLines = 0
        self.view.addSubview(self.descriptionLabel)
        self.descriptionLabel.snp.makeConstraints { make in
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.top.equalTo(70)
            make.height.greaterThanOrEqualTo(30.0)
        }
    }
    
    private func setUpCounterLabel() {
        self.counterLabel.text = "0"
        self.counterLabel.font = UIFont(name: "Avenir", size: 50)
        self.view.addSubview(self.counterLabel)
        
        self.counterLabel.snp.makeConstraints { make in
            make.centerX.equalTo(self.view)
            make.top.equalTo(self.descriptionLabel.snp.bottom).offset(15)
            make.width.equalTo(30)
            make.height.equalTo(50)
        }
    }
    
    private func setUpStepper() {
        self.view.addSubview(stepper);
        
        self.stepper.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.height.equalTo(30)
            make.top.equalTo(self.counterLabel.snp.bottom).offset(10.0)
            make.centerX.equalTo(self.view)
        }
    }
    
    private func setUpStartButton() {
        let startText = "Start Training"
        self.startButton.setTitle(startText, for: .normal)
        self.startButton.setTitle(startText, for: .highlighted)
        self.startButton.setTitleColor(UIColor.black, for: .normal)
        self.startButton.setTitleColor(UIColor.black, for: .highlighted)
        self.view.addSubview(self.startButton);
        
        self.startButton.snp.makeConstraints { make in
            make.width.equalTo(150)
            make.height.equalTo(30)
            make.top.equalTo(self.stepper.snp.bottom).offset(20.0)
            make.centerX.equalTo(self.stepper)
        }
    }

}
